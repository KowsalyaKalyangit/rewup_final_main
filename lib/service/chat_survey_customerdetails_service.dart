import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/chatsurvey_customerdetails_model.dart';

import '../utils/constants.dart';

class ChatSurveyCustomerDetailsService {
  Future<ChatSurveyCustomerDetailsmodel?> getChatSurveyCustomerService(
      {chatsurveyid}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var storeid = sharedPreferences.getString(Constants.storeid);
    var body = {
      "dashboard": "getcustomerdetails",
      "storeid": storeid.toString(),
      "chatsurveyid": chatsurveyid ?? ''
    };
    var bodyencode = json.encode(body);
    log('chattttttttsuur');
    log(body.toString());
    try {
      var response = await http.post(
        Uri.parse("http://rewup.fr/api/getDetails.php"),
        body: bodyencode,
        headers: {'Authorization': 'Bearer ${Constants.token}'},
      );

      log(response.body.toString());
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return ChatSurveyCustomerDetailsmodel.fromJson(
            jsonDecode(response.body));
      } else {
        Fluttertoast.showToast(msg: data["message"]);
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
