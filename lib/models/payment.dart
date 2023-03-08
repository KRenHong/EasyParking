import 'dart:convert';

class Payment{
  final String image;
  final String title;
  final bool selected;
  Payment({
    required this.image,
    required this.title,
    required this.selected
  });

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'selected': selected
    };
  }

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      image: json['image'], 
      title: json['title'], 
      selected: json['selected']
    );
  }

  static String encode(Payment payment) => json.encode(
    payment.toJson()
  );

  static Payment decode(String payment) => 
  Payment.fromJson(json.decode(payment));
}