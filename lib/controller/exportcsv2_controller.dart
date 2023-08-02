import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../model/export_pdf_model.dart';
import '../model/exportcsv_modeol.dart';
import '../model/exportdetails_csv_model.dart';
import '../service/export_details_csv2_service.dart';

class ExportDetailsCSV2Controller extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <ExportCsvModel>[];
  List<ExportCsvModel> get listData => _listData;
  RxBool isexportcsvLoading = true.obs;

  ///pdf
  var _pdf = <ExportPdfModel>[];
  List<ExportPdfModel> get pdf => _pdf;
  Map map = {};
  Future getexportdetailscsv2Controller() async {
    isexportcsvLoading(true);
    try {
      _listData.clear();
      var data = await ExportcsvService2().getExportcsvService2();
      if (data != null) {
        _listData.add(data);

        isexportcsvLoading(false);
      } else {
        isexportcsvLoading(false);
        //  Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }

  //pdf
  Future getexportdetailspdf2Controller() async {
    isexportcsvLoading(true);
    try {
      _pdf.clear();
      var data = await ExportcsvService2().getExportpdfService2();
      if (data != null) {
        _pdf.add(data);

        isexportcsvLoading(false);
      } else {
        isexportcsvLoading(false);
        //Fluttertoast.showToast(msg: 'No Data Found');
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
