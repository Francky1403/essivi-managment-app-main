import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Config {
  static String url = "http://192.168.24.57:5000/api/v1";

  static makePhoneCall(number) async {
    var url = Uri.parse("tel:$number");

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      Get.snackbar(
        "erreur",
        "Impossible de lancer l'application d'appel",
        icon: const FaIcon(
          FontAwesomeIcons.circleXmark,
          color: Colors.redAccent,
        ),
      );
    }
  }
}
