import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../model/chatsuyrvey_model.dart';
  
import '../model/customer_chat_details_model.dart';
import '../utils/constants.dart';

class CustomerChatDetailsService {
  Future<CustomerChatDetailsModel?> getCustomerChatDetailsService({dashboard, customerid}) async {
    var body = {"dashboard": dashboard ?? "", "customerid": customerid};
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
        return CustomerChatDetailsModel.fromJson(data);
      } else {
        Fluttertoast.showToast(msg: data["message"]);
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
