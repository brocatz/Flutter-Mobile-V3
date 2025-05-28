import 'package:flutter/material.dart';
import 'package:flutter_form_remake/constant/constant.dart';
import 'package:flutter_form_remake/screens/main_interface.dart';
import 'package:sign_button/sign_button.dart';
import 'dart:io';

// import 'package:flutter_form/constant/Constant.dart';

// import '../screens/home_screen.dart';

// This is in the pageView
class SignIn extends StatefulWidget {
  const SignIn({super.key});

  // _SignInState createState() => _SignInState();
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isPasswordObsure = true;

  String? emailAdress;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    // SizedBox(height: 120),
                    _buildTitle(),
                    SizedBox(height: 15),
                    _buildEmail(),
                    SizedBox(height: 15),
                    _buildPassword(),
                    SizedBox(height: 15),
                    _buildSubmit(),
                    SizedBox(height: 15),
                    Divider(
                      color: Color.fromRGBO(0, 0, 0, .3),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSignInWithGoogle(),
                        _buildSignInWithFacebook(),
                        // Only for mobile devices so Plateform.isMACOS is not necessary
                        (Platform.isIOS)
                            ? _buildSignInWithApple()
                            : SizedBox.shrink()
                      ],
                    ),
                  ],
                ),
                Positioned(
                  bottom: -60,
                  left: 0,
                  right: 0,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [_buildLostPassword()]),
                )
              ]),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    // does not do anything yet
    return Text('Login',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
        ));
  }

  Widget _buildEmail() {
    return TextFormField(
      initialValue: emailAdress,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFdee2ff),
          hintText: 'Enter email',
          prefixIcon: Icon(Icons.mail_rounded),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none)),
      validator: (value) {
        return null;
      },
      onSaved: (value) {
        emailAdress = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      initialValue: password,
      obscureText: isPasswordObsure,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFdee2ff),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
        hintText: 'Enter Password',
        prefixIcon: Icon(Icons.lock_rounded),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordObsure ? Icons.visibility_off : Icons.visibility,
            color: isPasswordObsure ? Colors.blueGrey : Colors.blue,
          ),
          onPressed: () {
            setState(() {
              isPasswordObsure = !isPasswordObsure;
            });
          },
        ),
      ),
      validator: (value) {
        return null;
      },
      onSaved: (value) {
        password = value;
      },
    );
  }

  Widget _buildSubmit() {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(formButtonColor),
          // backgroundColor: MaterialStateProperty.all<Color>(formButtonColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))))),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
      onPressed: () async {
        // Make sure that all the fields are validated proprely
        if (!_formKey.currentState!.validate()) {
          print('Errors on form');
          return;
        }
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          // return HomePage();
          return MainInterfaceScreen();
        }));
        _formKey.currentState!.save();

        // Then here we sign in and then we use Navigator.push() to get into our homepage
      },
    );
  }

  Widget _buildSignInWithGoogle() => SignInButton.mini(
      buttonType: ButtonType.google,
      onPressed: () async {
        //code for google sign in goes here
      });

  Widget _buildSignInWithFacebook() => SignInButton.mini(
      buttonType: ButtonType.facebook,
      onPressed: () async {
        // Facebook sign in
      });

  // Only availble for apple devices such as laptops and phones
  Widget _buildSignInWithApple() => SignInButton.mini(
      buttonType: ButtonType.apple,
      onPressed: () async {
        // Apple Sign In
      });

  Widget _buildLostPassword() => InkWell(
        onTap: () async {},
        child: Text(
          "Lost Password ?",
          style: TextStyle(
            color: Colors.blueGrey[800],
            decoration: TextDecoration.underline,
          ),
        ),
      );
}
