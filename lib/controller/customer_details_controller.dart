import 'package:get/get.dart';

import 'package:rewup/model/customer_details_model.dart';

import 'package:rewup/service/customerdetails_service.dart';

class CustomerDetailsController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <CustomerDetailsModel>[];
  List<CustomerDetailsModel> get listData => _listData;
  RxBool isCustomerloading = true.obs;
  Map map = {};
  Future getCustomerDetailsController({fromdate, todate}) async {
    isCustomerloading(true);
    try {
      var data = await CustomerDetailsService()
          .getCustomerDetailsService(fromdate: fromdate, todate: todate);
      if (data != null) {
        _listData.clear();
        _listData.add(data);

        isCustomerloading(false);
      } else {
        isCustomerloading(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
