import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ...
import 'package:get/get.dart';
import 'package:reasa/app/data/theme.dart';
import 'package:reasa/app/modules/home/bindings/home_binding.dart';
import 'package:reasa/app/modules/home/controllers/firebase_controller.dart';

import 'app/modules/home/views/welcome_screens/splash_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  Get.put(FirebaseController());

  runApp(ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          theme: primaryTheme,
          defaultTransition: Transition.rightToLeft,
          debugShowCheckedModeBanner: false,
          title: 'Reasa',
          // initialRoute: AppPages.INITIAL,
          //getPages: AppPages.routes,
          home: SplashScreen(),
          initialBinding: HomeBinding(),
        );
      }));
}
