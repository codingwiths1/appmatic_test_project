import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  static List productList = [];
  static bool fetching = true;
  static final url = Uri.parse("https://fakestoreapi.com/products");

  static fetchProduct() async {
    try {
      var request = await http.get(url);

      if (request.statusCode == 200) {
        fetching = false;
        productList = jsonDecode(request.body);
        debugPrint(productList.toString());
      } else {
        debugPrint("ERROR");
      }
    } catch (e) {
      debugPrint("ERROR");
    } finally {
      fetching = false;

    }
  }
}
