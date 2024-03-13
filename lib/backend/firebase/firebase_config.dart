import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAk1hp3FDnOTSbnc__pmZ017wP_4YJwvb0",
            authDomain: "miventu-11xh54.firebaseapp.com",
            projectId: "miventu-11xh54",
            storageBucket: "miventu-11xh54.appspot.com",
            messagingSenderId: "1032587151500",
            appId: "1:1032587151500:web:7f3bddced14bd0034413a9"));
  } else {
    await Firebase.initializeApp();
  }
}
