import 'package:get/get.dart';

 
import 'package:rewup/service/email_templates/getemail_template_service.dart';

import '../../model/get_emailtemplate/getemail_template_model.dart';
 

class GetEmailTemplateController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <GetemailTemplateModel>[];
  List<GetemailTemplateModel> get listData => _listData;
  RxBool couponLoading = true.obs;

  Future getEmailTemplateController() async {
    couponLoading(true);
    try {
      var data = await GetEmailTemplatesService().getEmailTemplatesService(
        dashboard: "getemailtemplatedetails",
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
