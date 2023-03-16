import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class detailsCom extends StatefulWidget {
  const detailsCom({super.key});

  @override
  State<detailsCom> createState() => _detailsComState();
}

class _detailsComState extends State<detailsCom> {
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;

    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Color.fromARGB(255, 20, 62, 93),
          title: Text(
            "Détails Commande",
            style: GoogleFonts.arbutusSlab(
                color: Color.fromARGB(255, 252, 251, 251), fontSize: 24),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              Text(
                "Nom : ${data[0]}",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              Text(
                "Telephone : ${data[1]}",
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
              Text(
                "Localisation : ${data[1]}",
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
              Text(
                "Produit : ${data[1]}",
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
              const SizedBox(height: 380),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    width: 150,
                    height: 70,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        padding: EdgeInsets.all(13),
                        backgroundColor: Color.fromARGB(255, 4, 170, 57),
                      ),
                      child: Text(
                        'Accepter',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
