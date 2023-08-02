import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rewup/controller/coupon_utilized_controller.dart';
import 'package:rewup/controller/coupon_won_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/dashboard_controller.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/textstyles.dart';

class CoupontilizedPage extends StatefulWidget {
  const CoupontilizedPage({super.key, this.count});
  final String? count;
  @override
  State<CoupontilizedPage> createState() => _CoupontilizedPageState();
}

class _CoupontilizedPageState extends State<CoupontilizedPage> {
  CouponUtilizedController couponUtilizedController =
      Get.put(CouponUtilizedController());
  Dashboardcontroller dashboardcontroller = Get.put(Dashboardcontroller());

  getfunc() async {
    await couponUtilizedController.getCouponutilizedController(
        fromdate: dashboardcontroller.fromdate.text,
        todate: dashboardcontroller.todate.text);
  }

  @override
  void initState() {
    getfunc();

    super.initState();
  }

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
            'Cadeau remis',
            style: heading,
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 0.0, right: 0.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // widget.count.toString() == 0.toString()
              //     ? Container()
              //     : Obx(() {
              //         if (couponUtilizedController.couponLoading.value) {
              //           return Center(
              //             child: CircularProgressIndicator(),
              //           );
              //         } else if (couponUtilizedController.listData.isEmpty) {
              //           return Center(
              //             child: Text('AUCUNE DONNÉE DISPONIBLE'),
              //           );
              //         } else {
              //           return Padding(
              //             padding:
              //                 const EdgeInsets.only(left: 00.0, right: 00.0),
              //             child: Container(
              //                 height: 40.0.h,
              //                 width: 500.0.w,
              //                 decoration: BoxDecoration(
              //                     color: Color(0xff1B4539).withOpacity(0.2),
              //                     borderRadius: BorderRadius.circular(5)),
              //                 child: ListView.builder(
              //                     itemCount: couponUtilizedController
              //                         .listData[0].title.length,
              //                     itemBuilder: (context, index) {
              //                       return Padding(
              //                         padding: const EdgeInsets.all(8.0),
              //                         child: Row(
              //                           // mainAxisAlignment:
              //                           //     MainAxisAlignment.spaceBetween,
              //                           children: [
              //                             SizedBox(
              //                               width: 15.0.w,
              //                             ),
              //                             Container(
              //                               width: 130.0.w,
              //                               child: Text(
              //                                 couponUtilizedController
              //                                     .listData[0]
              //                                     .title[index]
              //                                     .title1
              //                                     .toString(),
              //                                 style: tablestyle,
              //                               ),
              //                             ),
              //                             Container(
              //                               width: 140.0.w,
              //                               child: Text(
              //                                 couponUtilizedController
              //                                     .listData[0]
              //                                     .title[index]
              //                                     .title2
              //                                     .toString(),
              //                                 style: tablestyle,
              //                               ),
              //                             ),
              //                             Container(
              //                               width: 40.0.w,
              //                               child: Row(
              //                                 children: [
              //                                   Flexible(
              //                                     child: Text(
              //                                       couponUtilizedController
              //                                           .listData[0]
              //                                           .title[index]
              //                                           .title3
              //                                           .toString(),
              //                                       style: tablestyle,
              //                                       maxLines: 2,
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       );
              //                     })),
              //           );
              //         }
              //       }),
              widget.count.toString() == 0.toString()
                  ? Container(
                      height: 500.0.h,
                      width: 500.0.w,
                      child: Center(
                          child: Text(
                        'AUCUNE DONNÉE DISPONIBLE...!',
                        style: listStyle,
                      )))
                  : Obx(() {
                      if (couponUtilizedController.couponLoading.value) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (couponUtilizedController.listData.isEmpty) {
                        return Center(
                          child: Text('AUCUNE DONNÉE DISPONIBLE'),
                        );
                      } else {
                        return Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Container(
                              height: 1000.0.h,
                              width: 1000.0.w,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: couponUtilizedController
                                              .listData[0].data.length,
                                          itemBuilder: (context, index) {
                                            var couponname =
                                                couponUtilizedController
                                                    .listData[0].data[index];
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 70.0.h,
                                                width: 500.0.w,
                                                child: Card(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,

                                                    //  crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 30,
                                                        backgroundColor:
                                                            appbarcolor,
                                                        child: new Text(
                                                          couponname.coupon
                                                              .toString(),
                                                          style: headingcolor,
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                              width: 200.0.w,
                                                              child: Row(
                                                                children: <Widget>[
                                                                  Text(
                                                                    'Name: ',
                                                                    style:
                                                                        categorytextbold,
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        new Text(
                                                                      couponname
                                                                          .name
                                                                          .toString(),
                                                                      style:
                                                                          tablestyle,
                                                                    ),
                                                                  )
                                                                ],
                                                              )),
                                                          Container(
                                                              width: 100.0.w,
                                                              child: Row(
                                                                children: <Widget>[
                                                                  Text(
                                                                    'Gift:',
                                                                    style:
                                                                        categorytextbold,
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        new Text(
                                                                      couponname
                                                                          .couponcode
                                                                          .toString(),
                                                                      style:
                                                                          tablestyle,
                                                                    ),
                                                                  )
                                                                ],
                                                              )),
                                                          Container(
                                                              width: 230.0.w,
                                                              child: Row(
                                                                children: <Widget>[
                                                                  Text(
                                                                    'Date et heure: ',
                                                                    style:
                                                                        categorytextbold,
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        new Text(
                                                                      couponname
                                                                          .timeAdded
                                                                          .toString(),
                                                                      style:
                                                                          tablestyle,
                                                                    ),
                                                                  )
                                                                ],
                                                              )),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    )
                                  ],
                                ),
                              )),
                        );
                      }
                    }),
            ],
          ),
        ),
      ),
    );
  }
}
