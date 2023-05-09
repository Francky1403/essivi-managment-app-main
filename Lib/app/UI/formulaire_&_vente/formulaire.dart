import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:water/app/UI/shared/widgets/HearderWidget.dart';
import 'package:water/app/controllers/client_controller.dart';

class FormPage extends GetView<ClientController> {
  ClientController clientController = Get.put(ClientController());
  var Geolocalisation = "";

  FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      body: SingleChildScrollView(
        child: Form(
          key: controller.clientFormKey,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(20, 10, 25, 10),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                        Icons.person,
                        size: 80,
                        color: Color.fromARGB(255, 187, 184, 184),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          width: 500,
                          height: 55,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 208, 206, 206),
                            border: Border.all(
                              color: const Color.fromARGB(255, 208, 206, 206),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              validator: controller.validator,
                              controller: controller.nomController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Nom",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          width: 500,
                          height: 55,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 208, 206, 206),
                            border: Border.all(
                              color: const Color.fromARGB(255, 208, 206, 206),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              controller: controller.prenomController,
                              validator: controller.validator,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Prénom",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          width: 500,
                          height: 55,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 208, 206, 206),
                            border: Border.all(
                              color: const Color.fromARGB(255, 208, 206, 206),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              controller: controller.phoneController,
                              validator: controller.validator,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Numéro de téléphone",
                              ),
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    GetBuilder(
                      id: 2,
                      init: ClientController(),
                      builder: (_) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Container(
                                width: 200,
                                height: 55,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 208, 206, 206),
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 208, 206, 206),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: Center(
                                    child: Text(
                                        "${clientController.lat.value}, ${clientController.long.value}"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              clientController.getCurrentLocation();
                            },
                            icon: const Icon(
                              Icons.place,
                              color: Color.fromARGB(255, 10, 40, 63),
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          width: 350,
                          height: 55,
                          child: GetBuilder(
                            init: ClientController(),
                            id: 3,
                            builder: (_) => clientController.isLoading.value
                                ? Center(
                                    child: Lottie.asset(
                                        "animations/docloader.json",
                                        fit: BoxFit.fill),
                                  )
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                      padding: const EdgeInsets.all(13),
                                      backgroundColor: const Color.fromARGB(
                                          255, 11, 86, 143),
                                    ),
                                    child: const Text(
                                      'Enregistrer',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    onPressed: () {
                                      controller.addClient();
                                    },
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
