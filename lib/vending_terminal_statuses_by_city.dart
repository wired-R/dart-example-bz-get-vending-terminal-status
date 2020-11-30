import 'dart:convert';

import 'package:http/http.dart' as http;

/// Filter output data by city and status
class FiltredVendingTerminalStatus extends VendingTerminalStatus {
  String _city;
  final String _status;
  static const Map _cities = {
    'spb': 'Санкт-Петербург',
    'moscow': 'Москва',
    'all': 'all'
  };
  FiltredVendingTerminalStatus(this._city, this._status) {
    _city = _cities[_city];
  }

  @override
  List<VendingTerminalStatus> vendingTerminalStatusFromJson(String body) {
    var filtredTerminals = List<VendingTerminalStatus>();
    for (var t in json.decode(body)) {
      var terminal = VendingTerminalStatus.fromJson(t);
      if (_status == 'all' || terminal.status == _status) {
        if (_city == 'all' || terminal.city == _city) {
          filtredTerminals.add(terminal);
        }
      }
    }
    return filtredTerminals;
  }
}

class VendingTerminalStatus {
  int id;
  dynamic address;
  dynamic city;
  dynamic latitude;
  dynamic longitude;
  String status;
  int rating;
  String description;

  VendingTerminalStatus({
    this.id,
    this.address,
    this.city,
    this.latitude,
    this.longitude,
    this.status,
    this.rating,
    this.description,
  });

  factory VendingTerminalStatus.fromJson(Map<String, dynamic> json) =>
      VendingTerminalStatus(
        id: json['id'],
        address: json['address'],
        city: json['city'].toString(),
        latitude: json['latitude'].toString(),
        longitude: json['longitude'].toString(),
        status: json['status'],
        rating: json['rating'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'address': address,
        'city': city,
        'latitude': latitude,
        'longitude': longitude,
        'status': status,
        'rating': rating,
        'description': description,
      };

  Future<String> fetchDataFromApi() async {
    const apiURL = 'http://preprodapi.berizaryad.ru/vendings/statuses';
    final response = await http.get(apiURL);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load statuses');
    }
  }

  Future<List<VendingTerminalStatus>> getVendingTerminalsData() async {
    return vendingTerminalStatusFromJson(await fetchDataFromApi());
  }

  List<VendingTerminalStatus> vendingTerminalStatusFromJson(String body) =>
      List<VendingTerminalStatus>.from(
          json.decode(body).map((x) => VendingTerminalStatus.fromJson(x)));
}
