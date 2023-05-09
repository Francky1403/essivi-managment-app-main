import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:water/app/UI/connectez-vous/login.dart';
import 'package:water/app/UI/shared/animations/navigation.dart';
import 'package:water/app/UI/shared/config.dart';
import 'package:water/app/models/produit.dart';
import 'package:water/app/models/user.dart';
import 'package:water/app/services/dio_service.dart';

class AuthController extends GetxController {
  RxBool passwordVisible = false.obs;
  RxBool isLoading = false.obs;
  var user = User(0, "", "", "", "", "", null).obs;

  final loginFormKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    // Simulating obtaining the user name from some local storage
    phoneController.text = '79613855';
    getUser();
    super.onInit();
  }

  @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? validator(String? value) {
    if (value!.isEmpty) {
      return 'Ce champs est obligatoire';
    }
    return null;
  }

  void login() {
    if (loginFormKey.currentState!.validate()) {
      checkUser(phoneController.text, passwordController.text).then((auth) {
        if (auth) {
          Get.snackbar('Connexion', 'Vous vous êtes connectés avec succès',
              icon: const FaIcon(
                FontAwesomeIcons.circleCheck,
              ),
              colorText: Colors.white);
          Get.offAll(NaviPage());
        } else {
          Get.snackbar(
            'Connexion',
            'Numéro de telephone ou mot de passe invalide',
            icon: const FaIcon(
              FontAwesomeIcons.circleXmark,
            ),
          );
        }
        passwordController.clear();
      });
    }
  }

  logout() {
    if (GetStorage().read('authenticated')) {
      GetStorage().remove('authenticated');
    }
    Get.offAll(LoginPage());
  }

  // Api Simulation
  Future<bool> checkUser(String user, String password) async {
    isLoading = true.obs;
    update([2]);
    try {
      var response = await DioService().postMethod(
          "${Config.url}/auth/login", {"phone": user, "password": password});
      if (response.statusCode == 200) {
        GetStorage().write('authenticated', true);
        GetStorage().write('user', response.data);
        isLoading = false.obs;
        return Future.value(true);
      }
    } catch (err) {
      print(err);
    }
    isLoading = false.obs;
    update([2]);
    return Future.value(false);
  }

  getUser() async {
    if (GetStorage().read('authenticated') &&
        GetStorage().read('authenticated') == true) {
      user.value = await User.fromJson(GetStorage().read('user'));
      print(user.value);
    }
  }
}
