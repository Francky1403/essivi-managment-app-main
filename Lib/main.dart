import 'package:flutter/material.dart';
import 'package:water/app/UI/Accueil/acceuil.dart';
import 'package:water/app/UI/formulaire_&_vente/maps.dart';
import 'package:water/app/UI/shared/animations/animation.dart';
import 'package:water/app/UI/shared/animations/navigation.dart';
import 'package:get/get.dart';

const d_red = Color(0xFFE9717D);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Acceuil',
      debugShowCheckedModeBanner: false,
      home: Aceuil(),
    );
  }
}
