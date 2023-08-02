import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:rewup/model/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../allpackages.dart';
import '../model/edit_profile_model.dart';
import '../utils/constants.dart';

class EditProfileService {
  Future<EditProfileModel?> editprofileService(
      {dashboard,
      userid,
      firstname,
      lastname,
      email,
      mobile,
      country_code,
      address,
      city,
      state,
      zip,
      country}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userid = sharedPreferences.getString(Constants.userid);
    var data = {
      'dashboard': dashboard ?? '',
      'userid': userid.toString(),
      "firstname": firstname ?? '',
      "lastname": lastname ?? '',
      "email": email ?? '',
      "mobile": mobile ?? '',
      "country_code": country_code ?? '',
      "address": address ?? '',
      "city": city ?? "",
      "state": state ?? '',
      "zip": zip ?? '',
      "country": country ?? ''
    };
    print(data);
    var encodedata = jsonEncode(data);
    print(data.toString());
    try {
      var response = await http.post(
          Uri.parse('https://rewup.fr/api/getUser.php'),
          body: encodedata);
      print(response.toString());

      var jsonresponse = jsonDecode(response.body);
      print(jsonresponse.toString());
      if (response.statusCode == 200) {
        log('successs-------------------------------');
        log(response.body);

        // Fluttertoast.showToast(msg: jsonresponse['message']);

        return EditProfileModel.fromJson(jsonDecode(response.body));
      } else {
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
