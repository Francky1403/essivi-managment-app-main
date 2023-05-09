import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get_storage/get_storage.dart';
import 'package:water/app/UI/formulaire_&_vente/commande.dart';
import 'package:water/app/UI/shared/animations/navigation.dart';
import 'package:water/app/UI/shared/config.dart';
import 'package:water/app/models/commande.dart';
import 'package:water/app/models/detail_com.dart';
import 'package:water/app/models/detail_vente.dart';
import 'package:water/app/models/user.dart';
import 'package:water/app/services/dio_service.dart';

class CommandeController extends GetxController {
  RxList Commandes = RxList();
  RxBool isLoading = true.obs;
  getCommandes() async {
    isLoading.value = true;
    Commandes = RxList.empty(growable: true);
    var response =
        await DioService().getMethod("${Config.url}/commande/nonlivre");
    if (response.statusCode == 200 && response.data['length'] != '0') {
      response.data['commandes'].forEach((el) {
        Commandes.add(Commande.fromJson(el));
      });
      print(Commandes);
      isLoading = false.obs;
    }
    update([1]);
  }

  acceptCommande(Commande com) async {
    isLoading.value = true;
    update([2]);
    var details = List<Detail_vente>.empty(growable: true);
    if (com.details == null || com.details!.isEmpty) {
      Get.snackbar("Erreur",
          "Vous ne pouvez pas accepter une commande qui n'a pas de détails",
          icon: const FaIcon(
            FontAwesomeIcons.xmark,
            color: Colors.redAccent,
          ),
          colorText: Colors.white);
    } else {
      for (var element in com.details!) {
        details.add(Detail_com.toDetailVente(element));
      }

      var dataVente = {
        "user_id": User.fromJson(GetStorage().read("user")).id,
        "client_id": com.user_id,
        "details": Detail_vente.toJson(details)
      };

      var addVente =
          await DioService().postMethod("${Config.url}/vente/add", dataVente);
      if (addVente.statusCode == 200) {
        var response = await DioService()
            .getMethod("${Config.url}/commande/accept/${com.id}");
        if (response.statusCode == 200) {
          Get.snackbar(
            "Succès",
            "La commande a été accepté avec succès",
            colorText: Colors.white,
            icon: FaIcon(
              FontAwesomeIcons.circleCheck,
              color: Colors.green,
            ),
          );
          getCommandes();
          Get.off(NaviPage());
        } else {
          Get.snackbar("Erreur",
              "Une erreur est survenue lors l'acceptation de la commande",
              icon: const FaIcon(
                FontAwesomeIcons.xmark,
                color: Colors.redAccent,
              ),
              colorText: Colors.white);
        }
      } else {
        Get.snackbar("Erreur",
            "Une erreur est survenue lors l'acceptation de la commande",
            icon: const FaIcon(
              FontAwesomeIcons.xmark,
              color: Colors.redAccent,
            ),
            colorText: Colors.white);
      }
      isLoading.value = false;
      update([2]);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getCommandes();
    super.onInit();
  }
}
