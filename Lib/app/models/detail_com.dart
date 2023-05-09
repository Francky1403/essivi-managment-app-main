import 'package:water/app/models/detail_vente.dart';

class Detail_com {
  final int? id_com;
  final int id_produit;
  final int qte;
  final double prix;
  final String nom_produit;

  const Detail_com(
      this.id_com, this.id_produit, this.qte, this.prix, this.nom_produit);

  factory Detail_com.fromJson(Map<String, dynamic> json) {
    return Detail_com(
      json['id_com'],
      json['id_produit'],
      json['qte'],
      json['prix'],
      json['nom_produit'],
    );
  }

  static toDetailVente(Detail_com detail) {
    return Detail_vente(null, detail.id_produit, detail.qte, detail.prix, null);
  }
}
