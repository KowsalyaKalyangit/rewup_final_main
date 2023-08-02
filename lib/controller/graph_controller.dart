import 'dart:math';

import 'package:get/get.dart';

import 'package:rewup/model/graph_model.dart';

import '../service/bar_graph_service.dart';

class GraphController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;

  var _listData = <GraphModel>[];
  var item = [];
  List<GraphModel> get listData => _listData;
  RxBool isgraphLoading = true.obs;
  Map map = {};
  Future getGraphController(fromdate, todate) async {
    isgraphLoading(true);
    try {
      _listData.clear();
      var data = await BarGraphService().getBarGraphService(
          dashboard: "customerdata", fromdate: fromdate, todate: todate);
      if (data != null) {
        _listData.add(data);
        print(data);

        isgraphLoading(false);
      } else {
        isgraphLoading(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
 Future getGraphControllermain() async {
    isgraphLoading(true);
    try {
      _listData.clear();
      var data = await BarGraphService().getBarGraphService(
          dashboard: "customerdata",);
      if (data != null) {
        _listData.add(data);
        print(data);

        isgraphLoading(false);
      } else {
        isgraphLoading(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }


}
