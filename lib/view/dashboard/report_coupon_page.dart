import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:rewup/controller/report_coupon_details_controller.dart';

import '../../utils/colors.dart';
import '../../utils/textstyles.dart';

class ReportCouponPage extends StatefulWidget {
  const ReportCouponPage({
    super.key,
  });
  // final String? coupon;
  // final String? totalwon;
  // final String? utilized;
  // final String? unutilized;

  @override
  State<ReportCouponPage> createState() => _ReportCouponPageState();
}

class _ReportCouponPageState extends State<ReportCouponPage> {
  ReportCouponDetailsController reportCouponDetailsController =
      Get.put(ReportCouponDetailsController());

  // getfunc() async {
  //   // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   // var storeid = sharedPreferences.getString(Constants.storeid);
  //   await reportCouponDetailsController.getReportCouponDetailsController();
  // }

  // @override
  // void initState() {
  //   getfunc();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: appbarcolor,
          //  / automaticallyImplyLeading: false,
          centerTitle: true,
          leading: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back))),
          title: Text(
            'Performance des cadeau',
            style: heading,
          )),
      body: Obx(() {
        if (reportCouponDetailsController.reportcouponLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (reportCouponDetailsController.listData[0].data.isEmpty) {
          return Center(
            child: Text('AUCUNE DONNÉE DISPONIBLE'),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40.0.h,
                  width: 1000.0.w,
                  decoration: BoxDecoration(
                      color: Color(0xff423592).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              // width: 115.0.w,
                              child: Text(
                                "Coupon",
                                style: tablestyle,
                              ),
                            ),
                            Container(
                              // width: 110.0.w,
                              child: Text(
                                "Total gagné",
                                style: tablestyle,
                              ),
                            ),
                            Text(
                              "Utilisé",
                              style: tablestyle,
                            ),
                            Text(
                              "Inutilisé",
                              style: tablestyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          reportCouponDetailsController.listData[0].data.length,
                      itemBuilder: (context, index) {
                        var couponname = reportCouponDetailsController
                            .listData[0].data[index];
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: 40.0.h,
                            width: 100.0.w,
                            child: Card(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,

                                //  crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text(
                                  //   couponname.title.toString(),
                                  //   style: categorytext,
                                  // ),
                                  // Text(
                                  //   couponname.totalcouponwon.toString(),
                                  //   style: categorytext,
                                  // ),
                                  // Text(
                                  //   couponname.totalcouponutilized.toString(),
                                  //   style: categorytext,
                                  // ),
                                  // Text(
                                  //   couponname.totalcouponunutilized
                                  //       .toString(),
                                  //   style: categorytext,
                                  // ),
                                  SizedBox(
                                    width: 5.0.w,
                                  ),
                                  Container(
                                      width: 100.0.w,
                                      child: Row(
                                        children: <Widget>[
                                          Flexible(
                                            child: new Text(
                                              couponname.title.toString(),
                                              style: listtitlecolor,
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
                                              couponname.totalcouponwon
                                                  .toString(),
                                              style: listtitlecolor,
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
                                              couponname.totalcouponutilized
                                                  .toString(),
                                              style: listtitlecolor,
                                            ),
                                          )
                                        ],
                                      )),
                                  Container(
                                      width: 45.0.w,
                                      child: Row(
                                        children: <Widget>[
                                          Flexible(
                                            child: new Text(
                                              couponname.totalcouponunutilized
                                                  .toString(),
                                              style: listtitlecolor,
                                            ),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            )),
          );
        }
      }),
    );
  }
}
