import 'package:flutter/material.dart';
import 'package:flutter_form_remake/changeNotifiyer/cartNotifier.dart';
import 'package:badges/badges.dart' as badges;

import 'package:provider/provider.dart';

AppBar appBar(GlobalKey<ScaffoldState>? _drawerKey, BuildContext context) {
  return AppBar(
    title: Text(
      'Discover',
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Color(0xFF1d2d44),
    centerTitle: true,
    leading: IconButton(
      icon: Icon(
        Icons.menu,
        color: Colors.white,
      ),
      onPressed: () {
        _drawerKey?.currentState?.openDrawer();
      },
    ),
    elevation: 4.0,
    actions: <Widget>[
      Consumer<CartNotifier>(
        builder: (context, cartNotifier, child) => IconButton(
            icon: badges.Badge(
                // badgeStyle: badges.BadgeStyle(badgeColor: Colors.white),
                showBadge: cartNotifier.showBadgeNotification,
                position: badges.BadgePosition.topEnd(top: -13),
                badgeContent: Text(
                  cartNotifier.totalNumberOfSelectedItems.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                )),
            onPressed: () {
              // open the Cart Page
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (_) => CartScreen()));
            }),
      )
    ],
  );
}
