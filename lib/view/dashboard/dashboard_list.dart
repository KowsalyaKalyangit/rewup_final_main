import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rewup/controller/date/dashboard_count_controller.dart';
import 'package:rewup/view/dashboard/game_details.dart';
import 'package:rewup/view/dashboard/participant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../allpackages.dart';
import '../../controller/dashboard_controller.dart';
import '../../utils/constants.dart';
import 'chatsurvey.dart';
import 'consent.dart';
import 'coupon_utilized_page.dart';
import 'coupondetails_page.dart';
import 'couponwon_page.dart';
import 'customer_details.dart';

class DashboardList extends StatefulWidget {
  const DashboardList({super.key});

  @override
  State<DashboardList> createState() => _DashboardListState();
}

class _DashboardListState extends State<DashboardList> {
  Dashboardcontroller dashboardcontroller = Get.put(Dashboardcontroller());
  DashboardCountcontroller dashboardCountcontroller =
      Get.put(DashboardCountcontroller());

  @override
  void initState() {
    //  detailsController.getDetailController();
    func();
    super.initState();
  }

  func() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var storeid = sharedPreferences.getString(Constants.storeid);

    dashboardcontroller.dahboardcontrollermain(storeid.toString());
    //   dashboardCountcontroller.dahboardCountcontroller(storeid, context);
  }

  var color = [
    Color(0xffd7efff),
    Color(0xffe0d7ff),
    Color(0xfffbe1fb),
    Color(0xffb8eedc),
    // Color(0xFFE1E9FB),
    // Color(0xFFEEE2B6),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (dashboardcontroller.ischatsurveyLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (dashboardcontroller.listData.isEmpty) {
        return Center(
          child: Text('AUCUNE DONNÉE DISPONIBLE'),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Container(
              height: 195.0.h,
              width: 1000.0.w,
              padding: EdgeInsets.all(5.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  // scrollDirection: Axis.vertical,

                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dashboardcontroller.listData[0].data.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 900 / 3,
                      childAspectRatio: 9 / 4.50,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 5),
                  itemBuilder: (BuildContext context, index) {
                    var listdata = dashboardcontroller.listData[0];
                    return InkWell(
                      onTap: () {
                        if (index == 1) {
                          Get.to(CouponwonPage(
                            count: listdata.data[index].total.toString(),
                          ));
                        }
                        if (index == 2) {
                          Get.to(ConsntPage(
                              count: listdata.data[index].total.toString()));
                        }

                        if (index == 3) {
                          Get.to(CoupontilizedPage(
                              count: listdata.data[index].total.toString()));
                        }
                        // if (index == 4) {
                        //   Get.to(ParticipantPage(
                        //       count: listdata.data[index].total.toString()));
                        // }
                      },
                      child: Card(
                        color: color[index],
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Container(
                              //     height: 35.h,
                              //     child: Image.asset(images[index])),
                              Text(
                                dashboardcontroller
                                    .listData[0].data[index].name,
                                style: homepagecount,
                              ),
                              Text(
                                dashboardcontroller.fromdate.text == '' &&
                                        dashboardcontroller.todate.text == ''
                                    ? dashboardcontroller
                                        .listData[0].data[index].total
                                        .toString()
                                    : dashboardcontroller
                                        .listData[0].data[index].total
                                        .toString(),
                                style: homepagecountcolor,
                              ),
                            ]),
                      ),
                    );
                  })),
        );
      }
    });
  }
}
