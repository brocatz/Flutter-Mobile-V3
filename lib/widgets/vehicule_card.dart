import 'package:flutter/material.dart';
import 'package:flutter_form_remake/constant/Constant.dart';

class VechiculeCard extends StatelessWidget {
  const VechiculeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white70,
          border: Border.all(color: Colors.black54, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black87.withValues(alpha: 0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
      height: 180,
      child: Column(
        children: [statusBar(), mainContentArea()],
      ),
    );
  }

  Widget mainContentArea() => Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          columnLeftSideR(),
          columnMiddleSide(),
          columnRight(),
        ]),
      );

  Widget columnLeftSideR() => Column(
        children: [
          Image(
              width: 64,
              height: 64,
              image: AssetImage("assets/images/tesla-logo.png")),
          SizedBox(
            height: 15,
          ),
          Text(
            "2017",
            style: TextStyle(fontSize: 20),
          ),
        ],
      );

  Widget columnMiddleSideR() => Column(
        children: [
          Text(
            "H434 3434",
            style: TextStyle(fontSize: 32),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Quebec",
            style: TextStyle(fontSize: 20),
          ),
        ],
      );

  Widget columnRight() => Container(
      child: Image(
          width: 64,
          height: 64,
          image: AssetImage("assets/images/caricons/electric-car.png")));

  // Car Icon + License Plate number
  Widget topRowOfColumnLeftSide() {
    return Row(
      children: [
        Image(
            width: 64,
            height: 64,
            image: AssetImage("assets/images/tesla-logo.png")),
        Text(
          "H434 3434",
          style: TextStyle(fontSize: 32),
        ),
      ],
    );
  }

  // Car Year + State/ Province or country
  Widget bottomOfColumnLeftSide() {
    return Row(
      children: [
        Text(
          "2017",
          style: TextStyle(fontSize: 24),
        ),
        Text(
          "Quebec",
          style: TextStyle(fontSize: 24),
        )
      ],
    );
  }

  Widget columnLeftSide() {
    return Column(children: [
      Image(
          width: 64,
          height: 64,
          image: AssetImage("assets/images/tesla-logo.png")),
      SizedBox(
        height: 8,
      ),
      Text(
        "2017",
        style: TextStyle(fontSize: 24),
      )
    ]);
  }

  Widget columnMiddleSide() {
    return Column(children: [
      Text(
        "H434 3434",
        style: TextStyle(fontSize: 32),
      ),
      SizedBox(
        height: 8,
      ),
      Text(
        "Quebec",
        style: TextStyle(fontSize: 24),
      )
    ]);
  }

  // Will have an icon for idicating the vechicule type
  Widget columnRightSide() {
    return Column(children: [
      Image(
        width: 64,
        height: 64,
        image: AssetImage("assets/images/caricons/electric-car.png"),
      )
    ]);
  }

  Widget statusBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: Color.fromRGBO(32, 32, 32, .99),
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withValues(alpha: 0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Row(
        children: [
          Image(
            width: 24,
            height: 24,
            image: AssetImage("assets/images/canada-icon.png"),
          ),
          Expanded(
            child: Text(
              "My car",
              style: TextStyle(fontSize: 24, color: cartTitleColor),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  //
}
