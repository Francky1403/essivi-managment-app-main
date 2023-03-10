import 'package:flutter/material.dart';
import 'package:water/app/UI/shared/widgets/rechercheProd.dart';
import 'package:dropdown_search/dropdown_search.dart';

class VenteSipPage extends StatefulWidget {
  const VenteSipPage({super.key});

  @override
  State<VenteSipPage> createState() => _VenteSipPageState();
}

class _VenteSipPageState extends State<VenteSipPage> {
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
                hintText: "Produit & Prix",
              ),
            ),
            onChanged: print,
          ),
          SizedBox(height: 28),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                width: 500,
                height: 55,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 208, 206, 206),
                  border: Border.all(
                    color: const Color.fromARGB(255, 208, 206, 206),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Numéro de téléphone",
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
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
