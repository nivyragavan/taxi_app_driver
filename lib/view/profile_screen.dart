import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../mainScreens/main_screen.dart';
import '../models/language_info.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/drawer_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Profile Details'),
      drawer: const DrawerWidget(),
      body: buildProfile(),
    );
  }

  buildProfile() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView(
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.blueGrey,
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Text(
                'ID Number :',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              Text(
                'ABCD1234',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Name',
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 5),
          TextField(
            cursorColor: blueGreen,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: blueGreen, width: 2),
                    borderRadius: BorderRadius.circular(5))),
          ),
          const SizedBox(height: 20),
          const Text(
            'Phone Number',
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 5),
          TextField(
            cursorColor: blueGreen,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: blueGreen, width: 2),
                    borderRadius: BorderRadius.circular(5))),
          ),
          const SizedBox(height: 20),
          const Text(
            'Other Phone Number (optional)',
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 5),
          TextField(
            cursorColor: blueGreen,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: blueGreen, width: 2),
                    borderRadius: BorderRadius.circular(5))),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Language : ',
                style: TextStyle(fontSize: 15),
              ),
              Row(
                children: [
                  ...language.map(buildSingleLanguageCheckBox).toList()
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Text(
                'Licence Number : ',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                'TN99AB123456',
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Text(
                'Expiry Date : ',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                '31/05/2045',
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Text(
                'Referral Code : ',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                'ABCD1234',
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Text(
                'Referred Drivers : ',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                '3',
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                Get.off(MainScreen());
              },
              style: ElevatedButton.styleFrom(
                  primary: black, padding: const EdgeInsets.all(10)),
              child: const Text(
                "Update",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ))
        ],
      ),
    );
  }

  buildLanguageCheckBox(
      {required LanguageModel language, required VoidCallback onClicked}) {
    return Expanded(
      child: ListTile(
          contentPadding: const EdgeInsets.all(5),
          leading: Checkbox(
              activeColor: blueGreen,
              value: language.value,
              onChanged: (value) => onClicked()),
          title: Text(
            language.title,
            style: const TextStyle(fontSize: 15),
          ),
          horizontalTitleGap: 1,
          onTap: onClicked),
    );
  }

  buildSingleLanguageCheckBox(LanguageModel language) {
    return buildLanguageCheckBox(
        language: language,
        onClicked: () {
          setState(() {
            final newValue = !language.value;
            language.value = newValue;
          });
        });
  }
}
