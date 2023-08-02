import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:rewup/model/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../allpackages.dart';

class ProfileService {
  Future<ProfileModel?> profileService({dashboard, userid}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // var userid = sharedPreferences.getString(Constants.userid);

    var data = {'dashboard': dashboard, 'userid': userid ?? ''};
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

        Fluttertoast.showToast(msg: jsonresponse['message'].toString());

        return ProfileModel.fromJson(jsonDecode(response.body));
      } else {
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
