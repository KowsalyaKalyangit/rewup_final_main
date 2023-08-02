import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/userparticpant_model.dart';
import '../utils/constants.dart';

class UserparticipantService {
  Future<UserParticipantModel?> getUserparticipantService({dashboard}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var storeid = sharedPreferences.getString(Constants.storeid);
    var username = sharedPreferences.getString(Constants.userid);
    print('Enterrrrrr');
    var body = {
      "dashboard": dashboard ?? "",
      "storeid": storeid ?? '',
      "userid": username ?? ''
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
        return UserParticipantModel.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
