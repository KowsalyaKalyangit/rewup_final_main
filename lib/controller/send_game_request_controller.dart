import 'package:get/get.dart';
import 'package:rewup/model/send_game_request_model.dart';
import 'package:rewup/service/sendgamerequest_service.dart';

import '../model/consent_model.dart';

class SendGameRequestController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <SendGameRequestModel>[];
  List<SendGameRequestModel> get listData => _listData;
  RxBool couponLoading = true.obs;

  Future getsendgamerequest({gameid}) async {
    couponLoading(true);
    try {
      var data = await SendGameRequestService()
          .sendGameRequestService(dashboard: "sendgamerequest", gameid: gameid);
      if (data != null) {
        _listData.clear();
        _listData.add(data);

        couponLoading(false);
      } else {
        couponLoading(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
