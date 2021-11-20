import 'dart:convert';

import 'package:get/get.dart';
import 'package:ugaoo/Model/pincodeParser.dart';
import 'package:http/http.dart' as https;

class PincodeAPI extends GetxController {
  var pincodeData = PincodeModel().obs;
  String? _city, _state;

  var addressType = "None".obs;

  void fetchData(var pincode) async {
    print("Inside Pincode");
    var baseUrl = "http://www.postalpincode.in/api/pincode/";
    var url = Uri.parse(baseUrl + pincode);
    var response = await https.get(url);

    if (response.statusCode == 200) {
      try {
        var jsonResponse = jsonDecode(response.body);
        pincodeData.value = PincodeModel.fromJson(jsonResponse);

        if (pincodeData.value.postOffice!.isNotEmpty) {
          _city = pincodeData.value.postOffice![0].taluk.toString();
          _state = pincodeData.value.postOffice![0].state.toString();
          print(_city);
        }
      } catch (e) {
        print(e);
      }
    }
  }

  String? getCity() => _city;

  String? getState() => _state;
}
