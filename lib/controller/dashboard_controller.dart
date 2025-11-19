import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_09/page/markbook_page.dart';
import 'package:pas_mobile_11pplg2_09/page/profile_page.dart';
import 'package:pas_mobile_11pplg2_09/page/tv_page.dart';


class DashboardController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [TvPage(),MarkbookPage(),ProfilePage()];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
