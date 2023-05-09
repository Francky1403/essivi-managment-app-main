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
          "Détails du Client",
          style: GoogleFonts.poppins(
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
                "Date de création : ${data.created_at}",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Text(
                "Nom : ${data.name}",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Text(
                "Telephone : ${data.phone}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
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
