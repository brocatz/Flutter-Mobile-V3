import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_remake/changeNotifier/form_notifier.dart';
import 'package:flutter_form_remake/constant/Constant.dart';

import 'package:flutter_form_remake/widgets/error_custom_registration_animation.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});
  @override
  State<RegisterForm> createState() {
    return _RegisterFormState();
  }
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String? email;

  String? emailError;
  bool _isEmailErrorActive = false;

  @override
  Widget build(BuildContext buildContext) {
    return Consumer<FormNotifier>(
      builder: (context, formNotifier, child) => Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  // Order of rendering
                  children: [
                    ListView(shrinkWrap: true, children: [
                      _buildFormTitle(),
                      SizedBox(height: 50),
                      _buildEmail(),
                      SizedBox(height: 10),
                      buildCustomErrorWidgetOfType(
                          emailError, _isEmailErrorActive),
                      SizedBox(height: 15),
                      _buildContinueButton(),
                      SizedBox(height: 15),
                      Divider(color: Color.fromRGBO(0, 0, 0, .5)),
                    ]),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [_buildAlreadySignIn(formNotifier)])
            ],
          )),
    );
  }

  Widget _buildFormTitle() {
    return Text(
      "Register",
      style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: textDarkColor),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      style: TextStyle(
        fontSize: 16,
      ),
      textCapitalization: TextCapitalization.none,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Enter Email',
          prefixIcon: Icon(Icons.mail),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Color(0xFFdee2ff),
          errorStyle: TextStyle(height: 0, color: Colors.transparent)),
      onSaved: (value) {
        email = value;
      },
      onChanged: (value) {
        setState(() {
          _isEmailErrorActive = false;
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            emailError = 'Please enter an email Adress';
            _isEmailErrorActive = true;
          });
          return emailError;
        }

        if (!EmailValidator.validate(value)) {
          setState(() {
            emailError = 'Please enter a valid email address';
            _isEmailErrorActive = true;
          });
          return emailError;
        }

        return null; // Validation Successful
      },
      enableInteractiveSelection: false,
      // toolbarOptions: ToolbarOptions(
      //   copy: false,
      //   cut: false,
      //   selectAll: false,
      //   paste: false,
      // ),
    );
  }

  Widget _buildContinueButton() {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(formButtonColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))))),
      child: Text("Continue",
          style: TextStyle(fontSize: 16.0, color: textDarkColor)),
      onPressed: () async {
        //  Step 1 :  Save the current form values
        // In this case the value of the email , without any errors
        if (!_formkey.currentState!.validate()) {
          return;
        }

        _formkey.currentState!.save();
        //  Step 2 : Use the Provider, changeNotfifier to switch pageview
        //
      },
    );
  }

  Widget _buildAlreadySignIn(FormNotifier formNotifier) => TextButton(
        style:
            ButtonStyle(textStyle: WidgetStateTextStyle.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return TextStyle(
                fontSize: 20.0,
                color: Color.fromARGB(255, 37, 3, 132),
                decoration: TextDecoration.underline);
          }
          return TextStyle(
              fontSize: 20.0,
              color: Colors.blueGrey[800],
              decoration: TextDecoration.underline);
        })),
        onPressed: () {
          print("Button Pressed");
          formNotifier.changeToSignInPagePageView();
          //
        },
        child: Text(
          "Already have an account ?",
          style: TextStyle(color: Colors.blueGrey[700]),
        ),
      );
}
