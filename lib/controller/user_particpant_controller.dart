import 'package:get/get.dart';
 
import 'package:rewup/service/coupon_utilized_service.dart';
import 'package:rewup/service/getuser_particpant_service.dart';

import '../model/coupon_utilized_model.dart';
import '../model/userparticpant_model.dart';
 

class UserParticpantController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <UserParticipantModel>[];
  List<UserParticipantModel> get listData => _listData;
  RxBool couponLoading = true.obs;

  Future getUserParticpantController() async {
    couponLoading(true);
    try {
      var data = await UserparticipantService().getUserparticipantService(
        dashboard: "getuserparticipants",
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
