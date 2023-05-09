import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:water/app/controllers/vente_controller.dart';

class detailsVen extends StatefulWidget {
  @override
  State<detailsVen> createState() => _detailsVenState();
}

class _detailsVenState extends State<detailsVen> {
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    var details = data.details;
    var sum = 0.0;
    details.forEach((el) {
      sum += el.prix;
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: const Color.fromARGB(255, 20, 62, 93),
        title: Text(
          "Détails de la vente",
          style: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 252, 251, 251),
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          "Date : ${data.date_vente}",
          style: const TextStyle(
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Nom du client : ${data.nom_client}",
          style: const TextStyle(
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Telephone : ${data.num_client}",
          style: const TextStyle(
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Prix Total : $sum",
          style: const TextStyle(
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 5,
            right: 5,
          ),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 227, 227, 227),
            border: Border.all(
              color: const Color.fromARGB(255, 208, 206, 206),
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              height: 200,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        "Produit",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Qte",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Prix",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: details.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 100,
                              child: Text(details[index].nom_produit ?? " "),
                            ),
                            SizedBox(
                                width: 40,
                                child: Text(details[index].qte.toString())),
                            Text(details[index].prix.toString()),
                          ],
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
