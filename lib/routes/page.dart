import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_09/binding/auth_binding.dart';
import 'package:pas_mobile_11pplg2_09/binding/dashboard_binding.dart';
import 'package:pas_mobile_11pplg2_09/binding/splash_binding.dart';
import 'package:pas_mobile_11pplg2_09/binding/tv_binding.dart';
import 'package:pas_mobile_11pplg2_09/page/dashboard_page.dart';
import 'package:pas_mobile_11pplg2_09/page/login_page.dart';
import 'package:pas_mobile_11pplg2_09/page/markbook_page.dart';
import 'package:pas_mobile_11pplg2_09/page/profile_page.dart';
import 'package:pas_mobile_11pplg2_09/page/register_page.dart';
import 'package:pas_mobile_11pplg2_09/page/splash_page.dart';
import 'package:pas_mobile_11pplg2_09/page/tv_page.dart';
import 'package:pas_mobile_11pplg2_09/routes/route.dart';

class AppPage {
  static final pages = [
    GetPage(name: AppRoute.RegisterPages, page: () => RegisterPage(),binding: AuthBinding()),
    GetPage(name: AppRoute.dashboardPage, page: () => DashboardPage() ,binding: DashboardBinding()),
    GetPage(name: AppRoute.LoginPages, page: () => LoginPage(),binding: AuthBinding()),
    GetPage(name: AppRoute.TvPage, page: () => TvPage(),binding: TvBinding()),
    GetPage(name: AppRoute.MarkBookPage, page: () => MarkbookPage(),binding: TvBinding()),
    GetPage(name: AppRoute.ProfilePage, page: () => ProfilePage(),binding: AuthBinding()),
    GetPage(name: AppRoute.SplashPage, page: () => SplashScreenPage(),binding: SplashBinding()),
  ];
}
