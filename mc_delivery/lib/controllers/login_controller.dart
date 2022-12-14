import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mc_delivery/views/home.dart';

class LoginController extends GetxController {
  late TextEditingController email, passwod;
  var focusEmail = FocusNode().obs;
  var focusPassword = FocusNode().obs;
  var isVisible = false.obs;

  void login() {
    if (email.text == 'c' && passwod.text == '1') {
      Get.to(Home());
      Get.snackbar('Sukses', 'Login Berhasil');
    } else {
      Get.snackbar('Gagal', 'Login Gagal');
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    passwod = TextEditingController();
    focusEmail.value = FocusNode();
    focusPassword.value = FocusNode();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    passwod.dispose();
    focusEmail.value.dispose();
    focusPassword.value.dispose();
    super.dispose();
  }
}
