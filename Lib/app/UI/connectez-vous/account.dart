import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water/app/controllers/auth_controller.dart';

class Account extends StatelessWidget {
  Account({super.key});
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compte"),
        backgroundColor: const Color.fromARGB(255, 20, 62, 93),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                      width: 5,
                      color: const Color.fromARGB(255, 255, 255, 255)),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(5, 5),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.account_box_rounded,
                  size: 80,
                  color: Color.fromARGB(255, 187, 184, 184),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Nom: ${authController.user.value.firstname}",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Prenom ${authController.user.value.lastname}",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Email: ${authController.user.value.email}",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Numéro de téléphone: ${authController.user.value.phone}",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 8,
                  bottom: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                    onPressed: () {
                      authController.logout();
                    },
                    child: Text("Se déconnecter")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
