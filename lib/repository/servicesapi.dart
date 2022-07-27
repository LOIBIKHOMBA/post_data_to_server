import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:fuel/model/model.dart';
import 'package:fuel/model/model2.dart';
import 'package:http/http.dart' as http;

class ServiceApi {
  Future<FuelModel?> postData(String petrol_price, String diesel_price) async {
    var body = {
      "data": {
        "petrol_rate_per_litre": petrol_price,
        "diesel_rate_per_litre": diesel_price
      }
    };
    final response = await http.post(
      Uri.parse('https://plantcount.herokuapp.com/api/fuel-rates'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      log('succesfully post');
      var data = FuelModel.fromJson(jsonDecode(response.body));
      print(data);
    } else {
      log("data");
    }
  }
}
