import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_driver_app/view/authentication/verify_otp_screen.dart';

import '../../constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController contact = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      width: 250,
                      height: 250,
                      child: Image.asset(
                        'assets/icons/vlogo.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text('Login To Start Your Ride',
                        style: TextStyle(
                            fontSize: 25,
                            color: blueGreen,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: contact,
                      keyboardType: TextInputType.number,
                      cursorColor: blueGreen,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: blueGreen, width: 2),
                        ),
                        hintText: 'Enter Your Phone Number',
                      ),
                      validator: (value) {
                        if (value?.length != 10)
                          return 'Mobile Number must be of 10 digit';
                        else
                          return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    const Divider(thickness: 2),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      cursorColor: blueGreen,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: blueGreen, width: 2),
                        ),
                        hintText: 'Enter Referral Code',
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(thickness: 2),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: blueGreen),
                        onPressed: () {
                          Get.to(VerifyOTPScreen());
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: const Center(
                            child: Text(
                              'Login',
                              style:
                                  TextStyle(fontSize: 23, color: Colors.white),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
