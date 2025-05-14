import 'package:flutter/material.dart';
import 'package:flutter_form_remake/constant/Constant.dart';

class OrderPageView extends StatelessWidget {
  const OrderPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: backgroundColor),
      child: Center(
        child: Text('Orders'),
      ),
    );
  }
}
