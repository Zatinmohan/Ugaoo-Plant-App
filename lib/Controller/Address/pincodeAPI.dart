import 'dart:convert';

import 'package:get/get.dart';
import 'package:ugaoo/Model/pincodeParser.dart';
import 'package:http/http.dart' as https;

//Used an API to fetch data on the basis of Pincodes in India.

class PincodeAPI extends GetxController {
  var pincodeData = PincodeModel().obs;
  late String _city, _state;
  RxBool loading = false.obs;

  Future<bool> fetchData(var pincode) async {
    var baseUrl = "http://www.postalpincode.in/api/pincode/";
    var url = Uri.parse(baseUrl + pincode);
    var response = await https.get(url);

    if (response.statusCode == 200) {
      try {
        loading.value = true;
        var jsonResponse = jsonDecode(response.body);
        pincodeData.value = PincodeModel.fromJson(jsonResponse);

        if (pincodeData.value.postOffice!.isNotEmpty) {
          _city = pincodeData.value.postOffice![0].taluk.toString();
          _state = pincodeData.value.postOffice![0].state.toString();
        }
        return loading.value;
      } catch (e) {
        Get.snackbar("Invalid Pincode!", "Please enter a valid pincode",
            snackPosition: SnackPosition.BOTTOM);
        return false;
      }
    }

    return false;
  }

  String get getCity => _city;

  String get getState => _state;
}
