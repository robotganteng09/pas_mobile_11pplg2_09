import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_09/controller/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();

    const String dummyUsername = "Arsya Muhammad Faisyar";
    const String dummyEmail = "arsyafaisyar@gmail.com";

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // ---------------- PROFILE CARD ----------------
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
             child: Container(
                child: Column(
                  children: [
                    // Avatar
                   Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey, // background icon
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                
                    // Username
                    Text(
                      dummyUsername,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                
                    const SizedBox(height: 5),
                
                    // Email
                    Text(
                      dummyEmail,
                      style: const TextStyle(fontSize: 15, color: Colors.white70),
                    ),
                
                    const SizedBox(height: 20),
                
                    // Divider
                    Container(
                      width: 200,
                      height: 1.2,
                      color: Colors.white.withOpacity(0.5),
                    ),
                
                    const SizedBox(height: 15),
                
                    // Extra Info Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _infoBox(Icons.bookmark, "Saved", "12"),
                        _infoBox(Icons.star, "Rating", "4.9"),
                        _infoBox(Icons.favorite, "Likes", "32"),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),

           
      
            const SizedBox(height: 40),

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
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                ),
                child: const Text(
                  "LOGOUT",
                  style: TextStyle(fontSize: 16, letterSpacing: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- WIDGET: SMALL INFO BOX ----------------
Widget _infoBox(IconData icon, String title, String value) {
  return Column(
    children: [
      Icon(icon, color: Colors.white, size: 28),
      const SizedBox(height: 5),
      Text(
        value,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      Text(title, style: const TextStyle(fontSize: 12, color: Colors.white70)),
    ],
  );
}

// ---------------- WIDGET: SETTING ITEM LIST ----------------
class _settingItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _settingItem(this.icon, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 26, color: Colors.blueAccent),
        const SizedBox(width: 14),
        Text(title, style: const TextStyle(fontSize: 16)),
        const Spacer(),
        const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ],
    );
  }
}
