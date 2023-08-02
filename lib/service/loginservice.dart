import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../allpackages.dart';
import '../model/login_response.dart';

class LoginService {
  Future<Loginmodel?> loginService({email, password}) async {
    var data = {'email': email ?? '', 'password': password ?? ''};
    var encodedata = jsonEncode(data);
    print(data.toString());
    try {
      var response = await http
          .post(Uri.parse('https://rewup.fr/api/login.php'), body: encodedata);
      print(response.toString());

      var jsonresponse = jsonDecode(response.body);
      print(jsonresponse.toString());
      if (response.statusCode == 200) {
        print('kowsiiiiii');

        log('successs-------------------------------');
        log('${jsonresponse['token']}');
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        Get.back();

        return Loginmodel.fromJson(jsonDecode(response.body));
      } else {
        // Get.back();
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
