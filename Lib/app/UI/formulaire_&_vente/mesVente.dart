import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water/app/UI/formulaire_&_vente/details_Vente.dart';

class MVentePage extends StatefulWidget {
  @override
  State<MVentePage> createState() => _MVentePageState();
}

class _MVentePageState extends State<MVentePage> {
  List id = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
          child: Card(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
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
                              IconButton(
                                padding: EdgeInsets.only(left: 210),
                                onPressed: () {
                                  Get.to(detailsVen(),
                                      transition: Transition.rightToLeft,
                                      duration: Duration(seconds: 1),
                                      arguments: [id[index], telephone[index]],
                                      fullscreenDialog: true);
                                },
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color.fromARGB(255, 10, 40, 63),
                                  size: 20,
                                ),
                              ),
                            ]),

                        Text(
                          "Vente",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),

                        Text(
                          id[index],
                          style: TextStyle(
                              color: Color.fromARGB(255, 79, 78, 78),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
