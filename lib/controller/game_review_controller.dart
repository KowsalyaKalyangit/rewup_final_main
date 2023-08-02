import 'package:get/get.dart';
import 'package:rewup/service/game_review_service.dart';

import '../model/game_review_model.dart';
import '../model/gameimage_model.dart';
import '../service/gameimage_service.dart';

class GameReviewController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <GameReviewModel>[];
  List<GameReviewModel> get listData => _listData;
  RxBool isgamereviewLoading = true.obs;
  Map map = {};
  var index = 0;
  List<String> imageUrls = [];
  Future gamereviewController(gamesurveyid) async {
    isgamereviewLoading(true);
    try {
      _listData.clear();
      var data = await GameReviewService().gamereviewService (
          dashboard: "getgamereviewdetails", gamesurveyid: gamesurveyid);
      if (data != null) {
        _listData.add(data);
 

        update();
        print('++++++++++++++++');
        print(imageUrls);
        isgamereviewLoading(false);
      } else {}
    } catch (e) {
      rethrow;
    }
  }
}
