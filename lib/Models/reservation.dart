class Reservation {
  String city = '';
  String place = '';
  String plateNumber = '';
  String slotNumber = '';
  String vehicle = '';
  DateTime? reservationTime;
  DateTime? reservationEndTime;
  int hours = 1;
  int price = 300;
  String? id;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'city': city,
      'slotNumber': slotNumber,
      'place': place,
      'vehicle': vehicle,
      'plateNumber': plateNumber,
      'reservationTime': reservationTime,
      'reservationEndTime': reservationEndTime,
      'hours': hours,
      'price': price,
      'id': id,
    };
  }
}
