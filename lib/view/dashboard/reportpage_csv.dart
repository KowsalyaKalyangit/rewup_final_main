import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rewup/allpackages.dart';
import 'package:rewup/controller/exportcsv2_controller.dart';
import 'package:rewup/controller/exportdetails-csv_controller.dart';

import '../../utils/colors.dart';
import '../../utils/textstyles.dart';
import 'package:intl/intl.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

import '../homepage.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  TextEditingController fromdate = TextEditingController();
  TextEditingController todate = TextEditingController();
  double? _progress;
  double? _progress1;
  double? pdfprogress1;
  double? pdfprogress2;
  var selectedindex = false;
  var selectedindex1 = false;
  @override
  void initState() {
    fromdate.text = ""; //set the initial value of text field
    todate.text = "";
    // exportDetailsCSV2Controller.getexportdetailscsv2Controller();
    // exportDetailsCSVController.getexportdetailsController();
    super.initState();
  }

  ExportDetailsCSVController exportDetailsCSVController =
      Get.put(ExportDetailsCSVController());
  ExportDetailsCSV2Controller exportDetailsCSV2Controller =
      Get.put(ExportDetailsCSV2Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: appbarcolor,
          //  / automaticallyImplyLeading: false,
          //centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
                onTap: () {
                  Get.offAll(HomeScreen());
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: screenbackground,
                )),
          ),
          title: Text(
            "Export rapport",
            style: heading,
          )),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.0.h,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedindex = !selectedindex;
                  selectedindex1 = false;
                });
              },
              child: Container(
                height: 40.0.h,
                width: 400.w,
                child: Card(
                  color: selectedindex == true
                      ? Color(0xff455A64)
                      : screenbackground,
                  child: Center(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5.0.w,
                        ),
                        Container(
                          width: 280.w,
                          child: Text(
                            "Rapport sur les coupons",
                            style: selectedindex == true
                                ? headingcolor
                                : listStyleappcolor,
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          color: selectedindex == true
                              ? screenbackground
                              : appbarcolor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            selectedindex == true
                ? Padding(
                    padding: const EdgeInsets.only(left: 4.0, right: 4),
                    child: Container(
                      height: 170.0.h,
                      width: 500.w,
                      decoration: BoxDecoration(
                          color: screenbackground,
                          border: Border.all(color: Color(0xFFC9CCCE)),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        // /mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Période du*',
                                style: profiletext,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                color: Color(0xffD9D9D9).withOpacity(0.1),
                                height: 40.00.h, width: 150.00.w,
                                // padding: const EdgeInsets.only(
                                //   left: 20,
                                //   right: 20,
                                // ),
                                child: TextFormField(
                                  controller: fromdate,
                                  readOnly:
                                      true, //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        locale: const Locale("fr", "FR"),
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(
                                            2000), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101));

                                    if (pickedDate != null) {
                                      print(
                                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      print(
                                          formattedDate); //formatted date output using intl package =>  2021-03-16
                                      //you can implement different kind of Date Format here according to your requirement

                                      setState(() {
                                        fromdate.text =
                                            formattedDate; //set output date to TextField value.
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },

                                  style: tablestyle,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: const BorderSide(
                                            color: appcolor, width: 1),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            width: 1),
                                      ),
                                      fillColor: const Color(0xffC6C6C6),
                                      hintText: 'Sélectionner Periode Du',
                                      prefixIcon: Icon(
                                        Icons.calendar_month,
                                        color: appbarcolor,
                                        size: 20,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.only(left: 20),
                                      hintStyle: GoogleFonts.jost(
                                          textStyle: TextStyle(
                                              fontSize: 10.00.sp,
                                              color: formhintcolor,
                                              fontWeight: FontWeight.w500)),
                                      border: const OutlineInputBorder(
                                        gapPadding: 4,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Période au*',
                                style: profiletext,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                color: Color(0xffD9D9D9).withOpacity(0.1),
                                height: 40.00.h, width: 150.00.w,
                                // padding: const EdgeInsets.only(
                                //   left: 20,
                                //   right: 20,
                                // ),
                                child: TextFormField(
                                  //controller: profileController.firstname,
                                  controller: todate,
                                  readOnly:
                                      true, //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        locale: const Locale("fr", "FR"),
                                        firstDate: DateTime(
                                            2000), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101));

                                    if (pickedDate != null) {
                                      print(
                                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      print(
                                          formattedDate); //formatted date output using intl package =>  2021-03-16
                                      //you can implement different kind of Date Format here according to your requirement

                                      setState(() {
                                        todate.text =
                                            formattedDate; //set output date to TextField value.
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },

                                  style: tablestyle,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: const BorderSide(
                                            color: appcolor, width: 1),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            width: 1),
                                      ),
                                      fillColor: const Color(0xffC6C6C6),
                                      hintText: 'Sélectionner Periode Au',
                                      prefixIcon: Icon(
                                        Icons.calendar_month,
                                        color: appbarcolor,
                                        size: 20,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.only(left: 20),
                                      hintStyle: GoogleFonts.jost(
                                          textStyle: TextStyle(
                                              fontSize: 10.00.sp,
                                              color: formhintcolor,
                                              fontWeight: FontWeight.w500)),
                                      border: const OutlineInputBorder(
                                        gapPadding: 4,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Télécharger:',
                                style: toptitleStyle,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () async {
                                    setState(() {
                                      if (fromdate.text.isEmpty) {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Entrez s'il vous plait Periode Du");
                                      } else if (todate.text.isEmpty) {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Entrez s'il vous plait Periode Au");
                                      } else {
                                        exportDetailsCSVController
                                            .getexportdetailsController(
                                                fromdate: fromdate.text,
                                                todate: todate.text)
                                            .then((value) => setState(() {
                                                  FileDownloader.downloadFile(
                                                      url:
                                                          exportDetailsCSVController
                                                              .listData[0]
                                                              .data[0]
                                                              .filename
                                                              .trim(),
                                                      onProgress:
                                                          (name, progress) {
                                                        setState(() {
                                                          _progress = progress;
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  'processing');
                                                        });
                                                      },
                                                      onDownloadCompleted:
                                                          (value) {
                                                        print('path  $value ');
                                                        const snackdemo =
                                                            SnackBar(
                                                          content: Center(
                                                            child: Text(
                                                                'téléchargement de fichier'),
                                                          ),
                                                          backgroundColor:
                                                              appbarcolor,
                                                          elevation: 10,
                                                          behavior:
                                                              SnackBarBehavior
                                                                  .floating,
                                                          margin:
                                                              EdgeInsets.all(5),
                                                        );
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                snackdemo);

                                                        setState(() {
                                                          _progress = null;
                                                        });
                                                      });
                                                }));
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 30.0.h,
                                    width: 70.0.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'CSV',
                                          style: buttontext,
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      color: appbarcolor,
                                      //  border: Border.all(color: Colors.green),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                              ////
                              Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () async {
                                    setState(() {
                                      if (fromdate.text.isEmpty) {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Entrez s'il vous plait Periode Du");
                                      } else if (todate.text.isEmpty) {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Entrez s'il vous plait Periode Au");
                                      } else {
                                        exportDetailsCSVController
                                            .getexportpdfController(
                                                fromdate: fromdate.text,
                                                todate: todate.text)
                                            .then((value) => setState(() {
                                                  FileDownloader.downloadFile(
                                                      url:
                                                          exportDetailsCSVController
                                                              .pdfdata[0]
                                                              .data[0]
                                                              .filename
                                                              .trim(),
                                                      onProgress:
                                                          (name, progress) {
                                                        setState(() {
                                                          pdfprogress1 =
                                                              progress;
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  'processing');
                                                        });
                                                      },
                                                      onDownloadCompleted:
                                                          (value) {
                                                        print('path  $value ');
                                                        const snackdemo =
                                                            SnackBar(
                                                          content: Center(
                                                            child: Text(
                                                                'téléchargement de fichier'),
                                                          ),
                                                          backgroundColor:
                                                              appbarcolor,
                                                          elevation: 10,
                                                          behavior:
                                                              SnackBarBehavior
                                                                  .floating,
                                                          margin:
                                                              EdgeInsets.all(5),
                                                        );
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                snackdemo);
                                                        setState(() {
                                                          pdfprogress1 = null;
                                                        });
                                                      });
                                                }));
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 30.0.h,
                                    width: 70.0.w,
                                    child: Center(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'PDF',
                                          style: buttontext,
                                        )
                                      ],
                                    )),
                                    decoration: BoxDecoration(
                                      color: appbarcolor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0.h,
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
            SizedBox(
              height: 15.0.h,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedindex1 = !selectedindex1;
                  selectedindex = false;
                });
              },
              child: Container(
                height: 40.0.h,
                width: 400.w,
                child: Card(
                  color: selectedindex1 == true
                      ? Color(0xff455A64)
                      : screenbackground,
                  child: Center(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5.0.w,
                        ),
                        Container(
                          width: 280.w,
                          child: Text(
                            "Rapport données clients",
                            style: selectedindex1 == true
                                ? headingcolor
                                : listStyleappcolor,
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          color: selectedindex1 == true
                              ? screenbackground
                              : appbarcolor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            selectedindex1 == true
                ? Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Container(
                      height: 130.0.h,
                      width: 500.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFC9CCCE)),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () async {
                              setState(() {
                                print('clickk');
                                exportDetailsCSV2Controller
                                    .getexportdetailscsv2Controller()
                                    .then((value) => setState(() {
                                          exportDetailsCSV2Controller
                                                  .isexportcsvLoading.value
                                              ? CircularProgressIndicator()
                                              : exportDetailsCSV2Controller
                                                      .listData.isEmpty
                                                  ? Text(
                                                      'AUCUNE DONNÉE DISPONIBLE')
                                                  : FileDownloader.downloadFile(
                                                      url:
                                                          exportDetailsCSV2Controller
                                                              .listData[0]
                                                              .data[0]
                                                              .filename
                                                              .trim(),
                                                      onProgress:
                                                          (name, progress) {
                                                        setState(() {
                                                          _progress1 = progress;
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  'processing');
                                                        });
                                                      },
                                                      onDownloadCompleted:
                                                          (value) {
                                                        print('path  $value ');
                                                        // Fluttertoast.showToast(
                                                        //     msg:
                                                        //         'téléchargement de fichier');
                                                        const snackdemo =
                                                            SnackBar(
                                                          content: Center(
                                                            child: Text(
                                                                'téléchargement de fichier'),
                                                          ),
                                                          backgroundColor:
                                                              appbarcolor,
                                                          elevation: 10,
                                                          behavior:
                                                              SnackBarBehavior
                                                                  .floating,
                                                          margin:
                                                              EdgeInsets.all(5),
                                                        );
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                snackdemo);
                                                        setState(() {
                                                          _progress1 = null;
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  'processing');
                                                        });
                                                      });
                                        }));
                              });
                            },
                            child: Container(
                              child: Center(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    height: 10.0.h,
                                  ),
                                  Image.asset(
                                    'assets/images/csv.png',
                                    height: 70.0.h,
                                  ),
                                  SizedBox(
                                    height: 5.0.h,
                                  ),
                                  Text(
                                    'Télécharger',
                                    style: homepagecount,
                                  ),
                                ],
                              )),
                              decoration: BoxDecoration(
                                // border: Border.all(color: appbarcolor),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              setState(() {
                                print('clickk');
                                exportDetailsCSV2Controller
                                    .getexportdetailspdf2Controller()
                                    .then((value) => setState(() {
                                          exportDetailsCSV2Controller
                                                  .isexportcsvLoading.value
                                              ? CircularProgressIndicator()
                                              : exportDetailsCSV2Controller
                                                      .pdf.isEmpty
                                                  ? Fluttertoast.showToast(
                                                      msg:
                                                          'AUCUNE DONNÉE DISPONIBLE')
                                                  : FileDownloader.downloadFile(
                                                      url:
                                                          exportDetailsCSV2Controller
                                                              .pdf[0]
                                                              .data[0]
                                                              .filename
                                                              .trim(),
                                                      onProgress:
                                                          (name, progress) {
                                                        setState(() {
                                                          pdfprogress2 =
                                                              progress;
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  'processing');
                                                        });
                                                      },
                                                      onDownloadCompleted:
                                                          (value) {
                                                        print('path  $value ');
                                                        const snackdemo =
                                                            SnackBar(
                                                          content: Center(
                                                            child: Text(
                                                                'téléchargement de fichier'),
                                                          ),
                                                          backgroundColor:
                                                              appbarcolor,
                                                          elevation: 10,
                                                          behavior:
                                                              SnackBarBehavior
                                                                  .floating,
                                                          margin:
                                                              EdgeInsets.all(5),
                                                        );
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                snackdemo);
                                                        setState(() {
                                                          pdfprogress2 = null;
                                                        });
                                                      });
                                        }));
                              });
                            },
                            child: Container(
                              child: Center(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    height: 10.0.h,
                                  ),
                                  Image.asset(
                                    'assets/images/pdf.png',
                                    height: 70.0.h,
                                  ),
                                  SizedBox(
                                    height: 5.0.h,
                                  ),
                                  Text(
                                    'Télécharger',
                                    style: homepagecount,
                                  ),
                                ],
                              )),
                              decoration: BoxDecoration(
                                // border: Border.all(color: appbarcolor),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
            SizedBox(
              height: 20.0.h,
            ),
          ],
        ),
      )),
    );
  }
}
