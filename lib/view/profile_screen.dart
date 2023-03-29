import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taxi_driver_app/constants/colors.dart';
import 'package:taxi_driver_app/models/driver_profile_model.dart';
import 'package:taxi_driver_app/service/apiservice.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/drawer_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

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
    return Scaffold(
      appBar: const AppbarWidget(title: 'Profile Details'),
      drawer: const DrawerWidget(),
      body: buildProfile(),
    );
  }

  // buildProfile() {
  //   return Padding(
  //     padding: const EdgeInsets.all(15),
  //     child: ListView(
  //       children: [
  //         const CircleAvatar(
  //           radius: 60,
  //           backgroundColor: Colors.blueGrey,
  //         ),
  //         const SizedBox(height: 20),
  //         Row(
  //           children: const [
  //             Text(
  //               'ID Number :',
  //               style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
  //             ),
  //             SizedBox(width: 10),
  //             Text(
  //               'ABCD1234',
  //               style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(height: 20),
  //         const Text(
  //           'Name',
  //           style: TextStyle(fontSize: 15),
  //         ),
  //         const SizedBox(height: 5),
  //         TextField(
  //           cursorColor: blueGreen,
  //           decoration: InputDecoration(
  //               contentPadding: const EdgeInsets.all(10),
  //               border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(5),
  //               ),
  //               focusedBorder: OutlineInputBorder(
  //                   borderSide: BorderSide(color: blueGreen, width: 2),
  //                   borderRadius: BorderRadius.circular(5))),
  //         ),
  //         const SizedBox(height: 20),
  //         const Text(
  //           'Phone Number',
  //           style: TextStyle(fontSize: 15),
  //         ),
  //         const SizedBox(height: 5),
  //         TextField(
  //           cursorColor: blueGreen,
  //           decoration: InputDecoration(
  //               contentPadding: const EdgeInsets.all(10),
  //               border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(5),
  //               ),
  //               focusedBorder: OutlineInputBorder(
  //                   borderSide: BorderSide(color: blueGreen, width: 2),
  //                   borderRadius: BorderRadius.circular(5))),
  //         ),
  //         const SizedBox(height: 20),
  //         const Text(
  //           'Other Phone Number (optional)',
  //           style: TextStyle(fontSize: 15),
  //         ),
  //         const SizedBox(height: 5),
  //         TextField(
  //           cursorColor: blueGreen,
  //           decoration: InputDecoration(
  //               contentPadding: const EdgeInsets.all(10),
  //               border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(5),
  //               ),
  //               focusedBorder: OutlineInputBorder(
  //                   borderSide: BorderSide(color: blueGreen, width: 2),
  //                   borderRadius: BorderRadius.circular(5))),
  //         ),
  //         const SizedBox(height: 20),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             const Text(
  //               'Language : ',
  //               style: TextStyle(fontSize: 15),
  //             ),
  //             Row(
  //               children: [
  //                 ...language.map(buildSingleLanguageCheckBox).toList()
  //               ],
  //             )
  //           ],
  //         ),
  //         const SizedBox(height: 20),
  //         Row(
  //           children: const [
  //             Text(
  //               'Licence Number : ',
  //               style: TextStyle(fontSize: 15),
  //             ),
  //             Text(
  //               'TN99AB123456',
  //               style: TextStyle(fontSize: 15, color: Colors.black54),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(height: 20),
  //         Row(
  //           children: const [
  //             Text(
  //               'Expiry Date : ',
  //               style: TextStyle(fontSize: 15),
  //             ),
  //             Text(
  //               '31/05/2045',
  //               style: TextStyle(fontSize: 15, color: Colors.black54),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(height: 20),
  //         Row(
  //           children: const [
  //             Text(
  //               'Referral Code : ',
  //               style: TextStyle(fontSize: 15),
  //             ),
  //             Text(
  //               'ABCD1234',
  //               style: TextStyle(fontSize: 15, color: Colors.black54),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(height: 20),
  //         Row(
  //           children: const [
  //             Text(
  //               'Referred Drivers : ',
  //               style: TextStyle(fontSize: 15),
  //             ),
  //             Text(
  //               '3',
  //               style: TextStyle(fontSize: 15, color: Colors.black54),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(height: 30),
  //         ElevatedButton(
  //             onPressed: () {
  //               Get.off(MainScreen());
  //             },
  //             style: ElevatedButton.styleFrom(
  //                 primary: black, padding: const EdgeInsets.all(10)),
  //             child: const Text(
  //               "Update",
  //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
  //             ))
  //       ],
  //     ),
  //   );
  // }

buildProfile(){
    return isLoading == false ? Center(child: CircularProgressIndicator(color: blueGreen,),) : Column(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => SimpleDialog(
                  contentPadding: EdgeInsets.all(0),
                  children: [
                    Image.network(
                        'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg'),
                  ],
                ));
          },
          child: CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage('https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg'),
          ),
        ),
        ListTile(
          title:
          Text('Name', style: TextStyle(fontSize: 18, letterSpacing: 2)),
          trailing: Text('${driverProfileModel!.body!.name}',
              style: TextStyle(fontSize: 18, letterSpacing: 2)),
        ),
        ListTile(
          title: Text('Phone Number',
              style: TextStyle(fontSize: 18, letterSpacing: 2)),
          trailing: Text('${driverProfileModel!.body!.contact}',
              style: TextStyle(fontSize: 18, letterSpacing: 2)),
        ),
        ListTile(
          title: Text('District',
              style: TextStyle(fontSize: 18, letterSpacing: 2)),
          trailing: Text('${driverProfileModel!.body!.district}',
              style: TextStyle(fontSize: 18, letterSpacing: 2)),
        ),
        ListTile(
          title: Text('License Number',
              style: TextStyle(fontSize: 18, letterSpacing: 2)),
          trailing: Text('${driverProfileModel!.body!.licenseNumber}',
              style: TextStyle(fontSize: 18, letterSpacing: 2)),
        ),
        ListTile(
          title: Text('Expiry Date',
              style: TextStyle(fontSize: 18, letterSpacing: 2)),
          trailing: Text(
              '${DateFormat('dd-MM-yyyy').format(driverProfileModel!.body!.expiryDate!)}',
              style: TextStyle(fontSize: 18, letterSpacing: 2)),
        ),
        ListTile(
            title: Text('Aadhaar Front',
                style: TextStyle(fontSize: 18, letterSpacing: 2)),
            trailing: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
                      contentPadding: EdgeInsets.all(0),
                      children: [
                        Image.network(
                            'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg'),
                      ],
                    ));
              },
              child: Container(
                width: 50,
                height: 50,
                child: Image.network(
                    'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg'),
              ),
            )),
        ListTile(
          title: Text('Aadhaar Back',
              style: TextStyle(fontSize: 18, letterSpacing: 2)),
          trailing: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                    contentPadding: EdgeInsets.all(0),
                    children: [
                      Image.network(
                          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg'),
                    ],
                  ));
            },
            child: Container(
              width: 50,
              height: 50,
              child: Image.network(
                  'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg'),
            ),
          ),
        ),
        ListTile(
          title: Text('License Front',
              style: TextStyle(fontSize: 18, letterSpacing: 2)),
          trailing: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                    contentPadding: EdgeInsets.all(0),
                    children: [
                      Image.network(
                          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg'),
                    ],
                  ));
            },
            child: Container(
              width: 50,
              height: 50,
              child: Image.network(
                  'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg'),
            ),
          ),
        ),
        ListTile(
          title: Text('License Back',
              style: TextStyle(fontSize: 18, letterSpacing: 2)),
          trailing: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                    contentPadding: EdgeInsets.all(0),
                    children: [
                      Image.network(
                          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg'),
                    ],
                  ));
            },
            child: Container(
              width: 50,
              height: 50,
              child: Image.network(
                  'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg'),
            ),
          ),
        ),
      ],
    );
}

}
