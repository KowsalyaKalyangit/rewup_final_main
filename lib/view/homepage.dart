import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'package:rewup/controller/pie_chart_controller.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../allpackages.dart';

import '../controller/consent_controller.dart';
import '../controller/coupon_utilized_controller.dart';
import '../controller/coupon_won_controller.dart';
import '../controller/dashboard_controller.dart';
import '../controller/date/dashboard_count_controller.dart';
import '../controller/getdetails_controller.dart';

import '../controller/graph_controller.dart';
import '../controller/profile_controller.dart';
import '../controller/report_coupon_details_controller.dart';
import '../controller/user_particpant_controller.dart';
import '../utils/constants.dart';
import 'dashboard/appbar.dart';

import 'dashboard/pie_chart.dart';
import 'dashboard/report_coupon_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, String? username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DetailsController detailsController = Get.put(DetailsController());
  CouponWonController couponWonController = Get.put(CouponWonController());
  ReportCouponDetailsController reportCouponDetailsController =
      Get.put(ReportCouponDetailsController());
  ProfileController profileController = Get.put(ProfileController());
  DashboardCountcontroller dashboardCountcontroller =
      Get.put(DashboardCountcontroller());
  PieChartcontroller pieChartcontroller = Get.put(PieChartcontroller());
  ConsentController consentController = Get.put(ConsentController());
  var username;
  var userid;
  Dashboardcontroller dashboardcontroller = Get.put(Dashboardcontroller());
  GraphController graphController = Get.put(GraphController());
  UserParticpantController userParticpantController =
      Get.put(UserParticpantController());
  CouponUtilizedController couponUtilizedController =
      Get.put(CouponUtilizedController());

  double? _progress;
  double? _progress1;
  getfunc() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    username = sharedPreferences.getString(Constants.username);
    userid = sharedPreferences.getString(Constants.userid);

    var storeid = sharedPreferences.getString(Constants.storeid);

    dashboardcontroller.dahboardcontrollermain(storeid);
    graphController.getGraphControllermain();
    pieChartcontroller.piechartControllermain();
    reportCouponDetailsController.getReportCouponDetailsControllermain();
  }

  // GraphController graphController = Get.put(GraphController());
  // PieChartcontroller chartcontroller=Pie

  @override
  void initState() {
    // detailsController.getDetailController();
    getfunc();

    super.initState();
  }

  Future<void> _refresh() {
    return Future.delayed(Duration(seconds: 4));
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  var winnersname = [
    'kalyan',
    'N/A',
    'Penda',
    'Moham',
    'N/A',
    'Sandra',
    'Muriel',
    'Jode'
  ];

  var dishname = [
    '1 Tandoori',
    'Pizza',
    'Burger',
    'dosa',
    'Briyani',
    'Mini Idly',
    'Gobi 65',
    'Chicken 65'
  ];
  getappbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: appbarcolor,
      automaticallyImplyLeading: false,
      leadingWidth: 300.0.w,
      toolbarHeight: 90.0.h,
      leading: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/textlogo3.png',
              height: 20.0.h,
              color: screenbackground,
            ),
            AppbarPage()
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) => StatefulBuilder(builder: (context, setState) {
                  return AlertDialog(
                    title: Text(
                      "Veuillez sélectionner la période souhaitée.",
                      style: listStyleappcolor,
                      textAlign: TextAlign.center,
                    ),
                    //content: const Text("You have raised a Alert Dialog Box"),
                    actions: [
                      Column(
                        children: [
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
                                  controller: dashboardcontroller.fromdate,
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
                                        dashboardcontroller.fromdate.text =
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
                                      hintText: 'sélectionner Periode Du',
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
                                  controller: dashboardcontroller.todate,
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
                                        dashboardcontroller.todate.text =
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
                                      hintText: 'sélectionner Periode Au',
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
                              // IconButton(
                              //     onPressed: () {
                              //       dashboardcontroller.todate.text = '';
                              //       dashboardcontroller.fromdate.text = '';
                              //     },
                              //     icon: Icon(Icons.delete))
                            ],
                          ),
                          SizedBox(
                            height: 30.0.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () async {
                                  SharedPreferences sharedPreferences =
                                      await SharedPreferences.getInstance();
                                  var storeid = sharedPreferences
                                      .getString(Constants.storeid);
                                  dashboardcontroller.dahboardcontrollermain(
                                    storeid,
                                  );
                                  graphController.getGraphControllermain();

                                  reportCouponDetailsController
                                      .getReportCouponDetailsControllermain()
                                      .then((value) {
                                    dashboardcontroller.fromdate.clear();
                                    dashboardcontroller.todate.clear();
                                    Get.back();
                                  });
                                  couponWonController
                                      .getCouponwonControllermain();
                                  consentController.getConsentControllermain();
                                  couponUtilizedController
                                      .getCouponutilizedControllermain();
                                  pieChartcontroller.piechartControllermain();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: appbarcolor,
                                  ),
                                  height: 30.0.h,
                                  width: 70.0.w,
                                  child: Center(
                                      child: Text(
                                    "Annuler",
                                    style: headingcolor,
                                  )),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  if (dashboardcontroller
                                      .fromdate.text.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "Entrez s'il vous plait Periode Du");
                                  } else if (dashboardcontroller
                                      .todate.text.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "Entrez s'il vous plait Periode Au");
                                  } else {
                                    SharedPreferences sharedPreferences =
                                        await SharedPreferences.getInstance();
                                    var storeid = sharedPreferences
                                        .getString(Constants.storeid);
                                    dashboardcontroller.dahboardcontroller(
                                      storeid,
                                    );

                                    graphController.getGraphController(
                                        dashboardcontroller.fromdate.text,
                                        dashboardcontroller.todate.text);

                                    await reportCouponDetailsController
                                        .getReportCouponDetailsController(
                                            fromdate: dashboardcontroller
                                                .fromdate.text,
                                            todate:
                                                dashboardcontroller.todate.text)
                                        .then((value) {
                                      // dashboardcontroller.fromdate.clear();
                                      // dashboardcontroller.todate.clear();
                                      Get.back();
                                    });
                                    await pieChartcontroller.piechartController(
                                        fromdate:
                                            dashboardcontroller.fromdate.text,
                                        todate:
                                            dashboardcontroller.todate.text);
                                    await couponWonController
                                        .getCouponwonController(
                                            fromdate: dashboardcontroller
                                                .fromdate.text,
                                            todate: dashboardcontroller
                                                .todate.text);

                                    consentController.getConsentController(
                                        dashboardcontroller.fromdate.text,
                                        dashboardcontroller.todate.text);
                                    await couponUtilizedController
                                        .getCouponutilizedController(
                                            fromdate: dashboardcontroller
                                                .fromdate.text,
                                            todate: dashboardcontroller
                                                .todate.text);
                                  }
                                },
                                child: Container(
                                  height: 30.0.h,
                                  width: 70.0.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: appbarcolor,
                                  ),
                                  child: Center(
                                      child: Text(
                                    "Valider",
                                    style: headingcolor,
                                  )),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30.0.h,
                          )
                        ],
                      ),
                    ],
                  );
                }),
              );
            },
            child: Icon(
              Icons.calendar_month_outlined,
              color: screenbackground,
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(right: 20.0),
        //   child: InkWell(
        //     onTap: () {
        //       Get.to(StoreDetailsPage());
        //     },
        //     child: Icon(
        //       Icons.person_3_outlined,
        //       color: screenbackground,
        //     ),
        //   ),
        // ),
      ],
    );
  }

  @override
  void dispose() {
    dashboardcontroller.fromdate.text = '';
    dashboardcontroller.todate.text = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getappbar(),
      body: LayoutBuilder(builder: (context, constraints) {
        return RefreshIndicator(
          onRefresh: () async {
            setState(() async {
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              var storeid = sharedPreferences.getString(Constants.storeid);
              var userid = sharedPreferences.getString(Constants.userid);
              dashboardcontroller.dahboardcontrollermain(storeid.toString());

              userParticpantController.getUserParticpantController();
              graphController.getGraphControllermain();
              reportCouponDetailsController
                  .getReportCouponDetailsControllermain();

              pieChartcontroller.piechartControllermain().then((value) {
                dashboardcontroller.fromdate.text = '';
                dashboardcontroller.todate.text = '';
              });
              // couponWonController.getCouponwonControllermain();
              // consentController.getConsentControllermain();
              // couponUtilizedController.getCouponutilizedControllermain();
            });
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Categories(),

                  SizedBox(
                    height: 5.0.h,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 20, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Répartition par parcours',
                          style: listtitle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      height: 160.0.h,
                      width: 800.0.w,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0, top: 10.0),
                              child: Container(
                                  height: 120.h, child: PieChartPage()),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 20, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Performance des cadeaux',
                          style: listtitle,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(ReportCouponPage());
                            // Get.toNamed('/couponreport');
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 25.0),
                            child: Container(
                              width: 110.0.w,
                              height: 30.0.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                // color: appbarcolor,
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'En savoir plus',
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 10.00.sp,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    Icon(
                                      Icons.double_arrow,
                                      color: formhintcolor,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      height: 40.0.h,
                      width: 1000.0.w,
                      decoration: BoxDecoration(
                          color: appbarcolor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  // width: 115.0.w,
                                  child: Text(
                                    "Coupon",
                                    style: viewdetails,
                                  ),
                                ),
                                Container(
                                  // width: 110.0.w,
                                  child: Text(
                                    "Total gagné",
                                    style: viewdetails,
                                  ),
                                ),
                                Text(
                                  "Utilisé",
                                  style: viewdetails,
                                ),
                                Text(
                                  "Inutilisé",
                                  style: viewdetails,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Obx(() {
                  //   if (reportCouponDetailsController.reportcouponLoading.value) {
                  //     return Center(
                  //       child: CircularProgressIndicator(),
                  //     );
                  //   } else if (reportCouponDetailsController
                  //       .listData[0].data.isEmpty) {
                  //     return Center(
                  //       child: Text('AUCUNE DONNÉE DISPONIBLE'),
                  //     );
                  //   } else {
                  //     return Padding(
                  //       padding: const EdgeInsets.only(left: 23.0, right: 23.0),
                  //       child: Container(
                  //           height: 30.0.h,
                  //           width: 500.0.w,
                  //           decoration: BoxDecoration(
                  //               color: appbarcolor,
                  //               borderRadius: BorderRadius.circular(5)),
                  //           child: ListView.builder(
                  //               itemCount:
                  //                   reportCouponDetailsController.listData.length,
                  //               itemBuilder: (context, index) {
                  //                 return Padding(
                  //                   padding: const EdgeInsets.all(8.0),
                  //                   child: Row(
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.spaceBetween,
                  //                     children: [
                  //                       Container(
                  //                         // width: 120.0.w,
                  //                         child: Text(
                  //                           dashboardcontroller.fromdate.text ==
                  //                                       '' &&
                  //                                   dashboardcontroller
                  //                                           .todate.text ==
                  //                                       ''
                  //                               ? reportCouponDetailsController
                  //                                   .listData[0].title[0].title1
                  //                                   .toString()
                  //                               : reportCouponDetailsController
                  //                                   .listData[0].title[0].title1
                  //                                   .toString(),
                  //                           style: viewdetails,
                  //                         ),
                  //                       ),
                  //                       Container(
                  //                         // width: 120.0.w,
                  //                         child: Text(
                  //                           dashboardcontroller.fromdate.text ==
                  //                                       '' &&
                  //                                   dashboardcontroller
                  //                                           .todate.text ==
                  //                                       ''
                  //                               ? reportCouponDetailsController
                  //                                   .listData[0].title[index].title2
                  //                                   .toString()
                  //                               : reportCouponDetailsController
                  //                                   .listData[0].title[index].title2
                  //                                   .toString(),
                  //                           style: viewdetails,
                  //                         ),
                  //                       ),
                  //                       Container(
                  //                         // width: 120.0.w,
                  //                         child: Text(
                  //                           dashboardcontroller.fromdate.text ==
                  //                                       '' &&
                  //                                   dashboardcontroller
                  //                                           .todate.text ==
                  //                                       ''
                  //                               ? reportCouponDetailsController
                  //                                   .listData[0].title[index].title3
                  //                                   .toString()
                  //                               : reportCouponDetailsController
                  //                                   .listData[0].title[index].title3
                  //                                   .toString(),
                  //                           style: viewdetails,
                  //                         ),
                  //                       ),
                  //                       Container(
                  //                         // width: 120.0.w,
                  //                         child: Text(
                  //                           reportCouponDetailsController
                  //                               .listData[0].title[index].title4
                  //                               .toString(),
                  //                           style: viewdetails,
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 );
                  //               })),
                  //     );
                  //   }
                  // }),
                  Obx(() {
                    if (reportCouponDetailsController
                        .reportcouponLoading.value) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (reportCouponDetailsController
                        .listData[0].data.isEmpty) {
                      return Container(
                        height: 50.0.h,
                        width: 500.0.w,
                        child: Center(
                          child: Text('AUCUNE DONNÉE DISPONIBLE'),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Container(
                            height: 120.0.h,
                            width: 1000.0.w,
                            child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10.0.h,
                                  ),
                                  Container(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: reportCouponDetailsController
                                                    .listData[0].data.length <=
                                                3
                                            ? reportCouponDetailsController
                                                .listData[0].data.length
                                            : 3,
                                        itemBuilder: (context, index) {
                                          var couponname =
                                              reportCouponDetailsController
                                                  .listData[0].data[index];
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                    width: 100.0.w,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Flexible(
                                                          child: new Text(
                                                            dashboardcontroller.fromdate
                                                                            .text ==
                                                                        '' &&
                                                                    dashboardcontroller
                                                                            .todate
                                                                            .text ==
                                                                        ''
                                                                ? couponname
                                                                    .title
                                                                    .toString()
                                                                : couponname
                                                                    .title
                                                                    .toString(),
                                                            style:
                                                                listtitlecolor,
                                                          ),
                                                        )
                                                      ],
                                                    )),
                                                Container(
                                                    width: 70.0.w,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Flexible(
                                                          child: new Text(
                                                            dashboardcontroller.fromdate
                                                                            .text ==
                                                                        '' &&
                                                                    dashboardcontroller
                                                                            .todate
                                                                            .text ==
                                                                        ''
                                                                ? couponname
                                                                    .totalcouponwon
                                                                    .toString()
                                                                : couponname
                                                                    .totalcouponwon
                                                                    .toString(),
                                                            style:
                                                                listtitlecolor,
                                                          ),
                                                        )
                                                      ],
                                                    )),
                                                Container(
                                                    width: 65.0.w,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Flexible(
                                                          child: new Text(
                                                            dashboardcontroller.fromdate
                                                                            .text ==
                                                                        '' &&
                                                                    dashboardcontroller
                                                                            .todate
                                                                            .text ==
                                                                        ''
                                                                ? couponname
                                                                    .totalcouponutilized
                                                                    .toString()
                                                                : couponname
                                                                    .totalcouponutilized
                                                                    .toString(),
                                                            style:
                                                                listtitlecolor,
                                                          ),
                                                        )
                                                      ],
                                                    )),
                                                Container(
                                                    width: 30.0.w,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Flexible(
                                                          child: new Text(
                                                            dashboardcontroller.fromdate
                                                                            .text ==
                                                                        '' &&
                                                                    dashboardcontroller
                                                                            .todate
                                                                            .text ==
                                                                        ''
                                                                ? couponname
                                                                    .totalcouponunutilized
                                                                    .toString()
                                                                : couponname
                                                                    .totalcouponunutilized
                                                                    .toString(),
                                                            style:
                                                                listtitlecolor,
                                                          ),
                                                        )
                                                      ],
                                                    )),
                                              ],
                                            ),
                                          );
                                        }),
                                  )
                                ],
                              ),
                            )),
                      );
                    }
                  })
                ]),
          ),
        );
      }),
    );
  }
}
