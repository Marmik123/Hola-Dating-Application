import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hola/view/splash_screen.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

const String parse_App_ID = "Bi9QJqssEk7Cu8PzAEj07ruJYQeCiGUUr6diqYRs";
const String parse_App_Url = "https://repair.desk.dharmatech.in/parse";
const String parse_MasterKey = "orb6dS4ruOVOBguJ9VuuRD64GAtOOj0PVuPcmKyW";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  await Parse().initialize(parse_App_ID, parse_App_Url,
      masterKey: parse_MasterKey,
      debug: true,
      liveQueryUrl: "wss://repair.desk.dharmatech.in",
      autoSendSessionId: true,
      coreStore: await CoreStoreSharedPrefsImp.getInstance());
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
