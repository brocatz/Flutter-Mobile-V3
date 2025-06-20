// import 'dart:convert';
// import 'dart:io';

// import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_remake/widgets/vehicule_card.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewSate();
}

class _HomePageViewSate extends State<HomePageView> {
  // BannerAd? _bannerAd;
  // bool _isAdLoaded = false;

  // @override
  // void initState() {
  //   super.initState();
  //   // _initBannerAd();
  // }

  // void _initBannerAd() {
  //   final adUnitId = Platform.isAndroid
  //       ? 'ca-app-pub-3940256099942544/6300978111'
  //       : 'ca-app-pub-3940256099942544/2934735716';
  //   _bannerAd = new BannerAd(
  //       size: AdSize.banner,
  //       adUnitId: adUnitId,
  //       listener: BannerAdListener(
  //           onAdLoaded: (ad) {
  //             setState(() {
  //               _isAdLoaded = true;
  //             });
  //           },
  //           onAdFailedToLoad: (ad, error) {}),
  //       request: AdRequest());

  //   _bannerAd?.load();
  // }

  var fadeAnimateTextStyle = TextStyle(
    fontSize: 20,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(32, 32, 32, 0.5)),
      child: RefreshIndicator(
        onRefresh: () {
          // This is a test for now
          // This is suppose to fetch a network request
          return Future.delayed(Duration(seconds: 1), () {
            setState(() {
              // futureRestaurantItems = fetchRestaurantItems();
            });
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Column(
            children: [
              Stack(
                children: [
                  // Positioned(
                  //   bottom: 0,
                  //   child: IconButton.outlined(
                  //       onPressed: () {
                  //         print("Icon button home press");
                  //       },
                  //       icon: Icon(Icons.plus_one)),
                  // ),
                  Container(
                      // decoration: BoxDecoration(color: Colors.red),
                      child: ListView(
                    shrinkWrap: true,
                    children: [
                      VechiculeCard(),
                      // SizedBox(
                      //   height: 40,
                      // ),
                      // VechiculeCard()
                    ],
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
