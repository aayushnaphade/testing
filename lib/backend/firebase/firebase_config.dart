import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCvUgNMuQ-RzJEZLJHTnHl7QP9sTrdZ-3c",
            authDomain: "watersupplyomcool.firebaseapp.com",
            projectId: "watersupplyomcool",
            storageBucket: "watersupplyomcool.appspot.com",
            messagingSenderId: "232408373871",
            appId: "1:232408373871:web:619cc3aacb4d7aebb94b9a",
            measurementId: "G-Q6CLNZ04YB"));
  } else {
    await Firebase.initializeApp();
  }
}
