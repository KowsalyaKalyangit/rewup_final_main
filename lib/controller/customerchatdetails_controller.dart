import 'package:get/get.dart';

import 'package:rewup/service/chat_survey_customerdetails_service.dart';

import '../model/chatsurvey_customerdetails_model.dart';
import '../model/customer_chat_details_model.dart';
import '../service/customer_chat_details_service.dart';

class CustomerChatDetailsController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <CustomerChatDetailsModel>[];
  List<CustomerChatDetailsModel> get listData => _listData;
  RxBool ischatsurveyLoading = true.obs;
  Map map = {};
  Future getCustomerChatDetailsController(customerid) async {
    try {
      var data = await CustomerChatDetailsService()
          .getCustomerChatDetailsService(
              dashboard: "getcustomerchatdetails", customerid: customerid);
      if (data != null) {
        _listData.clear();
        _listData.add(data);

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
