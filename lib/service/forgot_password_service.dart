import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/chatsuyrvey_model.dart';

import '../model/forgot_password_model.dart';
import '../utils/constants.dart';

class ForgotPasswordService {
  Future<ForgotPasswordModel?> forgotPasswordService(
      {dashboard,email}) async {
    
    var body = {
      "dashboard": dashboard ?? "",
      "email": email ?? '',
      
    };
    var bodyencode = json.encode(body);

    log(body.toString());
    try {
      var response = await http.post(
        Uri.parse("http://rewup.fr/api/getUser.php"),
        body: bodyencode,
        headers: {'Authorization': 'Bearer ${Constants.token}'},
      );

      log(response.body.toString());
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: data['message'].toString());
        
        return ForgotPasswordModel.fromJson(data);
      } else {
        Fluttertoast.showToast(msg: data['message'].toString());
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
