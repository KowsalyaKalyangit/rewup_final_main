import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/change_password_service.dart';

import 'login_controller.dart';

class ChangePaswordController extends GetxController {
  TextEditingController password = TextEditingController();
  TextEditingController password_confirmation = TextEditingController();
  RxBool createpasswordLoad = true.obs;
  var changePassword = ChangePasswordService();
  Future changePasswordController({context}) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();

    try {
      createpasswordLoad(true);
      var response = await changePassword.getChangePasswordService(
          newpassword: password.text,
          confirmpassword: password_confirmation.text,
          dashboard: "changepassword");
      log('responseeeee------------');
      log(response.toString());

      if (response != null) {
        print('responseeee');
        createpasswordLoad(false);

        Get.back();
      } else {
        createpasswordLoad(false);

        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
