import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/api_service.dart';
import '../utils/sha256_util.dart';

class LoginViewModel extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var errorMessage = ''.obs;

  void login() async {
    if (formKey.currentState!.validate()) {
      String email = emailController.text.trim();
      String password = hashPassword(passwordController.text.trim());

      bool success = await ApiService.login(email, password);

      if (success) {
        Get.offNamed('/home');
      } else {
        errorMessage.value = 'Invalid ID or Password';
      }
    }
  }
}
