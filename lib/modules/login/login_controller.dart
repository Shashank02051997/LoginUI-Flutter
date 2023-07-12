import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var passwordInVisible = true.obs;
  var showLoading = false.obs;

  //* State Machine Input -> SMI Input bool to trigger actions
  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;

  //* SMI Bool for eyes
  SMIInput<bool>? isChecking;
  SMIInput<bool>? isHandsUp;

  //* SMI for numbers of chars in textfield
  SMIInput<double>? lookAtNumber;

  //* Art Board
  Artboard? artboard;

  //* State Machine Controller
  late StateMachineController? controller;

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void onInit() {
    emailFocusNode.addListener(emailFocus);
    passwordFocusNode.addListener(passwordFocus);
    super.onInit();
  }

  @override
  void onClose() {
    emailFocusNode.removeListener(emailFocus);
    passwordFocusNode.removeListener(passwordFocus);
    super.onClose();
  }

  void emailFocus() {
    isChecking?.change(emailFocusNode.hasFocus);
  }

  void passwordFocus() {
    isHandsUp?.change(passwordFocusNode.hasFocus);
  }

  void login() async {
    emailFocusNode.unfocus();
    passwordFocusNode.unfocus();
    showLoading.value = true;
    //* delay by 2s
    await Future.delayed(
      const Duration(seconds: 2),
    );
    showLoading.value = false;

    if (emailController.text == 'admin@gmail.com' &&
        passwordController.text == "admin")
      trigSuccess?.change(true);
    else
      trigFail?.change(true);
  }
}
