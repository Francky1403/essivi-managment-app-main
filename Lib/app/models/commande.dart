// this class is the model of the command of a client

import 'package:water/app/models/detail_vente.dart';
import 'package:water/app/models/detail_com.dart';

class Commande {
  final int id;
  final String date;
  final String nom_client;
  final String num_client;
  final List<Detail_com>? details;
  final String reference;
  final int user_id;

  const Commande(this.date, this.id, this.num_client, this.nom_client,
      this.details, this.reference, this.user_id);

  factory Commande.fromJson(Map<String, dynamic> json) {
    List<Detail_com> details = List.empty(growable: true);
    if (json['details'] != null) {
      json['details'].forEach((el) {
        details.add(Detail_com.fromJson(el));
      });
    }
    return Commande(json['date_com'], json['id'], json['num_client'],
        json['nom_client'], details, json['reference'], json['user_id']);
  }
}
