class ParkingRecord{
  final String image;
  final String place;
  final String subPlace;
  final double price;
  bool status;

  ParkingRecord({
    required this.image,
    required this.place,
    required this.subPlace,
    required this.price,
    required this.status
  });

  void setStatus(bool curStatus) {
    status = curStatus;
  }
}