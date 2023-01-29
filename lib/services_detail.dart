import 'package:ibook/config/text_strings.dart';
import 'package:ibook/models/detail_book_model_bikin_sendiri.dart';
import 'package:dio/dio.dart';
import 'config/text_strings.dart';

abstract class ServicesDetails {
  static Future<EveryDetailBook?> getByIsbn(String data) async {
    String baseUrl = TextStrings.urlApi;
    try {
      var response = await Dio().get("$baseUrl/books/$data");
      if (response.statusCode == 200) {
        return EveryDetailBook(
            title: response.data['title'],
            subtitle: response.data['subtitle'],
            authors: response.data['authors'],
            publisher: response.data['publisher'],
            isbn13: response.data['isbn13'],
            pages: response.data['pages'],
            rating: response.data['rating'],
            desc: response.data['desc'],
            price: response.data['price'],
            image: response.data['image'],
            url: response.data['url'],
            pdf1: response.data['pdf']['Chapter 2'],
            pdf2: response.data['pdf']['Chapter 5']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
