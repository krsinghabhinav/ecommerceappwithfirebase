import 'package:ecommerceappwithfirebase/data/repositories/authentications_repo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'my_app.dart';
import 'package:get_storage/get_storage.dart';

import 'utils/helpers/network_manager.dart';

late SharedPreferences pref;

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  pref = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(AuthenticationsRepoController());
  });
  Get.put(NetworkManager());

  runApp(MyApp());
}
