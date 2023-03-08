import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class detailsVen extends StatefulWidget {
  @override
  State<detailsVen> createState() => _detailsVenState();
}

class _detailsVenState extends State<detailsVen> {
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        
        elevation: 2,
        backgroundColor: Color.fromARGB(255, 10, 40, 63),
        title: Text(
          "Détails Vente",
          style: GoogleFonts.arbutusSlab(
              color: Color.fromARGB(255, 252, 251, 251), fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          Text(
            "id : ${data[0]}",
            style: TextStyle(fontSize: 25, color: Colors.black),
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
