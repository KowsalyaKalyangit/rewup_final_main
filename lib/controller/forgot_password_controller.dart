import 'dart:developer';

import '../allpackages.dart';
import '../service/forgot_password_service.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController email = TextEditingController();
  var forgotpasswordService = ForgotPasswordService();

  Future forgotPasswordController() async {
    try {
      var response = await forgotpasswordService.forgotPasswordService(
          email: email.text, dashboard: "forgotpassword");
      log('mobile---${response}');
      if (response != null) {
        //Fluttertoast.showToast(msg: response.message.toString());
        // Get.to(ForgotOtpField());
        // Get.toNamed('/forgototp');
        Get.to(LoginScreen());
      } else {
        //Fluttertoast.showToast(msg: response.message.toString());
      }
    } catch (e) {
      rethrow;
    }
  }
}
