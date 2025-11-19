import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pas_mobile_11pplg2_09/component/costum_button.dart';
import 'package:pas_mobile_11pplg2_09/component/costum_textfield.dart';
import 'package:pas_mobile_11pplg2_09/controller/auth_controller.dart';
import 'package:pas_mobile_11pplg2_09/routes/route.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // --------------------
            // INPUT USERNAME
            // --------------------
            CostumTextfield(
              hintText: "Username",
              controller: controller.usernameC,
              isNumber: false,
            ),
            const SizedBox(height: 16),

            // --------------------
            // INPUT PASSWORD
            // --------------------
            CostumTextfield(
              hintText: "Password",
              controller: controller.passwordC,
              obscureText: true,
              isNumber: false,
            ),
            const SizedBox(height: 25),

            // --------------------
            // BUTTON LOGIN
            // --------------------
            Obx(
              () => CostumButton(
                text: controller.isLoading.value ? "Loading..." : "Login",
                textColour: Colors.white,
                onPressed: controller.isLoading.value
                    ? null
                    : () {
                        controller.usernameC.value;
                        controller.passwordC.value;
                        controller.login();
                      },
              ),
            ),

            const SizedBox(height: 16),

            TextButton(
              onPressed: () {
                Get.toNamed(AppRoute.RegisterPages);
              },
              child: const Text("Belum punya akun? Register"),
            ),
          ],
        ),
      ),
    );
  }
}
