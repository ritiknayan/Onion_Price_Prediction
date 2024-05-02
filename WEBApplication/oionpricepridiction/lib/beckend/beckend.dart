import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oionpricepridiction/constants/constants.dart';
import 'package:oionpricepridiction/models/project_model.dart';
import 'package:provider/provider.dart';

class Server {
  static const url = 'http://127.0.0.1:3000';

  static Future<void> fetchState() async {
    const currentURL = '$url/get_State_names';

    try {
      final response = await http.get(
        Uri.parse(currentURL),
      );
      if (response.statusCode == 200) {
        final jsonMapData = jsonDecode(response.body) as Map<String, dynamic>;
        kStates = jsonMapData['State'];
      } else {
        print("error in backend");
      }
    } catch (err) {
      print(err);
    }
  }

  static Future<void> fetchDistrictByState(BuildContext context) async {
    print("aagaya");
    const currentURL = '$url/get_District_by_state';

    try {
      var data = json.encode({
        'state': DataModel.state,
      });
      final response = await http.post(Uri.parse(currentURL), body: data);

      if (response.statusCode == 200) {
        final jsonMapData = jsonDecode(response.body) as Map<String, dynamic>;

        Provider.of<kdataaa>(context, listen: false)
            .setdistrict(jsonMapData['District']);
        print(jsonMapData['District']);
      } else {
        print("error in backend");
      }
    } catch (err) {
      print(err);
    }
  }

  static Future<void> fetchDistrict() async {
    const currentURL = '$url/get_District_names';

    try {
      final response = await http.get(
        Uri.parse(currentURL),
      );
      if (response.statusCode == 200) {
        final jsonMapData = jsonDecode(response.body) as Map<String, dynamic>;

        Provider(
          create: (context) {
            return Provider.of<kdataaa>(context, listen: false)
                .setdistrict(jsonMapData['District']);
          },
        );
        // print(jsonMapData['District']);
        print("fetch district");
      } else {
        print("error in backend");
      }
    } catch (err) {
      print(err);
    }
  }

  static Future<void> fetchVariety() async {
    const currentURL = '$url/get_variety_names';

    try {
      final response = await http.get(
        Uri.parse(currentURL),
      );
      if (response.statusCode == 200) {
        final jsonMapData = jsonDecode(response.body) as Map<String, dynamic>;
        kVariety = jsonMapData['Variety'];
      } else {
        print("error in backend");
      }
    } catch (err) {
      print(err);
    }
  }

  static Future<void> fetchMonth() async {
    const currentURL = '$url/get_Month_names';

    try {
      final response = await http.get(
        Uri.parse(currentURL),
      );
      if (response.statusCode == 200) {
        final jsonMapData = jsonDecode(response.body) as Map<String, dynamic>;
        kMonth = jsonMapData['Month'];
      } else {
        print("error in backend");
      }
    } catch (err) {
      print(err);
    }
  }

  static Future<void> estimateprice() async {
    const _url = '$url/predict_Onion_price';
    print(DataModel.district);
    print(DataModel.state);
    print(DataModel.variety);
    print(DataModel.month);
    print(DataModel.isDrought);
    print(DataModel.isHarvesting);
    print(DataModel.isProducing);
    try {
      var data = json.encode({
        'State': DataModel.state,
        'District': DataModel.district,
        'Variety': DataModel.variety,
        'Month': DataModel.month,
        'isProducing': DataModel.isProducing,
        'Harvesting_month': DataModel.isHarvesting,
      });
      print(data);
      final response = await http.post(Uri.parse(_url), body: data);

      if (response.statusCode == 200) {
        final jsonMapData = jsonDecode(response.body) as Map<String, dynamic>;
        DataModel.pridictedPrice = jsonMapData['estimated_price'];
        print(DataModel.pridictedPrice);
      } else {
        print("error");
      }
    } catch (err) {
      print(err);
    }
  }
}
