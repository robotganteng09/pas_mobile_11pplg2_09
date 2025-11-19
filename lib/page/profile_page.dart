import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pas_mobile_11pplg2_09/controller/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();

    // DUMMY DATA
    const String dummyUsername = "arsya Muhammad Faisyar";
    const String dummyEmail = "arsyafaisyar@gmail.com";

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // ---------------- PROFILE CARD ----------------
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, color: Colors.white, size: 50),
                  ),
                  const SizedBox(height: 20),

                  // Username
                  const Text(
                    "Username",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    dummyUsername,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),

                  const SizedBox(height: 15),

                  // Email
                  const Text(
                    "Email",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    dummyEmail,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),

            const Spacer(),

            // ---------------- LOGOUT BUTTON ----------------
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Logout",
                    middleText: "Yakin ingin logout?",
                    textCancel: "Tidak",
                    textConfirm: "Ya",
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      Get.back();
                      authC.logout();
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("LOGOUT", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
