import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:water/app/UI/shared/widgets/rechercheProd.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:water/app/controllers/vente_controller.dart';
import 'package:water/app/models/detail_vente.dart';
import 'package:water/app/models/produit.dart';
import 'package:water/app/controllers/vente_simple_controller.dart';

class VenteSipPage extends GetView<VenteSimpleController> {
  VenteSimpleController venteSimpleController =
      Get.put(VenteSimpleController());

  VenteSipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          GetBuilder(
            init: controller,
            id: 1,
            builder: (_) => DropdownSearch<dynamic>(
              popupProps: const PopupProps.menu(
                showSelectedItems: true,
                showSearchBox: true,
              ),
              compareFn: (item1, item2) {
                if (item1 != null && item2 != null) {
                  return item1.id == item2.id;
                }
                return false;
              },
              items: venteSimpleController.produits,
              itemAsString: (c) => "${c.libelle} ${c.prix_unit}",
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  hintText: "Produit",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onChanged: (item) {
                venteSimpleController.selectedProduit.value = item;
                print(item.libelle.toString());
              },
            ),
          ),
          const SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  width: 150,
                  height: 55,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 224, 224, 224),
                    border: Border.all(
                      color: const Color.fromARGB(255, 208, 206, 206),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      validator: controller.validator,
                      controller: controller.qteController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Qte",
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 207, 225, 239),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Ajouter",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  onPressed: () {
                    print("adding detail...");
                    controller.addDetails();
                  },
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
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
            child: SizedBox(
              height: 200,
              child: SingleChildScrollView(
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
                        Text(' ')
                      ],
                    ),
                    GetBuilder(
                      init: controller,
                      id: 2,
                      builder: (_) => ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.details.length,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                      controller.details[index].nom_produit ??
                                          " "),
                                ),
                                SizedBox(
                                    width: 40,
                                    child: Text(controller.details[index].qte
                                        .toString())),
                                Text(controller.details[index].prix.toString()),
                                IconButton(
                                  onPressed: () {
                                    controller.removeDetail(
                                        controller.details[index]);
                                  },
                                  icon: const FaIcon(
                                    FontAwesomeIcons.trash,
                                    size: 15,
                                    color: Color.fromARGB(255, 165, 55, 55),
                                  ),
                                ),
                              ],
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          GetBuilder(
              init: controller,
              id: 3,
              builder: (_) => Text(
                    "Total de la vente : ${venteSimpleController.totalVente.value}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
          const SizedBox(
            height: 10,
          ),
          GetBuilder(
            init: controller,
            id: 4,
            builder: (_) => controller.isLoading.value
                ? Container(
                    height: 100,
                    width: 50,
                    child: Center(
                      child: Lottie.asset("animations/docloader.json",
                          fit: BoxFit.contain, height: 100, width: 50),
                    ),
                  )
                : TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 207, 225, 239),
                      ),
                    ),
                    onPressed: () {
                      controller.addVente();
                      print('vendu');
                    },
                    child: const SizedBox(
                      width: double.maxFinite,
                      height: 30,
                      child: Center(
                        child: Text(
                          'Effectuer la vente',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
          )
        ]),
      ),
    );
  }
}
