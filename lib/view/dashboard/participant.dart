import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rewup/controller/coupon_utilized_controller.dart';
import 'package:rewup/controller/coupon_won_controller.dart';
import 'package:rewup/controller/participant_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/dashboard_controller.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/textstyles.dart';

class ParticipantPage extends StatefulWidget {
  const ParticipantPage({super.key, this.count});
  final String? count;
  @override
  State<ParticipantPage> createState() => _ParticipantPageState();
}

class _ParticipantPageState extends State<ParticipantPage> {
  ParticipantController participantController =
      Get.put(ParticipantController());
  Dashboardcontroller dashboardcontroller = Get.put(Dashboardcontroller());

  getfunc() async {
    await participantController.getParticipantController(
        fromdate: dashboardcontroller.fromdate.text,
        todate: dashboardcontroller.todate.text);
  }

  @override
  void initState() {
    setState(() {
      getfunc();
    });
    super.initState();
  }

  @override
  void dispose() {
    participantController.dispose();
    super.dispose();
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
            'Détails des participants',
            style: heading,
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.count.toString() == 0.toString()
                  ? Container()
                  : Obx(() {
                      if (participantController.couponLoading.value) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (participantController.listData.isEmpty) {
                        return Center(
                          child: Text('AUCUNE DONNÉE DISPONIBLE'),
                        );
                      } else {
                        return Padding(
                          padding:
                              const EdgeInsets.only(left: 00.0, right: 00.0),
                          child: Container(
                              height: 40.0.h,
                              width: 500.0.w,
                              decoration: BoxDecoration(
                                  color: Color(0xff423592).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(5)),
                              child: ListView.builder(
                                  itemCount: participantController
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
                                              participantController.listData[0]
                                                  .title[index].title1
                                                  .toString(),
                                              style: tablestyle,
                                            ),
                                          ),
                                          Container(
                                            width: 130.0.w,
                                            child: Text(
                                              participantController.listData[0]
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
                                                    participantController
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
                      if (participantController.couponLoading.value) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (participantController.listData.isEmpty) {
                        return Center(
                          child: Text('AUCUNE DONNÉE DISPONIBLE'),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 0.0),
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
                                          itemCount: participantController
                                              .listData[0].data.length,
                                          itemBuilder: (context, index) {
                                            var couponname =
                                                participantController
                                                    .listData[0].data[index];
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
                                                              child: new Text(
                                                                couponname.name
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
                                                              child: new Text(
                                                                couponname.email
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
                                                              child: new Text(
                                                                couponname.phone
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
      ),
    );
  }
}
