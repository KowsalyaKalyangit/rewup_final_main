import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../model/date/dashboard_count_model.dart';
import '../../utils/constants.dart';

 

 

class DashboardCountService {
  Future<DashboardDateModel?> dashboardCountService(
      {dashboard, storeid,fromdate,todate}) async {
    var body = {
      "dashboard": dashboard ?? "",
      "storeid": storeid??'',
      "fromdate":fromdate??'',
      "todate":todate??''
     
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
        return DashboardDateModel.fromJson(
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
