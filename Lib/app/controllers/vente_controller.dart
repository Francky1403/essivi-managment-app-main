import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:water/app/models/client.dart';
import 'package:get/get.dart';
import 'package:water/app/models/detail_vente.dart';
import 'package:water/app/UI/shared/config.dart';
import 'package:water/app/models/produit.dart';
import 'package:water/app/models/user.dart';
import 'package:water/app/models/vente.dart';
import 'package:water/app/services/dio_service.dart';

// the class that handle the business logic of the model produit
class VenteController extends GetxController {
  RxBool isLoading = false.obs;
  RxList produits = RxList([]);
  RxList ventes = RxList([]);
  RxList clients = RxList([]);
  RxList<Detail_vente> details = RxList([]);
  Rx<Client> selectedClient =
      Rx<Client>(Client(0, "", 0, 0, "", "", DateTime.now()));

  Rx<Produit> selectedProduit = Rx<Produit>(Produit(0, "", 0, 0, "", ""));

  RxDouble totalVente = RxDouble(0);

  updateTotal() {
    totalVente.value = 0;
    details.forEach((element) {
      totalVente.value = element.prix + totalVente.value;
    });
    update([4]);
  }

  var qteController = TextEditingController();

  getProduits() async {
    produits = RxList.empty(growable: true);
    var response = await DioService().getMethod("${Config.url}/produit/all");
    print(response);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        produits.add(Produit.fromJson(element));
      });
      print(produits);
    }
    update([2]); // update the widget

    print(isLoading.value.toString());
  }

  getVentes() async {
    ventes = RxList.empty(growable: true);
    var user_id = User.fromJson(GetStorage().read("user")).id;
    var response =
        await DioService().getMethod("${Config.url}/vente/client/$user_id");
    if (response.statusCode == 200) {
      response.data.forEach((el) {
        ventes.add(Vente.fromJson(el));
      });
      print(ventes);
      update([6]);
    }
  }

  getClients() async {
    clients = RxList.empty(growable: true);
    var response = await DioService().getMethod("${Config.url}/client/all");
    print(response.data);
    if (response.statusCode == 200) {
      response.data.forEach((el) {
        clients.add(Client.fromJson(el));
      });
      print(clients);
    }
    update([1]);
  }

  // getDetails(int id) async {
  //   var response =
  //       await DioService().getMethod("${Config.url}/vente/detail/$id");
  //   print(response.data);
  //   if (response.statusCode == 200) {
  //     response.data.forEach((el) {
  //       details.add(Detail_vente.fromJson(el));
  //     });
  //     print(details);
  //     isLoading = false.obs;
  //   }
  //   //update();
  // }

  String? validator(String? value) {
    if (value!.isEmpty) {
      return 'Entrez une valeur';
    }
    return null;
  }

  addDetails() {
    if (selectedProduit.value.id == 0) {
      Get.snackbar(
        "erreur",
        "Vous devez impérativement choisir un produit",
        icon: const FaIcon(
          FontAwesomeIcons.circleXmark,
          color: Colors.redAccent,
        ),
        colorText: Colors.white,
        duration: const Duration(seconds: 5),
      );
      return null;
    }
    if (details
        .any((element) => element.id_produit == selectedProduit.value.id)) {
      Get.snackbar(
        "erreur",
        "Ce produit est déjà dans la liste",
        icon: const FaIcon(
          FontAwesomeIcons.circleXmark,
          color: Colors.redAccent,
        ),
        colorText: Colors.white,
        duration: const Duration(seconds: 5),
      );
      return null;
    }
    if (int.parse(qteController.text) == 0) {
      Get.snackbar(
        "erreur",
        "Vous ne pouvez pas entrer une quantité nulle",
        icon: const FaIcon(
          FontAwesomeIcons.circleXmark,
          color: Colors.redAccent,
        ),
        colorText: Colors.white,
        duration: const Duration(seconds: 5),
      );
      return null;
    }
    var new_detail = Detail_vente(
        0,
        selectedProduit.value.id,
        int.parse(qteController.text),
        (selectedProduit.value.prix_unit * (int.parse(qteController.text))),
        selectedProduit.value.libelle);
    details.add(new_detail);
    qteController.text = "0";

    updateTotal();
    update([3]);
  }

  void removeDetail(Detail_vente detail) {
    details.remove(detail);
    update([3]);
    updateTotal();
  }

  validateAll() {
    if (selectedClient.value.id == 0) {
      Get.snackbar(
        "erreur",
        "Vous devez impérativement choisir un client",
        icon: const FaIcon(
          FontAwesomeIcons.circleXmark,
        ),
        colorText: Colors.white,
        duration: const Duration(seconds: 5),
      );
      return false;
    }
    if (details.isEmpty) {
      Get.snackbar(
        "erreur",
        "Vous n'avez entré aucun détail de la vente",
        icon: const FaIcon(
          FontAwesomeIcons.circleXmark,
          color: Colors.redAccent,
        ),
        colorText: Colors.white,
        duration: const Duration(seconds: 5),
      );
      return false;
    }
    return true;
  }

  addVente() async {
    if (validateAll()) {
      isLoading.value = true;
      update([5]);
      var dataVente = {
        "user_id": User.fromJson(GetStorage().read("user")).id,
        "client_id": selectedClient.value.id,
        "details": Detail_vente.toJson(details)
      };

      var response =
          await DioService().postMethod("${Config.url}/vente/add", dataVente);

      if (response.statusCode == 200) {
        Get.snackbar(
          "succès",
          "Vente enregistrée",
          icon: const FaIcon(
            FontAwesomeIcons.circleCheck,
            color: Colors.greenAccent,
          ),
          colorText: Colors.white,
          duration: const Duration(seconds: 5),
        );
      } else {
        Get.snackbar(
          "erreur",
          "Erreur lors de l'enregistrement de la vente : ${response.data['Msg']}",
          icon: const FaIcon(
            FontAwesomeIcons.circleXmark,
            color: Colors.greenAccent,
          ),
          colorText: Colors.white,
          duration: const Duration(seconds: 5),
        );
      }
      isLoading.value = false;
      qteController.text = "0";
      details = RxList.empty(growable: true);
      selectedClient = Rx<Client>(Client(0, "", 0, 0, "", "", DateTime.now()));
      updateTotal();
      update([3, 4, 5]);
      getVentes();
    }
  }

  @override
  void onInit() {
    qteController.text = "0";
    getProduits();
    getClients();
    getVentes();
    print("hello");
    super.onInit();
  }
}
