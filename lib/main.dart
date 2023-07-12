import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'modules/login/login_binding.dart';
import 'modules/login/login_page.dart';
import 'routes/app_routes.dart';
import 'themes/colors_theme.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Login',
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
      ).copyWith(
          colorScheme:
              ThemeData().colorScheme.copyWith(primary: ThemeColor.primary)),
      home: LoginPage(),
      initialBinding: LoginBinding(),
      getPages: AppPages.pages,
    );
  }
}
