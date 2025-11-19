import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pas_mobile_11pplg2_09/component/costum_button.dart';
import 'package:pas_mobile_11pplg2_09/component/costum_textfield.dart';
import 'package:pas_mobile_11pplg2_09/controller/auth_controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final controller = Get.find<AuthController>();

  // TextEditingController agar bisa dipakai reusable component

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register"), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // --------------------
            // INPUT FULLNAME
            // --------------------
            CostumTextfield(
              hintText: "username",
              controller: controller.usernameC,
              isNumber: false,
            ),
            const SizedBox(height: 16),

            // --------------------
            // INPUT USERNAME
            // --------------------
            CostumTextfield(
              hintText: "full name",
              controller: controller.fullnameC,
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
            CostumTextfield(
              hintText: "email",
              controller: controller.emailC,

              isNumber: false,
            ),
            const SizedBox(height: 25),

            // --------------------
            // BUTTON REGISTER
            // --------------------
            Obx(
              () => CostumButton(
                text: controller.isLoading.value ? "Loading..." : "Register",
                textColour: Colors.white,
                onPressed: controller.isLoading.value
                    ? null
                    : () {
                        controller.usernameC.value;
                        controller.passwordC.value;
                        controller.fullnameC.value;
                        controller.emailC.value;
                        controller.register();
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
