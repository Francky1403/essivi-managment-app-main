import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:water/app/UI/formulaire_&_vente/maps.dart';

class detailsCli extends StatefulWidget {
  const detailsCli({super.key});

  @override
  State<detailsCli> createState() => _detailsCliState();
}

class _detailsCliState extends State<detailsCli> {
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Color.fromARGB(255, 20, 62, 93),
        title: Text(
          "Détails Client",
          style: GoogleFonts.arbutusSlab(
              color: Color.fromARGB(255, 252, 251, 251), fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: Column(children: [
              Text(
                "Nom : ${data[0]}",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              Text(
                "Nom Société : ${data[1]}",
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
              Text(
                "Telephone : ${data[1]}",
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
              Text(
                "Localisation : ${data[1]}",
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(56),
            ),
            child: maps(),
          ),
        ]),
      ),
    );
  }
}
