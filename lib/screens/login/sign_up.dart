// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_bot/models/signupModel/signup_get_response.dart';
import 'package:task_bot/screens/dashboard/navigationpages/mainpage.dart';
import 'package:task_bot/screens/login/loginpage.dart';
import 'package:task_bot/services/api_service.dart';
import 'package:task_bot/services/helper_dialog.dart';
import 'package:task_bot/widgets/buttons.dart';
import 'package:task_bot/widgets/textinput.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();
  static final emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswwordCont = TextEditingController();

  final signupCall = ApiCalls();

  static var genderRadioBtnVal = "Male";
  final styles = TextStyle(fontSize: 16, fontWeight: FontWeight.w400);

  SignupGetResponse? signUpData;

  bool checked = false;

  requestSignUp(
      // String fullname, String username, String email, String gender,
      //   String passwordd, String confirmpassword
      ) async {
    signUpData = await signupCall.signUp(
        _fullNameController.text,
        _usernameController.text,
        emailController.text,
        genderRadioBtnVal.toString(),
        _passwordController.text,
        _confirmPasswwordCont.text,
        emailController.toString());
    if (signUpData != null) {
      Get.off(() => LoginPage());
      // DialogHelper.signUpSuccess();

      return signUpData;
      // Get.off(Mainpage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 25, right: 25),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Image(
                    width: 160,
                    height: 45,
                    fit: BoxFit.contain,
                    image: AssetImage("assets/Group 46.png"),
                    color: Color(0xFF8030D0),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      InputForm(
                          label: "Full Name",
                          validator: (value) {
                            if (value == null) {
                              return "Please enter your full name";
                            } else if (value.length < 5) {
                              return "Full name is minumum of 5 characters";
                            }
                          },
                          controller: _fullNameController),
                      InputForm(
                          label: "Username",
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Username cannot be empty';
                            } else if (value.length < 3) {
                              return 'Email cannot be empty';
                            }
                          },
                          controller: _usernameController),
                      InputForm(
                        label: "Email Address",
                        validator: (value) {
                          // if (value == null) return 'Email cannot be empty';

                          if (value.isEmpty) return 'Email cannot be empty';

                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);

                          return !emailValid
                              ? 'Enter a Valid Email Address'
                              : null;
                        },
                        controller: emailController,
                      ),
                      // RadioButton(  ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Gender",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 18,
                                    width: 18,
                                    child: Radio<String>(
                                      // key: genderRadioBtnVal,
                                      // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      activeColor: Color(0xFF8030D0),
                                      value: "Male",
                                      groupValue: genderRadioBtnVal,
                                      onChanged: _handleGenderChange,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Male",
                                      style: styles,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  SizedBox(
                                    height: 18,
                                    width: 18,
                                    child: Radio<String>(
                                      activeColor: Color(0xFF8030D0),
                                      value: "Female",
                                      groupValue: genderRadioBtnVal,
                                      onChanged: _handleGenderChange,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Female",
                                      style: styles,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  SizedBox(
                                    height: 18,
                                    width: 18,
                                    child: Radio<String>(
                                      activeColor: Color(0xFF8030D0),
                                      value: "Others",
                                      groupValue: genderRadioBtnVal,
                                      onChanged: _handleGenderChange,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Others",
                                      style: styles,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      InputFormPass(
                        label: "Password",
                        validator: (value) {
                          if (value == null) {
                            return "Enter your password";
                          } else if (value.length < 5) {
                            return "Password is minumum of 8 characters";
                          }
                        },
                        controller: _passwordController,
                      ),
                      InputFormPass(
                        label: "Confirm Password",
                        controller: _confirmPasswwordCont,
                        validator: (value) {
                          if (value == null) {
                            return "Confirm your password";
                          } else if (value.isEmpty) {
                            return 'Field cannot be empty';
                          } else if (value != _passwordController.text) {
                            return "Password doesn't match";
                          }
                        },
                      ),
                      InkWell(
                          onTap: () async {
                            // print(genderRadioBtnVal);
                            if (_formKey.currentState!.validate() &&
                                genderRadioBtnVal.toString() != "Null") {
                              debugPrint("Valid");
                              DialogHelper.showLoading();
                              await requestSignUp();
                              // print(successful);
                              debugPrint(signUpData?.status);
                            }
                          },
                          child: SignUpButton()),
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 20),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => LoginPage(),
                                transition: Transition.zoom);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xFF16163F)),
                              ),
                              Text(
                                "Log in",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xFF8030D0)),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleGenderChange(String? value) {
    setState(() {
      genderRadioBtnVal = value!;
      // print(genderRadioBtnVal.toString());
    });
  }
}
