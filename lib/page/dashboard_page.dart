import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pas_mobile_11pplg2_09/controller/dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.blue),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mark_as_unread_outlined, color: Colors.blue),
              label: "Mark",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.blue),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
