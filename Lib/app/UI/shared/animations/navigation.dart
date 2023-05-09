import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:water/app/UI/formulaire_&_vente/client.dart';
import 'package:water/app/UI/formulaire_&_vente/vente.dart';
import 'package:water/app/UI/formulaire_&_vente/commande.dart';
import 'package:water/app/controllers/auth_controller.dart';
import 'package:water/app/controllers/main_controller.dart';

class NaviPage extends StatefulWidget {
  @override
  State<NaviPage> createState() => _NaviPageState();
}

class _NaviPageState extends State<NaviPage> {
  AuthController authController = Get.put(AuthController());
  int index = 0;
  final Screens = [
    const VentePage(),
    const ClientPage(),
    commande(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[index],
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 253, 254, 255),
        child: CurvedNavigationBar(
            height: 60,
            backgroundColor: const Color.fromARGB(255, 249, 249, 249),
            color: const Color.fromARGB(255, 20, 62, 93),
            animationDuration: const Duration(milliseconds: 550),
            onTap: (index) => setState(() => this.index = index),
            items: const [
              FaIcon(
                FontAwesomeIcons.cartArrowDown,
                color: Colors.white,
              ),
              FaIcon(
                FontAwesomeIcons.person,
                color: Colors.white,
              ),
              FaIcon(
                FontAwesomeIcons.boxesStacked,
                color: Colors.white,
              ),
            ]),
      ),
    );
  }
}
