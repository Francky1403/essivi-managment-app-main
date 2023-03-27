import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water/app/UI/formulaire_&_vente/detailsCom.dart';

class commande extends StatefulWidget {
  @override
  State<commande> createState() => _commandeState();
}

class _commandeState extends State<commande> {
  List id = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
  List name = [
    "King",
    "Samuel",
    "Loui",
    "Tiger",
    "John",
    "Jolie",
    "King",
    "King",
    "King",
    "King"
  ];
  List telephone = [
    "90124644",
    "90094982",
    "91147797",
    "90095020",
    "99595272",
    "92998082",
    "92998082",
    "92998082",
    "92998082",
    "92998082"
  ];

  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        backgroundColor: Color.fromARGB(255, 20, 62, 93),
        title: Text(
          "Commande",
          style: GoogleFonts.asset(
              color: Color.fromARGB(255, 252, 251, 251), fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: name.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
          child: Card(
            elevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //Text(id[index], style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),

                      Text(
                        name[index],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.all(5)),
                            Icon(
                              Icons.phone,
                              color: Colors.grey,
                              size: 20,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              telephone[index],
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              padding: EdgeInsets.only(left: 200),
                              onPressed: () {
                                Get.to(detailsCom(),
                                    transition: Transition.rightToLeft,
                                    duration: Duration(seconds: 1),
                                    arguments: [name[index], telephone[index]],
                                    fullscreenDialog: true);
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: Color.fromARGB(255, 10, 40, 63),
                                size: 20,
                              ),
                            ),
                          ]),
                      const SizedBox(height: 5),
                      /* Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.access_alarm_rounded,
                              color: Colors.grey,
                              size: 20,
                            ),
                            Text(
                              today.toString(),
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),*/
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.all(5)),
                            Icon(
                              Icons.calendar_month,
                              color: Colors.grey,
                              size: 20,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              today.toString(),
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                      const SizedBox(height: 9),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.all(5)),
                            FaIcon(
                              FontAwesomeIcons.boxArchive,
                              color: Colors.grey,
                              size: 20,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "Commande",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ]),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
