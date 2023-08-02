import 'package:get/get.dart';
import 'package:rewup/model/chatsuyrvey_model.dart';

import 'package:rewup/service/chatsurey_service.dart';

class ChatSurveyController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <ChatSuurveymodel>[];
  List<ChatSuurveymodel> get listData => _listData;
  RxBool ischatsurveyLoading = true.obs;
  Map map = {};
  Future getChatSurveyController(storeid) async {
    ischatsurveyLoading(true);
    try {
      _listData.clear();
      var data = await ChatSurveyService().getChatSurveyService(
          dashboard: "getchatsurveydetails", storeid: storeid);
      if (data != null) {
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
