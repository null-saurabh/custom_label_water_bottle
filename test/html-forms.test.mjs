import test from 'node:test';
import assert from 'node:assert/strict';
import { readFile } from 'node:fs/promises';
import { JSDOM } from 'jsdom';
import { createPayload, validate, QUANTITIES, BOTTLE_SIZES, BUSINESS_TYPES, COLLECTION } from '../marketing/js/form-domain.mjs';
import { bindForm } from '../marketing/js/form-controller.mjs';

const fixture = { businessName:'  Fixture brand ', contactName:' Fixture person ', phone:' 9000000000 ', email:' optional ', businessType:'', monthlyQuantity:'5x00 packs', bottleSizes:['1 L','250 ml'], city:' City ', state:' State ', deliveryLocation:' Location ', notes:' Notes ' };

test('inquiry contract matches the original Dart schema, trim and optional fields',()=>{
 const payload=createPayload(fixture,'inquiry');
 assert.deepEqual(payload,{businessName:'Fixture brand',contactName:'Fixture person',phone:'9000000000',email:'optional',businessType:'',monthlyQuantity:'5x00 packs',bottleSizes:['1 L','250 ml'],city:'City',state:'State',deliveryLocation:'Location',notes:'Notes',status:'new'});
 assert.deepEqual(validate(payload,'inquiry'),{});
 assert.equal(COLLECTION,'enquiries');
});
test('contact uses businessName and resets unrelated fields, preserving original validation',()=>{
 const payload=createPayload({...fixture,name:' Person ',message:' Hello '},'contact');
 assert.deepEqual(payload,{businessName:'Person',contactName:'',phone:'9000000000',email:'optional',businessType:'',monthlyQuantity:'',bottleSizes:[],city:'',state:'',deliveryLocation:'',notes:'Hello',status:'new'});
 assert.deepEqual(validate(payload,'contact'),{});
 assert.equal(validate({...payload,phone:'123'},'contact').phone,'Enter a valid 10-digit number');
});
test('empty and invalid submissions match original error copy',()=>{
 assert.deepEqual(validate(createPayload({},'inquiry'),'inquiry'),{businessName:'Business name is required',phone:'Mobile number is required',monthlyQuantity:'Please select monthly quantity',bottleSizes:'Select at least one bottle size'});
 for(const phone of ['5000000000','+919000000000','900000000','90000000000','abcdefghij']) assert.equal(validate({...createPayload(fixture,'inquiry'),phone},'inquiry').phone,'Enter a valid 10-digit mobile number');
 assert.deepEqual(validate(createPayload({},'contact'),'contact'),{name:'Name is required',phone:'Mobile number is required'});
});
for(const kind of ['contact','inquiry']) test(`${kind}: real DOM invalid, pending, success, failure and retry with fake adapter`,async()=>{
 const html=await readFile(new URL(`../marketing/${kind}.html`,import.meta.url),'utf8');
 const dom=new JSDOM(html); // No resources or scripts execute; no network.
 const {document,FormData,Event}=dom.window;
 const previous=globalThis.FormData;globalThis.FormData=FormData;
 try{
  const form=document.querySelector('form'), button=form.querySelector('button[type=submit]');
  assert.equal(button.disabled,true);
  let calls=[],resolve,reject;
  const dispose=bindForm(form,payload=>{calls.push(payload);return new Promise((yes,no)=>{resolve=yes;reject=no;});});
  form.dispatchEvent(new Event('submit',{cancelable:true}));
  assert.equal(calls.length,0);
  assert.equal(form.querySelector('[name=phone]').getAttribute('aria-invalid'),'true');
  const values=kind==='contact'?{name:' Person ',phone:'9000000000',email:'optional',message:' Hello '}:fixture;
  for(const [key,value]of Object.entries(values)){
   if(key==='bottleSizes'){for(const field of form.querySelectorAll('[name=bottleSizes]'))field.checked=value.includes(field.value);}
   else if(key==='businessType')continue;
   else if(form.elements.namedItem(key))form.elements.namedItem(key).value=value;
  }
  form.dispatchEvent(new Event('submit',{cancelable:true}));
  assert.equal(calls.length,1);assert.equal(button.disabled,true);
  form.dispatchEvent(new Event('submit',{cancelable:true}));assert.equal(calls.length,1);
  resolve();await new Promise(r=>setImmediate(r));
  assert.equal(button.disabled,false);
  assert.equal(form.querySelector('[role=status]').textContent,kind==='contact'?'Message sent successfully':'Enquiry submitted successfully');
  assert.equal(form.elements.phone.value,kind==='contact'?'':' 9000000000 ');
  if(kind==='contact'){form.elements.name.value='Again';form.elements.phone.value='9000000000';}
  form.dispatchEvent(new Event('submit',{cancelable:true}));assert.equal(calls.length,2);
  reject(new Error('mock offline'));await new Promise(r=>setImmediate(r));
  assert.equal(form.querySelector('[role=status]').textContent,kind==='contact'?'Something went wrong':'Something went wrong. Try again.');
  assert.equal(button.disabled,false);assert.notEqual(form.elements.phone.value,'');
  dispose();
 }finally{globalThis.FormData=previous;dom.window.close();}
});
test('HTML option values match source contracts; labels stay in initial markup',async()=>{
 const dom=new JSDOM(await readFile(new URL('../marketing/inquiry.html',import.meta.url),'utf8'));
 const doc=dom.window.document;
 assert.deepEqual([...doc.querySelectorAll('[name=businessType]')].map(x=>x.value),BUSINESS_TYPES);
 assert.deepEqual([...doc.querySelectorAll('[name=monthlyQuantity] option')].map(x=>x.value).filter(Boolean),QUANTITIES);
 assert.deepEqual([...doc.querySelectorAll('[name=bottleSizes]')].map(x=>x.value),BOTTLE_SIZES);
 for(const field of doc.querySelectorAll('input,textarea,select'))assert.ok(field.getAttribute('aria-label')||field.closest('label'));
 dom.window.close();
});
test('production adapter adds a server timestamp and cannot switch project or collection',async()=>{
 const adapter=await readFile(new URL('../marketing/js/firebase-adapter.mjs',import.meta.url),'utf8');
 assert.match(adapter,/createdAt: serverTimestamp\(\)/);assert.match(adapter,/addDoc\(collection\(db, COLLECTION\)/);
 const config=JSON.parse(await readFile(new URL('../config/firebase-web.json',import.meta.url),'utf8'));
 assert.equal(config.projectId,'custom-label-bottle');
 assert.doesNotMatch(adapter,/location|searchParams|localStorage|mock/i);
});
