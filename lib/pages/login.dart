import 'dart:ffi';

import 'package:doctor_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formstate1 = GlobalKey();
  GlobalKey<FormState> formstate2 = GlobalKey();

  saveprefs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("name", nameController.text);
    sharedPreferences.setString("password", passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        // Background image covering the page
        Positioned.fill(
          child: Image.asset(
            "assets/img/login pagedesk.png",
            fit: BoxFit.cover,
          ),
        ),

        // Content centered on the page
        Center(
            child: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 1.6,
          child:

              // Image with form fields and login button
              Stack(children: [
            Image.asset(
              "assets/img/stroke02.png",
              fit: BoxFit.fill,
            ),
            Container(
              margin: const EdgeInsets.only(top: 60),
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width / 3.5,
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          /*validator: (value) {
                            if (value!.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },*/
                          cursorColor: const Color(0xff0C8A7D),
                          keyboardType: TextInputType.name,
                          controller: nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff0C8A7D)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff0C8A7D)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                            ),
                            hintText: "User name",
                            hintStyle: TextStyle(
                              color: Color(0xff67B6AE),
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                            ),
                            labelText: 'User Name',
                            labelStyle: TextStyle(
                                color: Color(0xff0C8A7D), fontSize: 18),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                          /* validator: (value) {
                            if (value!.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },*/
                          cursorColor: const Color(0xff0C8A7D),
                          obscureText: true,
                          controller: passwordController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff0C8A7D)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff0C8A7D)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: Color(0xff67B6AE),
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: Color(0xff0C8A7D), fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Container(
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff0C8A7D),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () async {
                            /*if (formstate1.currentState!.validate()) {
                          print("valid");
                                                } else {
                          print("not valid");
                                                }
                                                if (formstate2.currentState!.validate()) {
                          print("valid");
                                                } else {
                          print("not valid");
                                                }*/

                            await saveprefs();

                            //if (formstate1.currentState!.validate() &
                            //formstate2.currentState!.validate()) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                            //}
                            print(nameController.text);
                            print(passwordController.text);
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: Color(0xffFFFFFF), fontSize: 24),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ]),
                  ),
                ]),
              ),
            ),
          ]),
        ))
      ],
    ));
  }
}
