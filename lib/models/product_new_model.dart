
import 'package:meta/meta.dart';
import 'dart:convert';

NewProductBook newProductBookFromJson(String str) => NewProductBook.fromJson(json.decode(str));

String newProductBookToJson(NewProductBook data) => json.encode(data.toJson());

class NewProductBook {
    NewProductBook({
        required this.error,
        required this.total,
        required this.books,
    });

    String error;
    String total;
    List<Book> books;

    factory NewProductBook.fromJson(Map<String, dynamic> json) => NewProductBook(
        error: json["error"],
        total: json["total"],
        books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "total": total,
        "books": List<dynamic>.from(books.map((x) => x.toJson())),
    };
}

class Book {
    Book({
        required this.title,
        required this.subtitle,
        required this.isbn13,
        required this.price,
        required this.image,
        required this.url,
    });

    String title;
    String subtitle;
    String isbn13;
    String price;
    String image;
    String url;

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        title: json["title"],
        subtitle: json["subtitle"],
        isbn13: json["isbn13"],
        price: json["price"],
        image: json["image"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "isbn13": isbn13,
        "price": price,
        "image": image,
        "url": url,
    };
}
