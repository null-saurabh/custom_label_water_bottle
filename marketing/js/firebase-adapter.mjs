import { initializeApp } from 'firebase/app';
import { getFirestore, collection, addDoc, serverTimestamp } from 'firebase/firestore/lite';
import config from '../../config/firebase-web.json';
import { COLLECTION } from './form-domain.mjs';
if (config.projectId !== 'custom-label-bottle') throw new Error('Unexpected Firebase project');
const db = getFirestore(initializeApp(config));
export function submitEnquiry(payload) {
  return addDoc(collection(db, COLLECTION), { ...payload, createdAt: serverTimestamp() });
}
