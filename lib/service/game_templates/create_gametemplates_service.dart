import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/game_template/create_game_template_model.dart';
import '../../model/get_emailtemplate/create_email_template_model.dart';
import '../../model/get_emailtemplate/getemail_template_model.dart';
import '../../utils/constants.dart';

class CreateGameTemplatesService {
  Future<CreateGameTemplateModel?> createGameTemplatesService({dashboard,name,description}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var storeid = sharedPreferences.getString(Constants.storeid);
    print('Enterrrrrr');
    var body = {
      "dashboard": dashboard ?? "",
      "storeid": storeid??'',
      "name":name??'',
      "description":description??''

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
        return CreateGameTemplateModel.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
