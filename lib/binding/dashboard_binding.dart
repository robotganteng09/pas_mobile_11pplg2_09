import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_09/controller/dashboard_controller.dart';
import 'package:pas_mobile_11pplg2_09/controller/profile_controller.dart';
import 'package:pas_mobile_11pplg2_09/controller/tv_controller.dart';


class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<TvController>(() => TvController());
    Get.lazyPut<ProfileController>(() => ProfileController());
   
  }
}
