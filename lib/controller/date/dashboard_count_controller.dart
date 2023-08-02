import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rewup/model/chatsuyrvey_model.dart';

import 'package:rewup/service/chatsurey_service.dart';
import 'package:rewup/service/dashboard_details_service.dart';
import 'package:rewup/service/date/dashboard_counts_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/date/dashboard_count_model.dart';
import '../../utils/constants.dart';
import '../login_controller.dart';

class DashboardCountcontroller extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  TextEditingController fromdate = TextEditingController();
  TextEditingController todate = TextEditingController();
  var _listData = <DashboardDateModel>[];
  List<DashboardDateModel> get listData => _listData;
  RxBool ischatsurveyLoading = true.obs;
  Map map = {};
  Future dahboardCountcontroller(storeid, context) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    if (fromdate.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter email');
    } else if (todate.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter password');
    } else {
      ischatsurveyLoading(true);
      if (ischatsurveyLoading.value) {
        _loadingBar(context);
      }
      ischatsurveyLoading(true);
      try {
        _listData.clear();
        var data = await DashboardCountService().dashboardCountService(
            dashboard: "getdashboarddetails",
            storeid: storeid,
            fromdate: fromdate.text,
            todate: todate.text);
        if (data != null) {
          _listData.add(data);

          _sharedPreferences.setString(
              Constants.fromdate, data.fromdate.toString());
          _sharedPreferences.setString(
              Constants.todate, data.fromdate.toString());
          ischatsurveyLoading(false);
        } else {
          ischatsurveyLoading(false);
          Get.back();
        }
      } catch (e) {
        rethrow;
      }
    }
  }

  void _loadingBar(BuildContext ctx) {
    showDialog(
        barrierDismissible: false,
        context: ctx,
        builder: (BuildContext context) {
          return const Center(
            child: Loader(),
          );
        });
  }
}
