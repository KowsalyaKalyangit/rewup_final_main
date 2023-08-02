import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../allpackages.dart';
import '../model/graph_model.dart';
import '../utils/constants.dart';

class BarGraphService {
  Future<GraphModel?> getBarGraphService({dashboard, fromdate, todate}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var storeid = sharedPreferences.getString(Constants.storeid);

    var body = {
      "dashboard": dashboard ?? "",
      "storeid": storeid ?? '',
      "fromdate": fromdate ?? '',
      "todate": todate ?? ''
    };
    var bodyencode = json.encode(body);

    log(body.toString());
    try {
      var response = await http.post(
        Uri.parse("http://rewup.fr/api/getReport.php"),
        body: bodyencode,
        headers: {'Authorization': 'Bearer ${Constants.token}'},
      );

      log(response.body.toString());
      var data = jsonDecode(response.body);
      print('graph ${data.toString()}');

      if (response.statusCode == 200) {
        return GraphModel.fromJson(jsonDecode(response.body));
      } else {
        Fluttertoast.showToast(msg: data["message"]);
        Get.back();
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
