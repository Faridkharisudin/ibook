import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibook/config/app_color.dart';
import 'package:ibook/screens/home/pages/pages_bookmark.dart';
import 'package:ibook/screens/home/pages/pages_main.dart';
import 'package:ibook/screens/home/pages/pages_search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MainPage(), // in here we can create any body of this app
      ),
    );
  }
}
