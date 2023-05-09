import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:water/app/controllers/commande_controller.dart';

class detailsCom extends StatefulWidget {
  const detailsCom({super.key});

  @override
  State<detailsCom> createState() => _detailsComState();
}

class _detailsComState extends State<detailsCom> {
  CommandeController commandeController = Get.put(CommandeController());
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
            "Détails Commande",
            style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 252, 251, 251), fontSize: 24),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              SizedBox(
                height: 15,
              ),
              Text(
                "Nom : ${data.nom_client}",
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Telephone : ${data.num_client}",
                style: const TextStyle(fontSize: 25, color: Colors.black),
              ),
              SizedBox(
                height: 15,
              ),
              // Text(
              //   "Localisation : ${}",
              //   style: const TextStyle(fontSize: 25, color: Colors.black),
              // ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child:
                                        Text(details[index].nom_produit ?? " "),
                                  ),
                                  SizedBox(
                                      width: 40,
                                      child:
                                          Text(details[index].qte.toString())),
                                  Text(details[index].prix.toString()),
                                ],
                              );
                            })
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 230),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GetBuilder(
                    init: CommandeController(),
                    id: 2,
                    builder: (_) => commandeController.isLoading.value
                        ? Container(
                            height: 100,
                            width: 55,
                            child: Center(
                              child: Lottie.asset(
                                "animations/docloader.json",
                                fit: BoxFit.contain,
                              ),
                            ),
                          )
                        : Container(
                            width: 300,
                            height: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                padding: const EdgeInsets.all(13),
                                backgroundColor:
                                    const Color.fromARGB(255, 4, 170, 57),
                              ),
                              child: const Text(
                                'Accepter la commande',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              onPressed: () {
                                commandeController.acceptCommande(data);
                              },
                            ),
                          ),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
