
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

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
        elevation: 2,
        backgroundColor: Color.fromARGB(255, 10, 40, 63),
        title: Text(
          "Détails Client",
          style: GoogleFonts.arbutusSlab(
              color: Color.fromARGB(255, 252, 251, 251), fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Center(

      child: Column( 
        children: [
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
        ]
      ),
     ),);
  }
}