import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ibook/models/product_new_model.dart';
import 'config/text_strings.dart';

class Services {
  var dio = Dio();
  String baseUrl = TextStrings.urlApi;

  Future<List<Book>?> getProduct() async {
    try {
      var url = "$baseUrl/new";
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        var _model = NewProductBook.fromJson(response.data);
        var listData = _model.books;
        return listData;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Book>?> getProductByValue(String data) async {
    try {
      var url = "$baseUrl/search/$data";
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        var _model = NewProductBook.fromJson(response.data);
        var listData = _model.books;
        return listData;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
