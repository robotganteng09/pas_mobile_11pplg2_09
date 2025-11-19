import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_09/routes/route.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  Future<void> checkLogin() async {
    await Future.delayed(const Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null && token.isNotEmpty) {
      print("✅ Token ditemukan: $token");
      Get.offAllNamed(AppRoute.dashboardPage);
    } else {
      print("⚠️ Token tidak ditemukan, kembali ke login");
      Get.offAllNamed(AppRoute.LoginPages);
    }
  }
}
