import 'package:easyparking/models/parking_record.dart';
import 'package:easyparking/models/payment.dart';
import 'package:easyparking/models/payment_record.dart';

class AppConstant{
  static const String MENU_ICON = "assets/image/menu_icon.jpg";
  static const String CAR_1 = "assets/image/car_1.png";
  static const String CAR_2 = "assets/image/car_2.png";
  static const String CAR_3 = "assets/image/car_3.png";
  static const String CAR_4 = "assets/image/car_4.png";
  static const String EMPTY_IMG = "assets/image/empty_box.png";
  static const String SUNWAY_LOGO = "assets/image/sunway_logo.png";
  static const String MBPJ_LOGO = "assets/image/mbpj_logo.png";
  static const String MBPP_LOGO = "assets/image/mbpp_logo.png";
  static const String MBSJ_LOGO = "assets/image/mbsj_logo.png";
  static const String ONE_U_LOGO = "assets/image/one_u_logo.png";
  static const String APPLE_LOGO = "assets/image/apple_logo.png";
  static const String TNG_LOGO = "assets/image/tng_logo.png";
  static const String GOOGLE_LOGO = "assets/image/google_logo.png";
  static const String VISA_LOGO = "assets/image/visa_logo.png";

  static const List<String> carPlateList = 
    ["HGE 5295", "PKR 6969", "WTF 6996", "LAMBO 6969"];
  static const List<String> carList = ["HILUX" ,"LAMBO", "BUGATTI", "TESLA"];
  static const List<String> carImgList = [CAR_1, CAR_2, CAR_3, CAR_4];

  static List<Payment> paymentList = [
    Payment(image: GOOGLE_LOGO, title: "Google Pay", selected: false),
    Payment(image: TNG_LOGO, title: "Touch’n GO", selected: false),
    Payment(image: APPLE_LOGO, title: "Apple Pay", selected: false),
    Payment(image: VISA_LOGO, title: "****  ****  ****  ****  7890", selected: false)
  ];

  static List<PaymentRecord> paymentRecordList = [
    PaymentRecord(logo: SUNWAY_LOGO, title: "Sunway Parking", price: "MYR 8.00"),
    PaymentRecord(logo: MBPJ_LOGO, title: "Petaling Jaya", price: "MYR 8.00"),
    PaymentRecord(logo: MBSJ_LOGO, title: "Subang Jaya", price: "MYR 8.00"),
    PaymentRecord(logo: ONE_U_LOGO, title: "One Utama", price: "MYR 8.00"),
    PaymentRecord(logo: MBPP_LOGO, title: "Pulau Pinang", price: "MYR 8.00")
  ];

  static List<ParkingRecord> parkingRecordList = [
    ParkingRecord(image: SUNWAY_LOGO, place: "Sunway Pyramid", subPlace: "7518 Washington Alley", price: 7.34, status: true),
    ParkingRecord(image: ONE_U_LOGO, place: "One Utama", subPlace: "1st Floor (A05)", price: 3.43, status: true),
    ParkingRecord(image: MBSJ_LOGO, place: "Subang Jaya", subPlace: "3, Jalan PJS 11/15, Bandar Sunway", price: 5.87, status: true),
  ];

  static const String VEHICLE = "vehicle";
}