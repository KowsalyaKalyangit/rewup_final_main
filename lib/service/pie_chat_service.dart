import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:rewup/model/piechart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';

class PieChartService {
  Future<PieChartModel?> getPieChartService({fromdate, todate}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var storeid = sharedPreferences.getString(Constants.storeid);
    var body = {
      "dashboard": "couponpiechart",
      "storeid": storeid.toString(),
      "fromdate": fromdate ?? '',
      "todate": todate ?? ''
    };
    log('pieeee');
    log(storeid.toString());
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

      if (response.statusCode == 200) {
        return PieChartModel.fromJson(jsonDecode(response.body));
      } else {
        Fluttertoast.showToast(msg: data["message"]);
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
