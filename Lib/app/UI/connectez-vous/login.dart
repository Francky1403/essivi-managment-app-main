import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:water/app/UI/shared/animations/animation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water/app/UI/shared/animations/navigation.dart';
import 'package:water/app/controllers/auth_controller.dart';

class LoginPage extends GetView<AuthController> {
  AuthController authController = Get.put(AuthController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Form(
              key: controller.loginFormKey,
              child: Column(children: [
                DelaiAnimation(
                  delay: 1350,
                  child: Container(
                    height: 150,
                    margin: const EdgeInsets.only(
                      top: 35,
                    ),
                    child: Image.asset('images/OIP(2).jpeg'),
                  ),
                ),
                DelaiAnimation(
                  delay: 1400,
                  child: Container(
                    height: 80,
                    margin: const EdgeInsets.only(),
                    child: Text(
                      "ESSIVI-Sarl",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.blue,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                DelaiAnimation(
                  delay: 1450,
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.only(),
                    child: const Text(
                      'Bienvenue',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                DelaiAnimation(
                  delay: 1500,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      width: 350,
                      height: 55,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 241, 241, 241),
                        border: Border.all(
                            color: const Color.fromARGB(255, 241, 241, 241)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          validator: controller.validator,
                          controller: controller.phoneController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Numéro de Téléphone",
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                DelaiAnimation(
                  delay: 1550,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      width: 350,
                      height: 55,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 241, 241, 241),
                        border: Border.all(
                            color: const Color.fromARGB(255, 241, 241, 241)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          validator: controller.validator,
                          controller: controller.passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Mot de passe',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                GetBuilder<AuthController>(
                  init: AuthController(),
                  id: 2,
                  builder: (_) => DelaiAnimation(
                    delay: 1600,
                    child: authController.isLoading.value
                        ? Container(
                            height: 350,
                            width: 55,
                            child: Center(
                              child: Lottie.asset(
                                "animations/docloader.json",
                                fit: BoxFit.contain,
                              ),
                            ),
                          )
                        : Container(
                            width: 350,
                            height: 55,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                padding: const EdgeInsets.all(13),
                              ),
                              onPressed: () {
                                controller.login();
                              },
                              child: const Text(
                                'Connexion',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
