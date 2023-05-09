import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water/app/UI/formulaire_&_vente/details_Vente.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:water/app/UI/shared/config.dart';
import 'package:water/app/controllers/vente_controller.dart';

class MVentePage extends StatefulWidget {
  @override
  State<MVentePage> createState() => _MVentePageState();
}

class _MVentePageState extends State<MVentePage> {
  VenteController venteController = Get.put(VenteController());

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 250,
      backgroundColor: Color.fromARGB(255, 219, 219, 219),
      color: Colors.black87,
      strokeWidth: 3,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () => venteController.getVentes(),
      child: Scaffold(
        body: GetBuilder(
          init: VenteController(),
          id: 6,
          builder: (_) => venteController.ventes.isEmpty
              ? Center(
                  child: Text(
                    "Vous n'avez pas fait de vente pour l'instant",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: venteController.ventes.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) => Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
                    child: Card(
                      elevation: 20.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  //Text(id[index], style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),

                                  Text(
                                    venteController.ventes[index].nom_client,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),

                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(padding: EdgeInsets.all(5)),
                                        const Icon(
                                          Icons.phone,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 5),
                                        TextButton(
                                          onPressed: () {
                                            Config.makePhoneCall(venteController
                                                .ventes[index].num_client);
                                          },
                                          child: Text(
                                            venteController
                                                .ventes[index].num_client,
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        IconButton(
                                          padding:
                                              const EdgeInsets.only(left: 160),
                                          onPressed: () {
                                            Get.to(detailsVen(),
                                                transition:
                                                    Transition.rightToLeft,
                                                duration: const Duration(
                                                    milliseconds: 400),
                                                arguments: venteController
                                                    .ventes[index],
                                                fullscreenDialog: false);
                                          },
                                          icon: const Icon(
                                            Icons.arrow_forward_ios,
                                            color:
                                                Color.fromARGB(255, 10, 40, 63),
                                            size: 20,
                                          ),
                                        ),
                                      ]),
                                  const SizedBox(height: 5),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(padding: EdgeInsets.all(5)),
                                        const FaIcon(
                                          FontAwesomeIcons.calendarCheck,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          venteController
                                              .ventes[index].date_vente,
                                          style: const TextStyle(
                                              fontSize: 18, color: Colors.grey),
                                        ),
                                      ]),
                                ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
