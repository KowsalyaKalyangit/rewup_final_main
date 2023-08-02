import 'package:get/get.dart';

import 'package:rewup/service/chat_survey_customerdetails_service.dart';

import '../model/chatsurvey_customerdetails_model.dart';

class ChatSurveyCustomerDetailsController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <ChatSurveyCustomerDetailsmodel>[];
  List<ChatSurveyCustomerDetailsmodel> get listData => _listData;
  RxBool ischatsurveyLoading = true.obs;
  Map map = {};
  Future getChatSurveyCustomerDetailsController(chatsurveyid) async {
    ischatsurveyLoading(true);
    try {
      var data = await ChatSurveyCustomerDetailsService()
          .getChatSurveyCustomerService(chatsurveyid: chatsurveyid);
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
