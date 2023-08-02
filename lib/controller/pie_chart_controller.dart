import 'package:get/get.dart';

import 'package:rewup/model/piechart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/pie_chat_service.dart';
import '../utils/constants.dart';

class PieChartcontroller extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;

  var _listData = <PieChartModel>[];
  var item = [];
  List<PieChartModel> get listData => _listData;
  RxBool ispieLoad = true.obs;
  Map map = {};
  Future piechartController({fromdate, todate}) async {
    ispieLoad(true);
    try {
      var data = await PieChartService()
          .getPieChartService(fromdate: fromdate, todate: todate);

      if (data != null) {
        _listData.clear();
        _listData.add(data);

        ispieLoad(false);
      } else {
        ispieLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future piechartControllermain() async {
    ispieLoad(true);
    try {
      var data = await PieChartService().getPieChartService();

      if (data != null) {
        _listData.clear();
        _listData.add(data);

        ispieLoad(false);
      } else {
        ispieLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
