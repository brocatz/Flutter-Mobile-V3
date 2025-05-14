// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_remake/changeNotifier/pageViewChangeNotifier.dart';
import 'package:flutter_form_remake/pageViews/homePageView.dart';
import 'package:flutter_form_remake/pageViews/orderPageView.dart';
import 'package:flutter_form_remake/pageViews/searchPageView.dart';
import 'package:flutter_form_remake/widgets/appBarCustom.dart';
import 'package:flutter_form_remake/widgets/bottomNavigationBar.dart';
import 'package:flutter_form_remake/widgets/drawer.dart';
// import 'package:flutter_form/changeNotifier/pageViewChangeNotifier.dart';
// import 'package:flutter_form/models/UserModel.dart';
// import 'package:flutter_form/pageViews/homePageView.dart';
// import 'package:flutter_form/pageViews/orderPageView.dart';
// import 'package:flutter_form/pageViews/searchPageView.dart';
// import 'package:flutter_form/widgets/bottomNavigationBar.dart';
// import 'package:flutter_form/widgets/drawer.dart';
// import 'package:flutter_form/widgets/appBarCustom.dart';

import 'package:provider/provider.dart';

// Is the main section of the app
// The other section will be pageView with a pageController

// This class has been rename from HomePage to NainInterface
class MainInterfaceScreen extends StatefulWidget {
  const MainInterfaceScreen({super.key});

  @override
  // _MainInterfaceState createState() => _MainInterfaceState();
  State<MainInterfaceScreen> createState() => _MainInterfaceState();
}

class _MainInterfaceState extends State<MainInterfaceScreen> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  // final PageController controller = PageController(initialPage: 0);

  // UserModel userModel;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // FirebaseAuth.instance.authStateChanges().listen((User user) {
    //   userModel =
    //       UserModel(displayName: user.displayName, emailAddress: user.email);
    //   if (user == null) {
    //     Navigator.popUntil(context, ModalRoute.withName("/"));
    //   }
    //   print(user);
    // });
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageViewChangeNotifier()),
        // ChangeNotifierProvider(
        //   create: (_) => CartNotifier(),
        // ),
      ],
      child: Scaffold(
        key: _drawerKey,
        drawer: CustomDrawer(),
        appBar: appBar(_drawerKey, context),
        body: _pageView(),
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }

  // Define the pages so that user will be able to left or rigth depend
  // on their location in the
  // animateToPage Method in the page view
  Widget _pageView() {
    // final PageController controller = PageController(initialPage: 0);
    return Consumer<PageViewChangeNotifier>(
        builder: (context, pageViewChangeNotifier, child) {
      return PageView(
        onPageChanged: (value) {
          // Get the current Page from the PageView to update the Bottom Navigation Bar
          pageViewChangeNotifier.setCurrentPage(value);
        },
        controller: pageViewChangeNotifier.getCurrentPageController,
        children: <Widget>[
          HomePageView(),
          SearchPageView(),
          OrderPageView(),
        ],
      );
    });
  }
}
