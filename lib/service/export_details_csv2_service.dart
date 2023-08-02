import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:rewup/model/exportdetails_csv_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/export_pdf_model.dart';
import '../model/exportcsv_modeol.dart';

import '../utils/constants.dart';

class ExportcsvService2 {
  Future<ExportCsvModel?> getExportcsvService2() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var storeid = sharedPreferences.getString(Constants.storeid);
    var body = {"storeid": storeid ?? ''};
    var bodyencode = json.encode(body);

    log(body.toString());
    try {
      var response = await http.post(
        Uri.parse(
            "https://rewup.fr/export/exportexcel.php?From=coupondata&For=api"),
        body: bodyencode,
        headers: {'Authorization': 'Bearer ${Constants.token}'},
      );

      log(response.body.toString());
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: data["message"]);
        return ExportCsvModel.fromJson(jsonDecode(response.body));
      } else {
        Fluttertoast.showToast(msg: data["message"]);
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ExportPdfModel?> getExportpdfService2() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var storeid = sharedPreferences.getString(Constants.storeid);
    var body = {"storeid": storeid ?? ''};
    var bodyencode = json.encode(body);

    log(body.toString());
    try {
      var response = await http.post(
        Uri.parse(
            "https://rewup.fr/export/exportpdf.php?From=coupondata&For=api"),
        body: bodyencode,
        headers: {'Authorization': 'Bearer ${Constants.token}'},
      );

      log(response.body.toString());
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        //Fluttertoast.showToast(msg: data["message"]);
        return ExportPdfModel.fromJson(jsonDecode(response.body));
      } else {
        Fluttertoast.showToast(msg: data["message"]);
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
