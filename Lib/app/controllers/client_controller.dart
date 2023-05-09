import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:water/app/UI/shared/config.dart';
import 'package:water/app/models/client.dart';
import 'package:water/app/models/user.dart';
import 'package:water/app/services/dio_service.dart';

class ClientController extends GetxController {
  RxList clients = RxList([]);
  RxBool isLoading = false.obs;
  RxDouble lat = 0.0.obs;
  RxDouble long = 0.0.obs;

  final clientFormKey = GlobalKey<FormState>();
  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final nomSocieteController = TextEditingController();
  final phoneController = TextEditingController();
  final localisationController = TextEditingController();

  getClients() async {
    this.clients = RxList.empty(growable: true);
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

  void getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      Get.snackbar("Localisation",
          "Vous devez autoriser la localisation pour continuer");
      permission = await Geolocator.requestPermission();
    } else {
      Position position = await Geolocator.getCurrentPosition();

      lat.value = position.latitude;
      long.value = position.longitude;
      update();
      print("${lat.value} , ${long.value}");
      localisationController.text = "${lat.value} , ${long.value}";
      update([2]);
    }
  }

  String? validator(String? value) {
    if (value!.isEmpty) {
      return 'Ce champs est obligatoire';
    }
    return null;
  }

  addClient() async {
    if (clientFormKey.currentState!.validate()) {
      isLoading.value = true;
      update([3]);
      var name = "${nomController.text} ${prenomController.text}";
      var user = User.fromJson(GetStorage().read('user'));
      var response = await DioService().postMethod("${Config.url}/client/add", {
        "name": name,
        "phone": phoneController.text,
        "long": long.value,
        "lat": lat.value,
        "user_id": user.id
      });
      if (response.statusCode == 200) {
        Get.snackbar(
          'Succès',
          'Le client a été ajouté avec succès',
          icon: const FaIcon(
            FontAwesomeIcons.circleCheck,
          ),
          colorText: Colors.white,
          duration: const Duration(seconds: 5),
        );
        nomController.clear();
        prenomController.clear();
        phoneController.clear();
        nomSocieteController.clear();
        long.value = 0.0;
        lat.value = 0.0;
        isLoading.value = false;
        update([2, 3]);
        getClients();
      } else if (response.statusCode == 400) {
        Get.snackbar(
          "Erreur",
          response.data['Msg'],
          icon: const FaIcon(
            FontAwesomeIcons.circleXmark,
          ),
          colorText: Colors.white,
          duration: const Duration(seconds: 5),
        );
      }
      print(
          "${phoneController.text},${nomController.text},${prenomController.text},${nomSocieteController.text},${phoneController.text}, ${long.value}, ${lat.value}");
    }
  }

  @override
  void onInit() {
    getCurrentLocation();
    getClients();
    super.onInit();
  }
}
