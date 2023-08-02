import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:rewup/model/send_game_request_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/date/dashboard_count_model.dart';
import '../../utils/constants.dart';

class SendGameRequestService {
  Future<SendGameRequestModel?> sendGameRequestService(
      {dashboard, gameid}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var storeid = sharedPreferences.getString(Constants.storeid);
    var userid = sharedPreferences.getString(Constants.userid);
    var body = {
      "dashboard": dashboard ?? "",
      "storeid": storeid ?? '',
      "gameid": gameid ?? '',
      "userid": userid ?? ''
    };
    var bodyencode = json.encode(body);

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
        return SendGameRequestModel.fromJson(jsonDecode(response.body));
      } else {
        Fluttertoast.showToast(msg: data["message"]);
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
