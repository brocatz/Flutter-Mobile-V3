import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_remake/changeNotifier/form_botifier.dart';
import 'package:flutter_form_remake/pageViews/register_screen.dart';
import 'package:flutter_form_remake/pageViews/register_screen_part2.dart';
import 'package:flutter_form_remake/pageViews/sign_in_screen.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_form/changeNotifier/formNotifier.dart';
// import 'package:flutter_form/pageViews/register_screen.dart';
// import 'package:flutter_form/pageViews/register_screenPart2.dart';
// import 'package:flutter_form/pageViews/signIn_screen.dart';
// import 'package:provider/provider.dart';

class RegisterAndSignInGlobalPageView extends StatelessWidget {
  const RegisterAndSignInGlobalPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FormNotifier>(
      builder: (context, formNotifier, child) => PopScope(
        child: PageView(
          controller: formNotifier.getFormPageController1,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            PageView(
              controller: formNotifier.getFormPageController2,
              scrollDirection: Axis.vertical,
              //physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                // _application(RegisterForm(formNotifier: formNotifier)),
                _application(RegisterForm()),
                _application(RegisterFormPart2()),
              ],
            ),
            _application(SignIn())
          ],
        ),
      ),
    );
  }

  Widget _application(Widget customForm) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF1d2d44)),
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF618985),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: const Color.fromRGBO(158, 158, 158, 1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              )
            ],
          ),
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.only(/*top: 20 , */ left: 10, right: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: customForm,
          ),
        ),
      ),
    );
  }

  // Future<bool> onWillPop(FormNotifier formNotifier) async {
  //   // If we are in the Sign in screen instead of the register
  //   // Tapping on the back button will make us leave the app
  //   if (formNotifier.getFormPageController1.page !=
  //       formNotifier.getFormPageController1.initialPage) return true;
  //   // We check if we are in the Register Part2 section of the form
  //   if (formNotifier.getFormPageController2.page !=
  //       formNotifier.getFormPageController2.initialPage) {
  //     formNotifier.changeToRegisterPart1().then((pageController) {
  //       pageController.animateToPage(0,
  //           duration: Duration(milliseconds: 950), curve: Curves.easeInOut);
  //     });
  //     return false;
  //   }
  //   return true;
  // }
}
