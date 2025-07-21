import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:laundryhub/app.dart';
import 'package:laundryhub/firebase_options.dart';

Future<void> main() async {
  // Todo: Add Widgets Binding
  // Todo: Init Local Storage
  // Todo: Init Payment Methods
  // Todo: Await Native Splash
  // Todo: Initialze Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform).then(
      (FirebaseApp value) => Get.put(AuthenticationRespository()
    ),
  );
  // Todo: Initalize Authentication

  // Load all the Material Design / Themes / Localizations / Bindings
  runApp(const App());
}
