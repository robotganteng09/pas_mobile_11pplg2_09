import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_09/controller/auth_controller.dart';


class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
