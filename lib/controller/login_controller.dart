import 'package:fluttertoast/fluttertoast.dart';
import 'package:rewup/controller/dashboard_controller.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../allpackages.dart';
import '../model/login_response.dart';
import '../service/loginservice.dart';
import '../utils/constants.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  List<Loginmodel> _loginmodel = [];
  List<Loginmodel> get getloginmodel => _loginmodel;
  RxBool isloginLoad = true.obs;
  //otp
  Dashboardcontroller dashboardcontroller = Get.put(Dashboardcontroller());
  var loginService = LoginService();
  Future loginController({context}) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();

    if (email.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Veuillez entrer votre adresse e-mail');
    } else if (password.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Veuillez entrer votre mot de passe');
    } else {
      isloginLoad(true);
      if (isloginLoad.value) {
        _loadingBar(context);
      }

      try {
        var response = await loginService.loginService(
            email: email.text, password: password.text);
        print(response);

        if (response != null) {
          print(response);
          _sharedPreferences.setString(Constants.token, response.token);
          _sharedPreferences.setString(
              Constants.storeid, response.storeid.toString());
          // var storeid = _sharedPreferences.getString(Constants.storeid);
          _sharedPreferences.setString(
              Constants.userid, response.userid.toString());
          _sharedPreferences.setString(
              Constants.username, response.username.toString());

          Get.to(HomeScreen());
          isloginLoad(false);
        } else {
          Fluttertoast.showToast(msg: response!.message);

          Get.back();
        }
      } catch (e) {
        rethrow;
      }
    }
  }

  // logout
  Future logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      sharedPreferences.clear().then((value) {
        email.clear();
        password.clear();
        dashboardcontroller.fromdate.text = '';
        dashboardcontroller.todate.text = '';
        // Get.back();
        Get.to(LoginScreen());
      });
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

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          // decoration: BoxDecoration(color: Colors.amber),
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Center(child: const CircularProgressIndicator())),
    );
  }
}
