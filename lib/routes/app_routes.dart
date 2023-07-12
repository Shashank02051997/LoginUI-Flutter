import 'package:get/get.dart';

import '../modules/login/login_binding.dart';
import '../modules/login/login_page.dart';
import 'app_pages.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.loginPage,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
