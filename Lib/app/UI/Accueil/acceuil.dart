import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water/app/UI/shared/animations/animation.dart';
import 'package:water/app/UI/connectez-vous/login.dart';
import 'package:water/app/UI/shared/animations/navigation.dart';

class Aceuil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 253, 253),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Center(
            child: Column(children: [
              DelaiAnimation(
                delay: 1500,
                child: Container(
                  height: 150,
                  margin: EdgeInsets.only(
                    top: 25,
                  ),
                  child: Image.asset('images/OIP(2).jpeg'),
                ),
              ),
              DelaiAnimation(
                delay: 1800,
                child: Container(
                  height: 30,
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
                delay: 2100,
                child: Container(
                  height: 250,
                  margin: EdgeInsets.only(
                    bottom: 30,
                  ),
                  child: Image.asset('images/OIP5.jpeg'),
                ),
              ),
              DelaiAnimation(
                delay: 2400,
                child: Container(
                  width: 347,
                  height: 80,
                  child: Text(
                    "ESSIVI l'eau qui donne le sourire et la joie au coeur",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.blue,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              DelaiAnimation(
                delay: 2500,
                child: Container(
                  width: 350,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.all(13),
                    ),
                    child: const Text(
                      'COMMENCER',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      if (GetStorage().read('authenticated') == null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => LoginPage()),
                          ),
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => NaviPage()),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ]),
          )),
        ));
  }
}
