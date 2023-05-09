//this is the model of a vente done by a client

// ignore_for_file: non_constant_identifier_names

import 'package:water/app/models/detail_vente.dart';

class Vente {
  final int? id;
  final String? date_vente;
  final int? chargement_id;
  final int? client_id;
  final int? commande_id;
  final String nom_client;
  final String num_client;
  final List<Detail_vente>? details;

  const Vente(this.id, this.date_vente, this.chargement_id, this.client_id,
      this.commande_id, this.nom_client, this.num_client, this.details);

  factory Vente.fromJson(Map<String, dynamic> json) {
    List<Detail_vente> details = List.empty(growable: true);
    if (json['details'] != null) {
      json['details'].forEach((el) {
        details.add(Detail_vente.fromJson(el));
      });
    }
    return Vente(
        json['id'],
        json['date_vente'],
        json['chargement_id'],
        json['client_id'],
        json['commande_id'],
        json['nom_client'],
        json['num_client'],
        details);
  }
}
