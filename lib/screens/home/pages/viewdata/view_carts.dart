import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibook/config/app_color.dart';
import 'package:ibook/models/detail_book_model.dart';
import 'package:ibook/models/detail_book_model_bikin_sendiri.dart';
import 'package:ibook/screens/detail/detail.view.dart';
import 'package:ibook/services.dart';
import 'package:ibook/services_detail.dart';

class ViewCarts extends StatelessWidget {
  List<dynamic> getData;

  ViewCarts({Key? key, required this.getData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        itemCount: getData.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () async {
              EveryDetailBook? result =
                  await ServicesDetails.getByIsbn(getData[index].isbn13);
              if (result != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailView(getData: result),
                  ),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 140,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.network(
                      "${getData[index].image}",
                      width: 64.0,
                      height: 64.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 140,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${getData[index].title}",
                                overflow: TextOverflow.fade,
                                maxLines: 2,
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text(
                          "${getData[index].price}",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
