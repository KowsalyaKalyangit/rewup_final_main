import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/export_pdf_date_model.dart';
import '../model/exportcsv_modeol.dart';
import '../model/exportdetails_csv_model.dart';
import '../utils/constants.dart';

class ExportcsvService {
  Future<ExportCsvModel?> getExportcsvService(
      {fromdate, todate, storeid}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var storeid = sharedPreferences.getString(Constants.storeid);
    var body = {
      "fromdate": fromdate ?? '',
      "todate": todate ?? '',
      "storeid": storeid ?? ''
    };
    var bodyencode = json.encode(body);

    log(body.toString());
    try {
      var response = await http.post(
        Uri.parse(
            "https://rewup.fr/export/exportexcel.php?From=couponwon&For=api"),
        body: bodyencode,
        headers: {'Authorization': 'Bearer ${Constants.token}'},
      );

      log(response.body.toString());
      var data = jsonDecode(response.body);

      if (data["success"] == 1) {
        if (response.statusCode == 200) {
          return ExportCsvModel.fromJson(data);
        } else {
          //Fluttertoast.showToast(msg: data["message"].toString());
          return null;
        }
      }
    } catch (e) {
      rethrow;
    }
  }

    Future<ExportPdfDate?> getExportpdfService(
      {fromdate, todate, storeid}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var storeid = sharedPreferences.getString(Constants.storeid);
    var body = {
      "fromdate": fromdate ?? '',
      "todate": todate ?? '',
      "storeid": storeid ?? ''
    };
    var bodyencode = json.encode(body);

    log(body.toString());
    try {
      var response = await http.post(
        Uri.parse(
            "https://rewup.fr/export/exportpdf.php?From=couponwon&For=api"),
        body: bodyencode,
        headers: {'Authorization': 'Bearer ${Constants.token}'},
      );

      log(response.body.toString());
      var data = jsonDecode(response.body);

      if (data["success"] == 1) {
        if (response.statusCode == 200) {
          return ExportPdfDate.fromJson(data);
        } else {
          //Fluttertoast.showToast(msg: data["message"].toString());
          return null;
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
