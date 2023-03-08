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
        backgroundColor: Color.fromARGB(255, 10, 40, 63),
        title: Text(
          "Détails Commande",
          style: GoogleFonts.arbutusSlab(
              color: Color.fromARGB(255, 252, 251, 251), fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          Text(
            "nom : ${data[0]}",
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          Text(
            "telephone : ${data[1]}",
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ]),
      ),
    );
  }
}
