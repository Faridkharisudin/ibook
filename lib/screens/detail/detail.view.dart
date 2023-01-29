import 'package:flutter/material.dart';
import 'package:ibook/config/app_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibook/models/detail_book_model.dart';
import 'package:ibook/models/detail_book_model_bikin_sendiri.dart';
import 'package:ibook/widgets/container_detail_view.dart';
import 'package:ibook/widgets/every_text.dart';

class DetailView extends StatelessWidget {
  final EveryDetailBook getData;
  DetailView({Key? key, required this.getData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColor.mainBlack,
        ),
        backgroundColor: AppColor.mainWhite,
        title: Text(
          "Book",
          style: GoogleFonts.poppins(
            color: AppColor.mainBlack,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        actions: const [],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.44,
                decoration: BoxDecoration(color: AppColor.mainGrey),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${getData.title}",
                              maxLines: 2,
                              overflow: TextOverflow.fade,
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
                      padding: const EdgeInsets.only(top: 8.0),
                      child: EveryText(
                        word: "HARGA",
                        sizeWord: 18,
                        weightWord: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ContainerDetailView(word1: "Year", word2: "2015"),
                      const VerticalDivider(),
                      ContainerDetailView(word1: "Pages", word2: "384"),
                      const VerticalDivider(),
                      ContainerDetailView(word1: "Rating", word2: "5"),
                    ],
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsetsDirectional.all(12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EveryText(
                        word:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. D",
                        sizeWord: 18.0,
                        weightWord: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.mainBlack,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: EveryText(
                          word: "See PDF Example",
                          sizeWord: 18.0,
                          weightWord: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
