import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../mainScreens/main_screen.dart';
import '../models/package_info.dart';
import '../models/vehicle_info.dart';
import '../widgets/appbar_widget.dart';

class CarSelectionScreen extends StatefulWidget {
  CarSelectionScreen({Key? key}) : super(key: key);

  @override
  State<CarSelectionScreen> createState() => _CarSelectionScreenState();
}

class _CarSelectionScreenState extends State<CarSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Vehicles and Packages'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: blueGreen.withOpacity(0.2)),
              child: const Center(
                child:
                    Text('Select Your Vehicle', style: TextStyle(fontSize: 18)),
              ),
            ),
            ...vehicle.map(buildSingleVehicleCheckBox).toList(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: blueGreen.withOpacity(0.2)),
              child: const Center(
                child:
                    Text('Select Your Package', style: TextStyle(fontSize: 18)),
              ),
            ),
            ...package.map(buildSinglePackageCheckBox).toList(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: black.withOpacity(0.2), elevation: 0),
                onPressed: () {
                  Get.to(MainScreen());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text('Submit',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  buildVehicleCheckBox(
      {required VehicleModel vehicle, required VoidCallback onClicked}) {
    return ListTile(
        contentPadding: const EdgeInsets.all(5),
        leading: Checkbox(
            activeColor: blueGreen,
            value: vehicle.value,
            onChanged: (value) => onClicked()),
        title: Text(
          vehicle.title,
          style: const TextStyle(fontSize: 18),
        ),
        horizontalTitleGap: 1,
        onTap: onClicked);
  }

  buildSingleVehicleCheckBox(VehicleModel vehicle) {
    return buildVehicleCheckBox(
        vehicle: vehicle,
        onClicked: () {
          setState(() {
            final newValue = !vehicle.value;
            vehicle.value = newValue;
          });
        });
  }

  buildPackageCheckBox(
      {required PackageModel package, required VoidCallback onClicked}) {
    return ListTile(
        contentPadding: const EdgeInsets.all(5),
        leading: Checkbox(
            activeColor: blueGreen,
            value: package.value,
            onChanged: (value) => onClicked()),
        title: Text(
          package.title,
          style: const TextStyle(fontSize: 18),
        ),
        horizontalTitleGap: 1,
        onTap: onClicked);
  }

  buildSinglePackageCheckBox(PackageModel package) {
    return buildPackageCheckBox(
        package: package,
        onClicked: () {
          setState(() {
            final newValue = !package.value;
            package.value = newValue;
          });
        });
  }
}
