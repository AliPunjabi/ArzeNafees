// ignore_for_file: prefer_const_constructors

import 'package:arzenafees/Components/app_lable_widget.dart';
import 'package:arzenafees/Components/card_password_textfield.dart';
import 'package:arzenafees/Components/custom_elevated_button.dart';
import 'package:arzenafees/Components/custom_text_field.dart';
import 'package:arzenafees/Components/transitions.dart';
import 'package:arzenafees/Components/Constants.dart';
import 'package:arzenafees/Screens/signupscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:arzenafees/Screens/homescreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRememberMe = false;
  final bool _passwordVisible = true;
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;

  final _textEmail = TextEditingController();
  final _textPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFF2F2F4),
            Color(0xFFF2F2F4),
          ],
        ),
      ),
      alignment: Alignment.center,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          primary: true,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 130,
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      'Login',
                      style: TextStyle(
                        color: const Color(0xFF03041D),
                        fontSize: 30.0,
                        fontFamily: Constants.appFont,
                        height: 0.9,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Welcome back you\'ve been missed!',
                      style: TextStyle(
                        color: Color(0xFF03041D),
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 20),
                    AppLabelWidget(
                      title: 'Email',
                    ),
                    CustomTextField(
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).nextFocus();
                      },
                      textInputAction: TextInputAction.next,
                      hintText: 'Enter Your Email',
                      textInputType: TextInputType.emailAddress,
                      textEditingController: _textEmail,
                      validator: validateEmail,
                    ),
                    const SizedBox(height: 10),
                    AppLabelWidget(
                      title: 'Password',
                    ),
                    CardPasswordTextFieldWidget(
                        textEditingController: _textPassword,
                        validator: validatePassword,
                        hintText: 'Enter Your Password',
                        isPasswordVisible: _passwordVisible),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              Transitions(
                                transitionType: TransitionType.fade,
                                curve: Curves.bounceInOut,
                                reverseCurve: Curves.bounceOut,
                              ),
                            );
                          },
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                              fontFamily: Constants.appFont,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Constants.checkNetwork().whenComplete(() async {
                                  {
                                    setState(() {
                                      showSpinner = true;
                                    });
                                    try {
                                      final newUser = await _auth
                                          .signInWithEmailAndPassword(
                                              email: _textEmail.text,
                                              password: _textPassword.text);
                                      if (newUser != null) {
                                        Navigator.of(context).push(
                                          Transitions(
                                              transitionType:
                                                  TransitionType.fade,
                                              curve: Curves.bounceInOut,
                                              reverseCurve: Curves.bounceOut,
                                              widget: HomeScreen()),
                                        );
                                      }
                                    } catch (e) {
                                      print(e);
                                    }
                                    setState(() {
                                      showSpinner = false;
                                    });
                                  }
                                });
                              }
                            },
                            buttonLabel: 'Login',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          Transitions(
                              transitionType: TransitionType.fade,
                              curve: Curves.bounceInOut,
                              reverseCurve: Curves.bounceOut,
                              widget: SignupScreen()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Do not have account? ',
                            style: TextStyle(
                              fontFamily: Constants.appFont,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Create Now',
                            style: TextStyle(
                                fontFamily: Constants.appFont,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? validateEmail(String? value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern as String);
    if (value!.isEmpty) {
      return 'Email Required';
    } else if (!regex.hasMatch(value)) {
      return 'Enter valid email';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    Pattern pattern = r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regex = RegExp(pattern as String);
    if (value!.isEmpty) {
      return 'Password Required';
    } else if (!regex.hasMatch(value)) {
      return 'Enter Valid Password';
    } else {
      return null;
    }
  }
}
