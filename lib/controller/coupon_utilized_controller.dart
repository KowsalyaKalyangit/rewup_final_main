import 'package:get/get.dart';

import 'package:rewup/model/coupon_won_model.dart';
import 'package:rewup/service/coupon_utilized_service.dart';

import '../model/coupon_utilized_model.dart';
import '../service/coupon_won_service.dart';

class CouponUtilizedController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <CouponUtilizedModel>[];
  List<CouponUtilizedModel> get listData => _listData;
  RxBool couponLoading = true.obs;

    getCouponutilizedController({fromdate, todate}) async {
    couponLoading(true);
    try {
      var data = await CouponUtilizedService().getCouponutilizedService(
          dashboard: "getutilizeddetails", fromdate: fromdate, todate: todate);
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

  Future getCouponutilizedControllermain() async {
    couponLoading(true);
    try {
      var data = await CouponUtilizedService().getCouponutilizedService(
          dashboard: "getutilizeddetails",);
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
