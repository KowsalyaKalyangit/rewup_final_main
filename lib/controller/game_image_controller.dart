import 'package:get/get.dart';

import '../model/gameimage_model.dart';
import '../service/gameimage_service.dart';

class GameImageController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <GameImageModel>[];
  List<GameImageModel> get listData => _listData;
  RxBool isgameimageLoading = true.obs;
  Map map = {};
  var index = 0;
  List<String> imageUrls = [];
  Future getGameController(gamesurveyid) async {
    isgameimageLoading(true);
    try {
      _listData.clear();
      var data = await GameImageService().getGameService(
          dashboard: "getgameimgdetails", gamesurveyid: gamesurveyid);
      if (data != null) {
        _listData.add(data);

        for (var item in _listData) {
          imageUrls.add(item.data[0].welcomeimage);
          imageUrls.add(item.data[0].couponwonimage);
          imageUrls.add(item.data[0].finalimage);
          imageUrls.add(item.data[0].gameimage);
          imageUrls.add(item.data[0].couponimage);
        }

        update();
        print('++++++++++++++++');
        print(imageUrls.length);
        isgameimageLoading(false);
      } else {}
    } catch (e) {
      rethrow;
    }
  }
}
