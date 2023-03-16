import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:water/app/UI/formulaire_&_vente/client.dart';
import 'package:water/app/UI/formulaire_&_vente/vente.dart';
import 'package:water/app/UI/formulaire_&_vente/commande.dart';

class NaviPage extends StatefulWidget {
  @override
  State<NaviPage> createState() => _NaviPageState();
}

class _NaviPageState extends State<NaviPage> {
  int index = 0;
  final Screens = [
    VentePage(),
    ClientPage(),
    commande(),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[index],
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 253, 254, 255),
        child: CurvedNavigationBar(
            height: 60,
            backgroundColor: Color.fromARGB(255, 249, 249, 249),
            color: Color.fromARGB(255, 10, 40, 63),
            animationDuration: Duration(milliseconds: 550),
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
