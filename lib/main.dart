import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_09/binding/auth_binding.dart';
import 'package:pas_mobile_11pplg2_09/routes/page.dart';
import 'package:pas_mobile_11pplg2_09/routes/route.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      initialRoute: AppRoute.SplashPage,
     getPages: AppPage.pages,
    );
  }
}
