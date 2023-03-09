class Location{
  final double lat;
  final double lng;

  Location({this.lat = 0.0, this.lng = 0.0});

  factory Location.fromJson(Map<dynamic,dynamic> parsedJson){
    return Location(
        lat: parsedJson['lat'],
        lng: parsedJson['lng']
    );
  }
}