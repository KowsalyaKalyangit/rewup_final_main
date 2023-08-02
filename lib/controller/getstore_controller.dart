import 'package:get/get.dart';

import 'package:rewup/model/store_details.dart';

import 'package:rewup/service/getstoredetails.dart';

class StoreController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <StoreDetailsModel>[];
  List<StoreDetailsModel> get listData => _listData;
  RxBool isStoreLoading = true.obs;
  Map map = {};
  Future getStoreController() async {
    isStoreLoading(true);
    try {
      _listData.clear();
      var data = await StoreService()
          .getstoreService(dashboard: "getstoredetails", );
      if (data != null) {
        _listData.add(data);

        isStoreLoading(false);
      } else {}
    } catch (e) {
      rethrow;
    }
  }
}
