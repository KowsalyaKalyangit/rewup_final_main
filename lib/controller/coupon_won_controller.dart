import 'package:get/get.dart';

import 'package:rewup/model/coupon_won_model.dart';

import '../service/coupon_won_service.dart';

class CouponWonController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <CouponWonModel>[];
  List<CouponWonModel> get listData => _listData;
  RxBool couponLoading = true.obs;

  getCouponwonController({fromdate, todate}) async {
    couponLoading(true);
    try {
      var data = await CouponWonService().getCouponService(
          dashboard: "couponwon", fromdate: fromdate, todate: todate);
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

  Future getCouponwonControllermain() async {
    couponLoading(true);
    try {
      var data = await CouponWonService().getCouponService(
        dashboard: "couponwon",
      );
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
