import 'package:flutter/material.dart';
import 'package:water/app/UI/shared/widgets/rechercheNom.dart';
import 'package:water/app/UI/shared/widgets/rechercheProd.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:dropdown_search/dropdown_search.dart';

class VenteCliPage extends StatefulWidget {
  const VenteCliPage({super.key});

  @override
  State<VenteCliPage> createState() => _VenteCliPageState();
}

class _VenteCliPageState extends State<VenteCliPage> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              showSearchBox: true,
            ),
            items: [
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
            ],
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                hintText: "Nom & Prenom",
              ),
            ),
            onChanged: print,
          ),
          SizedBox(height: 28),
          DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              showSearchBox: true,
            ),
            items: [
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
            ],
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                hintText: "Produit & Prix",
              ),
            ),
            onChanged: print,
          ),
          SizedBox(height: 20),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                width: 500,
                height: 55,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 208, 206, 206),
                  border: Border.all(
                    color: Color.fromARGB(255, 208, 206, 206),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Quantité",
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
