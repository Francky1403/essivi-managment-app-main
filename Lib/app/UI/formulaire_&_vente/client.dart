import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:water/app/UI/formulaire_&_vente/formulaire.dart';
import 'package:water/app/UI/formulaire_&_vente/liste_Clients.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          extendBody: true,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromARGB(255, 20, 62, 93),
            elevation: 2,
            title: Text(
              'Client',
              style: GoogleFonts.asset(
                  color: Color.fromARGB(255, 252, 251, 251), fontSize: 24),
            ),
            centerTitle: true,
            bottom: TabBar(tabs: [
              Tab(
                icon: const FaIcon(
                  FontAwesomeIcons.person,
                  color: Color.fromARGB(255, 255, 249, 249),
                  size: 25,
                ),
                child: Text(
                  'Formulaire Client',
                  style: GoogleFonts.asset(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 15,
                  ),
                ),
              ),
              Tab(
                icon: const FaIcon(
                  FontAwesomeIcons.list,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 25,
                ),
                child: Text(
                  'Liste Client',
                  style: GoogleFonts.asset(
                    color: Color.fromARGB(255, 252, 252, 252),
                    fontSize: 15,
                  ),
                ),
              ),
            ]),
          ),
          body: TabBarView(children: [
            FormPage(),
            listClient(),
          ]),
        ),
      );
}
