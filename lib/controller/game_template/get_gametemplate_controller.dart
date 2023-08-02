import 'package:get/get.dart';

import 'package:rewup/service/email_templates/getemail_template_service.dart';
import 'package:rewup/service/game_templates/getgame_template_service.dart';

import '../../model/game_template/get_gametemplate_model.dart';
import '../../model/get_emailtemplate/getemail_template_model.dart';

class GetGameTemplateController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <GetGameTemplateModel>[];
  List<GetGameTemplateModel> get listData => _listData;
  RxBool couponLoading = true.obs;

  Future getGameTemplateController() async {
    couponLoading(true);
    try {
      var data = await GetGameTemplatesService().getGameTemplatesService(
        dashboard: "getgamerequestdetails",
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
