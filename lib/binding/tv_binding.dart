import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_09/controller/auth_controller.dart';
import 'package:pas_mobile_11pplg2_09/controller/tv_controller.dart';

class TvBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TvController>(() => TvController());
  }
}
