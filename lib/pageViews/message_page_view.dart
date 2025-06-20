import 'package:flutter/material.dart';
import 'package:flutter_form_remake/constant/constant.dart';

class MessagePageView extends StatelessWidget {
  const MessagePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: backgroundColor),
      child: Center(
        child: Text('Message'),
      ),
    );
  }
}
