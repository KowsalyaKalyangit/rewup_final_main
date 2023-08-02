import '../allpackages.dart';
import '../model/report_response.dart';
import '../service/getreportservice.dart';

class ReportController extends GetxController {
  RxBool reportLoad = true.obs;
  List<Reportmodel> _reportModel = [];
  var data = [];
  List<Reportmodel> dddata = [];
  List<Reportmodel> get getReportmodel => _reportModel;
  var reportService = ReportService();
  reportController({api}) async {
    try {
      reportLoad(true);
      print('enterrrr');
      var response = await reportService.getReportService(api: 'getreports');
      if (response != null) {
        print('enterrrr111');
        _reportModel.clear();
        _reportModel.add(response);

        reportLoad(false);
      } else {
        reportLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
