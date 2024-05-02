import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DataModel {
  static int? id;
  static String? state = null;
  static String? district;
  static String? variety;
  static String? month;
  static int? isHarvesting;
  static int? isProducing;
  static int? isDrought;
  static double? pridictedPrice;
  // DataModel() {
  //   state = null;
  //   district = null;
  //   pridictedPrice = null;
  // }

  DataModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    district = json['district'];
    month = json['month'];
    variety = json['Variety'];
    isDrought = json['isDrought'];
    isHarvesting = json['Harvesting_month'];
    isProducing = json['isProducing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['State'] = state;
    data['District'] = district;
    data['Variety'] = variety;
    data['Month'] = month;
    data['isProducing'] = isProducing;
    data['Harvesting_month'] = isHarvesting;
    data['isDrought'] = isDrought;
    return data;
  }
}
