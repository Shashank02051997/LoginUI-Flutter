import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '../../themes/colors_theme.dart';
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find<LoginController>();
    return Scaffold(
        backgroundColor: ThemeColor.white,
        body: SingleChildScrollView(
            child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: CurvedClipper(),
                  child: Container(
                    color: ThemeColor.primary,
                    height: 500,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 64,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/logo.png'),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "The Tolet",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: ThemeColor.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Find your House",
                                style: TextStyle(
                                    fontSize: 14, color: ThemeColor.black),
                              )
                            ])
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: RiveAnimation.asset(
                        "assets/rive/bear.riv",
                        fit: BoxFit.contain,
                        stateMachines: const ["Login Machine"],
                        onInit: (artboard) {
                          loginController.controller =
                              StateMachineController.fromArtboard(
                            artboard,
                            "Login Machine",
                          );

                          if (loginController.controller == null) return;

                          artboard.addController(loginController.controller!);

                          loginController.isChecking = loginController
                              .controller
                              ?.findInput("isChecking");
                          loginController.lookAtNumber =
                              loginController.controller?.findInput("numLook");
                          loginController.isHandsUp = loginController.controller
                              ?.findInput("isHandsUp");
                          loginController.trigFail =
                              loginController.controller?.findInput("trigFail");
                          loginController.trigSuccess = loginController
                              .controller
                              ?.findInput("trigSuccess");
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(24),
                      child: Column(children: [
                        Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 32,
                              color: ThemeColor.darkBlue,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        TextFormField(
                          focusNode: loginController.emailFocusNode,
                          controller: loginController.emailController,
                          cursorColor: ThemeColor.black,
                          keyboardType: TextInputType.emailAddress,
                          style:
                              TextStyle(color: ThemeColor.black, fontSize: 14),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    const BorderSide(color: ThemeColor.black)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: ThemeColor.grey_500)),
                            label: RichText(
                                text: TextSpan(
                                    text: "Email",
                                    style: const TextStyle(
                                        fontSize: 14, color: ThemeColor.grey),
                                    children: [
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                        color: ThemeColor.red,
                                      ))
                                ])),
                          ),
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          focusNode: loginController.passwordFocusNode,
                          controller: loginController.passwordController,
                          obscureText: loginController.passwordInVisible.value,
                          cursorColor: ThemeColor.black,
                          style:
                              TextStyle(color: ThemeColor.black, fontSize: 14),
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(12),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ThemeColor.black)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ThemeColor.grey_500)),
                              label: RichText(
                                  text: TextSpan(
                                      text: "Password",
                                      style: const TextStyle(
                                          fontSize: 14, color: ThemeColor.grey),
                                      children: [
                                    TextSpan(
                                        text: ' *',
                                        style: TextStyle(
                                          color: ThemeColor.red,
                                        ))
                                  ])),
                              suffixText: "Forgot?",
                              suffixStyle: TextStyle(
                                  fontSize: 14,
                                  color: ThemeColor.black,
                                  fontWeight: FontWeight.bold)),
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                            width: double.infinity,
                            height: 44,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                loginController.login();
                              },
                              icon: Obx(() => Visibility(
                                    visible: loginController.showLoading.value,
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      padding: const EdgeInsets.all(2.0),
                                      child: const CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 3,
                                      ),
                                    ),
                                  )),
                              label: Text("Log in"),
                              style: TextButton.styleFrom(
                                textStyle: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: ThemeColor.black,
                              ),
                            )),
                        SizedBox(height: 44),
                        Text(
                          "Or continue with",
                          style:
                              TextStyle(fontSize: 14, color: ThemeColor.grey),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                  height: 36,
                                  child: ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      "assets/images/google_icon.png",
                                      width: 16,
                                      height: 16,
                                    ),
                                    label: Text(
                                      "Google",
                                      style: TextStyle(
                                          color: ThemeColor.textPrimary),
                                    ),
                                    style: TextButton.styleFrom(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      backgroundColor: ThemeColor.grey_200,
                                    ),
                                  )),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: SizedBox(
                                  height: 36,
                                  child: ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      "assets/images/facebook_icon.png",
                                      width: 16,
                                      height: 16,
                                    ),
                                    label: Text(
                                      "Facebook",
                                      style: TextStyle(
                                          color: ThemeColor.textPrimary),
                                    ),
                                    style: TextButton.styleFrom(
                                      textStyle: TextStyle(
                                          fontSize: 14, color: ThemeColor.grey),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      backgroundColor: ThemeColor.grey_200,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(height: 32),
                        RichText(
                            text: TextSpan(
                                text: "Don't have account?",
                                style: const TextStyle(
                                    fontSize: 14, color: ThemeColor.grey),
                                children: [
                              TextSpan(
                                  text: " Create now",
                                  style: TextStyle(
                                      color: ThemeColor.black,
                                      fontWeight: FontWeight.bold))
                            ])),
                      ]),
                    )
                  ],
                )
              ],
            ),
          ],
        )));
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.75);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.5,
      0,
      size.height * 0.75,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
