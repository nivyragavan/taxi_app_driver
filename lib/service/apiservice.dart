import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_driver_app/constants/apiconstants.dart';

import '../models/driver_profile_model.dart';

class ApiService {

  final box = GetStorage();

  Future login(String contact) async {
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.login;
    var uri = Uri.parse(completeUrl);
    final response = await client.post(uri, body: {'contact': contact});
    if(response.statusCode == 200){
      print(response.body.toString());
      var convertedDataToJson = jsonDecode(response.body);
      return convertedDataToJson;
    }
  }

  Future<DriverProfileModel> driverProfile() async {
    var driverId = box.read('driverId');
    var params = {'id' : '$driverId'};
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.profileView;
    var uri = Uri.parse(completeUrl);
    var finalUrl = uri.replace(queryParameters:params);
    final response = await client.get(finalUrl);
    if(response.statusCode == 200){
      print(response.body.toString());
      var json = response.body;
      return driverProfileModelFromJson(json);
    }
    return null!;
  }
}
