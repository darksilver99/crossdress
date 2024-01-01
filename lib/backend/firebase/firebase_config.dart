import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAfOqWgqWkG79LLT2cnjcub_TbX3Cdehpc",
            authDomain: "crossdress-acmrmz.firebaseapp.com",
            projectId: "crossdress-acmrmz",
            storageBucket: "crossdress-acmrmz.appspot.com",
            messagingSenderId: "832886275457",
            appId: "1:832886275457:web:f9df7f88c5efeec9ea3c80"));
  } else {
    await Firebase.initializeApp();
  }
}
