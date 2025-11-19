import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_09/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
  }
}
