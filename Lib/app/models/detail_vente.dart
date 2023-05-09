class Detail_vente {
  final int? id_vente;
  final int id_produit;
  final String? nom_produit;
  final int qte;
  final double prix;

  const Detail_vente(
      this.id_vente, this.id_produit, this.qte, this.prix, this.nom_produit);

  factory Detail_vente.fromJson(Map<String, dynamic> json) {
    return Detail_vente(json['id_vente'], json['id_produit'], json['qte'],
        json['prix'], json['nom_produit']);
  }

  static toJson(List details) {
    var data = [];
    details.forEach((element) {
      data.add({
        "id_produit": element.id_produit,
        "qte": element.qte,
        "prix": element.prix
      });
    });
    return data;
  }
}
