// this class is the model of a client

class Client {
  final int id;
  final String name;
  final double long;
  final double lat;
  final String phone;
  final String reference;
  final DateTime created_at;

  const Client(this.id, this.name, this.long, this.lat, this.phone,
      this.reference, this.created_at);

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(json['id'], json['name'], json['long'], json['lat'],
        json['phone'], json['reference'], DateTime.parse(json['created_at']));
  }
}
