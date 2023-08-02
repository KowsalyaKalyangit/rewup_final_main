import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

import '../allpackages.dart';

import '../model/report_response.dart';
import '../utils/constants.dart';

class ReportService {
  Future<Reportmodel?> getReportService({api}) async {
    var data = {'api': 'getreports'};
    var encodedata = jsonEncode(data);
    print(data.toString());
    try {
      var response = await http.post(
        Uri.parse('https://rewup.fr/api/getReport.php'),
        headers: {'Authorization': 'Bearer ${Constants.token}'},
        body: encodedata,
      );
      print(response);

      var jsonresponse = jsonDecode(response.body);
      print(jsonresponse.toString());
      if (response.statusCode == 200) {
        return Reportmodel.fromJson(jsonresponse);
      } else {
        Get.back();
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
      }
    } catch (e) {
      rethrow;
    }
  }
}
