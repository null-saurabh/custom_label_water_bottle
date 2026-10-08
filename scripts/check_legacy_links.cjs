const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const source = fs.readFileSync('marketing/site.js', 'utf8');
for (const [hash, expected] of [['#/','/'],['#/contact','/contact'],['#/inquiry','/inquiry'],['#/inquiry?source=old','/inquiry?source=old'],['#/admin','/'],['#/admin/','/'],['#samples',undefined],['#/unknown',undefined],['#//evil.example/inquiry','/inquiry']]) {
  let actual;
  vm.runInNewContext(source,{URL,navigator:{},window:{location:{hash,origin:'https://sauravcloud.online',replace:v=>actual=v},addEventListener:()=>{}}});
  assert.equal(actual,expected,hash);
}
console.log('PASS: known legacy bookmarks, queries, admin removal, ordinary anchors and same-origin destinations');
