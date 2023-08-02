import 'package:get/get.dart';

import '../model/details-response.dart';
import '../service/getdetails.dart';

class DetailsController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <DetailsModel>[];
  List<DetailsModel> get listData => _listData;
  RxBool isLoading = true.obs;
  Map map = {};
  Future getDetailController() async {
    isLoading(true);
    try {
      _listData.clear();
      var data =
          await DetailsService().getData(dashboard: "getdetails", storeid: '1');
      if (data != null) {
        _listData.add(data);

        isLoading(false);
      } else {
        isLoading(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
