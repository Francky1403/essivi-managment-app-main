import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:water/app/UI/formulaire_&_vente/mesVente.dart';
import 'package:water/app/UI/formulaire_&_vente/venteCli.dart';
import 'package:water/app/UI/formulaire_&_vente/venteSip.dart';
import 'package:water/app/UI/connectez-vous/account.dart';

class VentePage extends StatefulWidget {
  const VentePage({super.key});

  @override
  State<VentePage> createState() => _VentePageState();
}

class _VentePageState extends State<VentePage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
          extendBody: true,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Get.to(Account());
                  },
                  icon: const Icon(Icons.account_circle_rounded))
            ],
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromARGB(255, 20, 62, 93),
            elevation: 2,
            title: Text(
              'Vente',
              style: GoogleFonts.poppins(
                  color: Color.fromARGB(255, 252, 251, 251), fontSize: 22),
            ),
            centerTitle: true,
            bottom: TabBar(tabs: [
              Tab(
                icon: const FaIcon(
                  FontAwesomeIcons.basketShopping,
                  color: Color.fromARGB(255, 255, 249, 249),
                ),
                child: Text(
                  'Vente Client',
                  style: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 12,
                  ),
                ),
              ),
              Tab(
                icon: const FaIcon(
                  FontAwesomeIcons.bagShopping,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Text(
                  'Vente Simple',
                  style: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 252, 252, 252),
                    fontSize: 12,
                  ),
                ),
              ),
              Tab(
                icon: const FaIcon(
                  FontAwesomeIcons.listCheck,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Text(
                  'Mes Ventes',
                  style: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 12,
                  ),
                ),
              ),
            ]),
          ),
          body: TabBarView(children: [
            VenteCliPage(),
            VenteSipPage(),
            MVentePage(),
          ]),
        ),
      );
}
