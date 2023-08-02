import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/chatsuyrvey_model.dart';

import '../utils/constants.dart';

class ChangePasswordService {
  Future<ChatSuurveymodel?> getChangePasswordService(
      {dashboard, newpassword, confirmpassword}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userid = sharedPreferences.getString(Constants.userid);
    var body = {
      "dashboard": dashboard ?? "",
      "userid": userid ?? '',
      "newpassword": newpassword ?? '',
      "confirmpassword": confirmpassword ?? ''
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
        if (data['success'] == 1) {
          Fluttertoast.showToast(msg: 'Mot de passe mis à jour avec succès');
        } else {
          Fluttertoast.showToast(msg: data['message'].toString());
        }
        return ChatSuurveymodel.fromJson(data);
      } else {
        // Fluttertoast.showToast(msg: data['message'].toString());
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
