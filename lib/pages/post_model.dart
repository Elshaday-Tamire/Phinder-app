import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Post {

  final String pharmacyName;
  final double latitude;
  final double longitude;
  final double price;
  final bool open;



  Post({
    required this.pharmacyName,
    required this.latitude,
    required this.longitude,
    required this.price,
    required this.open,

}
);

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        pharmacyName: json['pharmacyName'] as String,
        latitude: json['latitude'] as double,
        longitude: json['longitude'] as double,
        price: json['price'] as double,
        open: json['open'] as bool,
    );
  }

}