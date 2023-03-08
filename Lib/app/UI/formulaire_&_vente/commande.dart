import 'package:flutter/material.dart';
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
        backgroundColor: Color.fromARGB(255, 10, 40, 63),
        title: Text(
          "Commande",
          style: GoogleFonts.arbutusSlab(
              color: Color.fromARGB(255, 252, 251, 251), fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
          child: Card(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35.0),
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
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: 7)),
                            Text(
                              name[index],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              padding: EdgeInsets.only(left: 230),
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
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.phone,
                              color: Colors.grey,
                              size: 20,
                            ),
                            Text(
                              telephone[index],
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                      const SizedBox(height: 9),
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
                            Icon(
                              Icons.calendar_month,
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
                          ]),
                      const SizedBox(height: 9),

                      Text(
                        "Commande",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: 7)),
                            Text(
                              id[index],
                              style: TextStyle(
                                  color: Color.fromARGB(255, 79, 78, 78),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 95.0),
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      padding: EdgeInsets.all(13),
                                      backgroundColor:
                                          Color.fromARGB(255, 200, 28, 28),
                                    ),
                                    child: Text(
                                      'Refuser',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      padding: EdgeInsets.all(13),
                                      backgroundColor:
                                          Color.fromARGB(255, 4, 170, 57),
                                    ),
                                    child: Text(
                                      'Accepter',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
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
