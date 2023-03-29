import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taxi_driver_app/mainScreens/main_screen.dart';
import 'package:taxi_driver_app/service/apiservice.dart';
import '../../constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController contact = TextEditingController();
  final box = GetStorage();
  bool isLoading = false;

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
                    const SizedBox(height: 30),
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
                    const SizedBox(height: 30),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: blueGreen),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                              if (isLoading) return;
                            setState(() {
                              isLoading = true;
                            });
                            await Future.delayed(const Duration(seconds: 5));
                            setState(() {
                              isLoading = false;
                            });
                            var data = await ApiService().login(contact.text);
                            if (data['message'] == 'Success') {
                              print('success');
                              box.write("driverId", data["body"]["driverId"]);
                              print(
                                  '========${data["body"]["driverId"]}========');
                              Fluttertoast.showToast(msg: 'LoggedIn Successfully');
                              Get.offAll(MainScreen());
                            } else {
                              print('failed');
                              print(
                                  '========${data["body"]["message"]}========');
                              Fluttertoast.showToast(msg: '${data["message"]}');
                            }
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: isLoading
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 24,
                                    ),
                                    Text(
                                      'PLEASE WAIT',
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.white),
                                    )
                                  ],
                                )
                              : Center(
                                child: const Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                        letterSpacing: 2),
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
