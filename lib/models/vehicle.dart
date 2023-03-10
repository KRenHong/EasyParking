
import 'dart:convert';

class Vehicle{
  final String carPlate;
  final String desc;

  Vehicle({
    required this.carPlate,
    required this.desc
  });

  Map<String, dynamic> toJson() {
    return {
      'carPlate': carPlate,
      'desc': desc
    };
  }

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      carPlate: json['carPlate'], 
      desc: json['desc']
    );
  }

  static String encode(List<Vehicle> vehicle) => json.encode(
    vehicle
      .map<Map<String, dynamic>>((vehicle) => vehicle.toJson())
      .toList(),
  );

  static List<Vehicle> decode(String vehicle) =>
    (json.decode(vehicle) as List<dynamic>)
        .map<Vehicle>((item) => Vehicle.fromJson(item))
        .toList();

}