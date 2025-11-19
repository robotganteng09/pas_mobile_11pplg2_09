import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_09/network/network.dart';
import 'package:pas_mobile_11pplg2_09/routes/route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final fullnameC = TextEditingController();
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();
  final emailC = TextEditingController();

  var isLoading = false.obs;
  var token = ''.obs;

  void register() async {
    isLoading.value = true;

    final fullname = fullnameC.text.trim();
    final username = usernameC.text.trim();
    final password = passwordC.text.trim();
    final email = emailC.text.trim();

    if (fullname.isEmpty ||
        username.isEmpty ||
        password.isEmpty ||
        email.isEmpty) {
      Get.snackbar("Peringatan", "Semua field wajib diisi");
      isLoading.value = false;
      return;
    }

    final url = Uri.parse("https://mediadwi.com/api/latihan/register-user");
    // final url = Uri.parse("${Network.BASE_URL}/api/latihan/register-user");

    try {
      final response = await http.post(
        url,
        body: {
          "full_name": fullname,
          "username": username,
          "password": password,
          "email": email,
        },
      );

      print("STATUS CODE: ${response.statusCode}");
      print("RESPONSE: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data["status"] == true) {
          Get.snackbar("Sukses", "Register berhasil!");
          Get.offAllNamed(AppRoute.LoginPages);
        } else {
          Get.snackbar("Gagal", data["message"] ?? "Register gagal");
        }
      } else {
        Get.snackbar("Error", "Server tidak merespon");
      }
    } catch (e) {
      print("ERROR: $e");
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    }

    isLoading.value = false;
  }

  
  void login() async {
    isLoading.value = true;

    final username = usernameC.text.trim();
    final password = passwordC.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar("Peringatan", "Username dan password tidak boleh kosong");
      isLoading.value = false;
      return;
    }

    final url = Uri.parse("https://mediadwi.com/api/latihan/login");
    // final url = Uri.parse("${Network.BASE_URL}/api/latihan/login-user");

    try {
      final response = await http.post(
        url,
        body: {"username": username, "password": password},
      );

      print("STATUS CODE: ${response.statusCode}");
      print("RESPONSE: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data["status"] == true) {
          final tokenApi = data["token"] ?? "";

          if (tokenApi.isEmpty) {
            Get.snackbar("Error", "Token dari server kosong");
            isLoading.value = false;
            return;
          }

          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString("token", tokenApi);

          token.value = tokenApi;

          Get.snackbar("Berhasil", "Login berhasil!");
          Get.offAllNamed(AppRoute.dashboardPage);
        } else {
          usernameC.clear();
          passwordC.clear();
          Get.snackbar("Login Gagal", data["message"] ?? "Coba lagi");
        }
      } else {
        Get.snackbar("Error", "Server tidak merespon");
      }
    } catch (e) {
      print("ERROR: $e");
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    }

    isLoading.value = false;
  }

   void logout() async {
    Get.defaultDialog(
      title: "Logout",
      middleText: "Apakah Anda yakin ingin keluar?",
      textCancel: "Tidak",
      textConfirm: "Ya",
      onConfirm: () async {
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.clear();

        token.value = "";

        Get.back(); // tutup dialog
        Get.offAllNamed(AppRoute.LoginPages); // kembali ke login
      },
    );
  }

}
