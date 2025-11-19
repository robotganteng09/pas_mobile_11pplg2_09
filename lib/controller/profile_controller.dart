import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var username = "".obs;
  var email = "".obs;

  @override
  void onInit() {
    loadProfile();
    super.onInit();
  }

  Future<void> loadProfile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    username.value = pref.getString("username") ?? "Unknown";
    email.value = pref.getString("email") ?? "Unknown";
  }
}
