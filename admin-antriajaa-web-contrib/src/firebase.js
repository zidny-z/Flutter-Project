import { initializeApp } from "firebase/app";
import { getAuth } from "firebase/auth";
import { getFirestore } from "firebase/firestore";
import { getStorage } from "firebase/storage";

const firebaseConfig = {
  apiKey: process.env.REACT_APP_FIREBASE_KEY,
  authDomain: "super-admin-web-contrib.firebaseapp.com",
  projectId: "super-admin-web-contrib",
  storageBucket: "super-admin-web-contrib.appspot.com",
  messagingSenderId: "822692220708",
  appId: "1:822692220708:web:c0e5df8e4bcd0cbaf26db1"
};
const app = initializeApp(firebaseConfig);
export const db = getFirestore(app);
export const storage = getStorage(app);
export const auth = getAuth();