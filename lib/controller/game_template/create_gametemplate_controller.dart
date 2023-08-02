import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rewup/allpackages.dart';
import 'package:rewup/service/email_templates/create_emailtemplates_service.dart';

import 'package:rewup/service/email_templates/getemail_template_service.dart';
import 'package:rewup/service/email_templates/update_email_template_service.dart';
import 'package:rewup/service/game_templates/update_game_template_service.dart';

import '../../model/game_template/create_game_template_model.dart';
import '../../model/game_template/update_game_template_model.dart';
import '../../model/get_emailtemplate/create_email_template_model.dart';
import '../../model/get_emailtemplate/getemail_template_model.dart';
import '../../model/get_emailtemplate/update_email_template_model.dart';
import '../../service/game_templates/create_gametemplates_service.dart';
import '../login_controller.dart';

class CreateGameTemplateController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <CreateGameTemplateModel>[];
  List<CreateGameTemplateModel> get listData => _listData;
  RxBool couponLoading = true.obs;
  TextEditingController name = TextEditingController();
  TextEditingController content = TextEditingController();
  //update

  var _updateData = <UpdateGameTemplateModel>[];
  List<UpdateGameTemplateModel> get updatedata => _updateData;
  RxBool updateload = true.obs;
  Future createGameTemplateController({
    context,
  }) async {
    couponLoading(true);

    couponLoading(true);
    if (couponLoading.value) {
      _loadingBar(context);
    }
    try {
      var data = await CreateGameTemplatesService().createGameTemplatesService(
          dashboard: "addgamerequest",
          name: name.text,
          description: content.text);
      if (data != null) {
        _listData.clear();
        _listData.add(data);

        couponLoading(false);
        Get.back();
      } else {
        couponLoading(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }

  void _loadingBar(BuildContext ctx) {
    showDialog(
        barrierDismissible: false,
        context: ctx,
        builder: (BuildContext context) {
          return const Center(
            child: Loader(),
          );
        });
  }
  ////
  /// update

  Future updateGameTemplateController({context, storereqid}) async {
    updateload(true);

    updateload(true);
    if (updateload.value) {
      _loadingBar(context);
    }
    try {
      var data = await UpdateGameTemplatesService().updateGameTemplatesService(
        dashboard: "updategamerequest",
        storereqid: storereqid,
        name: name.text,
        description: content.text,
      );
      if (data != null) {
        _updateData.clear();
        _updateData.add(data);

        updateload(false);
        Get.back();
      } else {
        updateload(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}

void _loadingBar(BuildContext ctx) {
  showDialog(
      barrierDismissible: false,
      context: ctx,
      builder: (BuildContext context) {
        return const Center(
          child: Loader(),
        );
      });
}
