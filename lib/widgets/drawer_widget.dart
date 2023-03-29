import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_driver_app/view/profile_screen.dart';

import '../mainScreens/main_screen.dart';
import '../models/driver_profile_model.dart';
import '../service/apiservice.dart';
import '../view/authentication/login_screen.dart';
import '../view/notification_screen.dart';
import '../view/reports_screen.dart';
import '../view/service_screen.dart';
import '../view/terms_and_conditions_screen.dart';
import '../view/transaction_history_screen.dart';
import '../view/trip_details_screen.dart';
import '../view/trip_history_screen.dart';
import '../view/wallet_screen.dart';
import 'menu_item.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {

  DriverProfileModel? driverProfileModel;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    driverProfileModel = await ApiService().driverProfile();
    if(driverProfileModel != null){
      setState(() {
        isLoading = true;
      });
      setState(() {
        driverProfileModel = driverProfileModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.80,
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 20,
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Get.to(ProfileScreen());
                  },
                  child:isLoading == false ? Container() : Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            "${driverProfileModel!.body!.name}",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "${driverProfileModel!.body!.contact}",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                MenuItems(
                    title: 'Dashboard',
                    icon: Icons.analytics_outlined,
                    onTap: () {
                      Get.to(MainScreen());
                    },
                    color: Colors.black,
                    size: 18),
                MenuItems(
                    title: 'Trip Details',
                    icon: Icons.drive_eta_outlined,
                    onTap: () {
                      Get.to(const TripDetailsScreen());
                    },
                    color: Colors.black,
                    size: 18),
                MenuItems(
                    title: 'Trip History',
                    icon: Icons.drive_eta_outlined,
                    onTap: () {
                      Get.to(const TripHistoryScreen());
                    },
                    color: Colors.black,
                    size: 18),
                MenuItems(
                    title: 'Notification',
                    icon: Icons.notification_important_outlined,
                    onTap: () {
                      Get.to(const NotificationScreen());
                    },
                    color: Colors.black,
                    size: 18),
                MenuItems(
                    title: 'Reports',
                    icon: Icons.assignment_outlined,
                    onTap: () {
                      Get.to(const ReportsScreen());
                    },
                    color: Colors.black,
                    size: 18),
                MenuItems(
                    title: 'Wallet',
                    icon: Icons.account_balance_wallet_outlined,
                    onTap: () {
                      Get.to(const WalletScreen());
                    },
                    color: Colors.black,
                    size: 18),
                MenuItems(
                    title: 'Transaction History',
                    icon: Icons.history,
                    onTap: () {
                      Get.to(const TransactionHistoryScreen());
                    },
                    color: Colors.black,
                    size: 18),
                MenuItems(
                    title: 'Terms and Conditions',
                    icon: Icons.description,
                    onTap: () {
                      Get.to(const TermsAndConditionsScreen());
                    },
                    color: Colors.black,
                    size: 18),
                MenuItems(
                    title: 'Driver Care',
                    icon: Icons.help_outline_rounded,
                    onTap: () {
                      Get.to(const ServiceScreen());
                    },
                    color: Colors.black,
                    size: 20),
                MenuItems(
                    title: 'Logout',
                    icon: Icons.logout,
                    onTap: () {
                      Get.offAll(const LoginScreen());
                    },
                    color: Colors.black,
                    size: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
