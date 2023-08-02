import 'package:get/get.dart';

import 'package:rewup/model/coupon_won_model.dart';
import 'package:rewup/service/coupon_utilized_service.dart';
import 'package:rewup/service/participant_service.dart';

import '../model/coupon_utilized_model.dart';
import '../model/participant_model.dart';
import '../service/coupon_won_service.dart';

class ParticipantController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <ParticipantModel>[];
  List<ParticipantModel> get listData => _listData;
  RxBool couponLoading = true.obs;

  Future getParticipantController({fromdate, todate}) async {
    couponLoading(true);
    try {
      var data = await ParticipantService().getParticipantsService(
          dashboard: "getparticipantsdetails", fromdate: fromdate, todate: todate);
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
