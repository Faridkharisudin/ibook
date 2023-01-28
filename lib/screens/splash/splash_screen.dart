import 'package:flutter/material.dart';
import 'package:ibook/config/app_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibook/config/app_theme.dart';
import 'package:ibook/config/text_strings.dart';
import 'package:ibook/screens/home/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainBlack,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 285.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: (MediaQuery.of(context).size.height) - 280.0,
                    decoration: const BoxDecoration(
                      color: AppColor.mainWhite,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 240.0,
                  ),
                  Center(
                    child: Image.asset(
                      "assets/logo.png",
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "iBook",
                    style: GoogleFonts.poppins(
                      color: AppColor.mainBlack,
                      fontSize: 35.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    '''${TextStrings.tSubtitleSplashS}''',
                    style: GoogleFonts.poppins(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: AppColor.mainBlack,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 160.0, left: 20, right: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.mainBlack,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Container(
                        height: 65,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            "Find your book",
                            style: GoogleFonts.poppins(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                                color: AppColor.mainWhite),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
