import 'dart:convert';

import 'package:appmatic_test_project/core/utils/notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  static final url = Uri.parse("https://fakestoreapi.com/products");

  static fetchProduct() async {
    try {
      var request = await http.get(url);

      if (request.statusCode == 200) {
        debugPrint("SUCCESS");
        return jsonDecode(request.body);
      } else {
        debugPrint("ERROR");
        return [];
      }
    } catch (e) {
      Notifications.error("COULD NOT GET PRODUCTS");

      debugPrint("ERROR");
      return [];
    }
  }

}
