import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibook/config/app_color.dart';
import 'package:ibook/models/product_new_model.dart';
import 'package:ibook/screens/home/pages/viewdata/view_carts.dart';
import 'package:ibook/services.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget _nameTab(String name, Color colors) {
    return Text(
      name,
      style: GoogleFonts.poppins(
        color: colors,
        fontSize: 18,
      ),
    );
  }

  String tgl = new DateFormat("EEE, d MMM yyyy", "id_ID").format(
    DateTime.now(),
  );
  List<String> dataWidget = [
    "All",
    "Java",
    "Flutter",
    "Javascript",
    "node Js",
    "html"
  ];

  List<Tab> putTab(List tabdata) {
    List<Tab> tabWidgets = [];
    for (var i = 0; i < tabdata.length; i++) {
      tabWidgets.add(Tab(
        child: _nameTab(tabdata[i], AppColor.mainBlack),
      ));
    }

    return tabWidgets;
  }

  Widget _builderAll() {
    return FutureBuilder(
      future: Services().getProduct(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Book> listBook = snapshot.data!;
          return ViewCarts(getData: listBook);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _builderByValue(String data) {
    return FutureBuilder(
      future: Services().getProductByValue(data),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Book> listBook = snapshot.data!;
          return ViewCarts(getData: listBook);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: AppColor.mainWhite,
            automaticallyImplyLeading: false,
            expandedHeight: 80.0,
            title: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "${tgl.toString()}",
                          style: GoogleFonts.poppins(
                            color: AppColor.mainBlack,
                            fontWeight: FontWeight.w200,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Text(
                        "Welcome Back",
                        style: GoogleFonts.poppins(
                          color: AppColor.mainBlack,
                          fontWeight: FontWeight.w800,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          DefaultTabController(
            length: putTab(dataWidget).length,
            child: SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Container(
                      height: 35,
                      width: MediaQuery.of(context).size.width,
                      child: TabBar(
                        isScrollable: true,
                        unselectedLabelColor: AppColor.mainWhite,
                        indicatorColor: AppColor.mainBlack,
                        tabs: putTab(dataWidget),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(children: [
                        _builderAll(),
                        _builderByValue(dataWidget[1]),
                        _builderByValue(dataWidget[2]),
                        _builderByValue(dataWidget[3]),
                        _builderByValue(dataWidget[4]),
                        _builderByValue(dataWidget[5]),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
