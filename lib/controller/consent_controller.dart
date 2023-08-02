import 'package:get/get.dart';

import 'package:rewup/model/coupon_won_model.dart';
import 'package:rewup/service/consent_service.dart';
import 'package:rewup/service/coupon_utilized_service.dart';
import 'package:rewup/service/participant_service.dart';

import '../model/consent_model.dart';
import '../model/coupon_utilized_model.dart';
import '../model/participant_model.dart';
import '../service/coupon_won_service.dart';

class ConsentController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <ConsentModel>[];
  List<ConsentModel> get listData => _listData;
  RxBool couponLoading = true.obs;

    getConsentController(fromdate, todate) async {
    couponLoading(true);
    try {
      var data = await ConsentService().getConsentService(
          dashboard: "getconsentdetails", fromdate: fromdate, todate: todate);
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

  Future getConsentControllermain() async {
    couponLoading(true);
    try {
      var data = await ConsentService().getConsentService(
          dashboard: "getconsentdetails",);
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
