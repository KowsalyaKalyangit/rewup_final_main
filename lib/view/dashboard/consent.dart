import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rewup/controller/consent_controller.dart';
import 'package:rewup/controller/coupon_utilized_controller.dart';
import 'package:rewup/controller/coupon_won_controller.dart';
import 'package:rewup/controller/participant_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/dashboard_controller.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/textstyles.dart';

class ConsntPage extends StatefulWidget {
  const ConsntPage({super.key, this.count});
  final String? count;
  @override
  State<ConsntPage> createState() => _ConsntPageState();
}

class _ConsntPageState extends State<ConsntPage> {
  ConsentController consentController = Get.put(ConsentController());
  Dashboardcontroller dashboardcontroller = Get.put(Dashboardcontroller());

  getfunc() async {
    await consentController.getConsentController(
        dashboardcontroller.fromdate.text, dashboardcontroller.todate.text);
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

          leading: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back))),
          title: Text(
            'Opt-in',
            style: heading,
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 0.0, right: 0.0),
        child: LayoutBuilder(builder: (context, constraints) {
          return RefreshIndicator(
            onRefresh: () => consentController.getConsentControllermain(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.count.toString() == 0.toString()
                      ? Container()
                      : Obx(() {
                          if (consentController.couponLoading.value) {
                            return Center(
                              child: Container(),
                            );
                          } else if (consentController.listData.isEmpty) {
                            return Center(
                              child: Text('AUCUNE DONNÉE DISPONIBLE'),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 00.0, right: 00.0),
                              child: Container(
                                  height: 40.0.h,
                                  width: 500.0.w,
                                  decoration: BoxDecoration(
                                      color: Color(0xff1B4539).withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: ListView.builder(
                                      itemCount: consentController
                                          .listData[0].title.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 10.0.w,
                                              ),
                                              Container(
                                                width: 110.0.w,
                                                child: Text(
                                                  consentController.listData[0]
                                                      .title[index].title1
                                                      .toString(),
                                                  style: tablestyle,
                                                ),
                                              ),
                                              Container(
                                                width: 140.0.w,
                                                child: Text(
                                                  consentController.listData[0]
                                                      .title[index].title2
                                                      .toString(),
                                                  style: tablestyle,
                                                ),
                                              ),
                                              Container(
                                                width: 60.0.w,
                                                child: Row(
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        consentController
                                                            .listData[0]
                                                            .title[index]
                                                            .title3
                                                            .toString(),
                                                        style: tablestyle,
                                                        maxLines: 2,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      })),
                            );
                          }
                        }),
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
                          if (consentController.couponLoading.value) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (consentController.listData.isEmpty) {
                            return Center(
                              child: Text('AUCUNE DONNÉE DISPONIBLE'),
                            );
                          } else {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 0.0, right: 0.0),
                              child: Container(
                                  height: 1000.0.h,
                                  width: 1000.0.w,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: consentController
                                                  .listData[0].data.length,
                                              itemBuilder: (context, index) {
                                                var couponname =
                                                    consentController
                                                        .listData[0]
                                                        .data[index];
                                                return Container(
                                                  height: 40.0.h,
                                                  width: 500.0.w,
                                                  child: Card(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,

                                                      //  crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                            width: 80.0.w,
                                                            child: Row(
                                                              children: <Widget>[
                                                                Flexible(
                                                                  child:
                                                                      new Text(
                                                                    couponname
                                                                        .name
                                                                        .toString(),
                                                                    style:
                                                                        listtitlecolor,
                                                                  ),
                                                                )
                                                              ],
                                                            )),
                                                        Container(
                                                            width: 130.0.w,
                                                            child: Row(
                                                              children: <Widget>[
                                                                Flexible(
                                                                  child:
                                                                      new Text(
                                                                    couponname
                                                                        .email
                                                                        .toString(),
                                                                    style:
                                                                        listtitlecolor,
                                                                  ),
                                                                )
                                                              ],
                                                            )),
                                                        Container(
                                                            width: 60.0.w,
                                                            child: Row(
                                                              children: <Widget>[
                                                                Flexible(
                                                                  child:
                                                                      new Text(
                                                                    couponname
                                                                        .phone
                                                                        .toString(),
                                                                    style:
                                                                        listtitlecolor,
                                                                  ),
                                                                )
                                                              ],
                                                            )),
                                                      ],
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
          );
        }),
      ),
    );
  }
}
