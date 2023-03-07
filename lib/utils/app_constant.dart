import 'package:easyparking/models/payment.dart';

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

  static const List<String> loactionLogo = [
    SUNWAY_LOGO,MBPJ_LOGO, MBSJ_LOGO, ONE_U_LOGO, MBPP_LOGO
  ];
  static const List<String> locationName = [
    "Sunway Parking","Petaling Jaya","Subang Jaya","One Utama","Pulau Pinang"
  ];

  static List<Payment> paymentList = [
    Payment(image: GOOGLE_LOGO, title: "Google Pay", selected: false),
    Payment(image: TNG_LOGO, title: "Touch’n GO", selected: false),
    Payment(image: APPLE_LOGO, title: "Apple Pay", selected: false),
    Payment(image: VISA_LOGO, title: "****  ****  ****  ****  7890", selected: false)
  ];

  static const String VEHICLE = "vehicle";
}