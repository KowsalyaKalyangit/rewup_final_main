import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:rewup/allpackages.dart';
import 'package:rewup/controller/dashboard_controller.dart';
import 'package:rewup/controller/graph_controller.dart';
import 'package:rewup/controller/pie_chart_controller.dart';

class PieChartPage extends StatefulWidget {
  @override
  State<PieChartPage> createState() => _PieChartPageState();
}

class _PieChartPageState extends State<PieChartPage> {
  PieChartcontroller pieChartcontroller = Get.put(PieChartcontroller());
  Dashboardcontroller dashboardcontroller = Get.put(Dashboardcontroller());
  // final List<PieChartSectionData> pieChartData = [
  //   PieChartSectionData(
  //     value: 40,
  //     color: Colors.red,
  //     title: 'Red',
  //     radius: 80,
  //     titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //   ),
  //   PieChartSectionData(
  //     value: 30,
  //     color: Colors.blue,
  //     title: 'Blue',
  //     radius: 80,
  //     titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //   ),
  //   PieChartSectionData(
  //     value: 15,
  //     color: Colors.green,
  //     title: 'Green',
  //     radius: 80,
  //     titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //   ),
  //   PieChartSectionData(
  //     value: 15,
  //     color: Colors.yellow,
  //     title: 'Yellow',
  //     radius: 80,
  //     titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //   ),
  // ];
  @override
  void initState() {
    pieChartcontroller.piechartController(
        fromdate: dashboardcontroller.fromdate.text,
        todate: dashboardcontroller.todate.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (pieChartcontroller.ispieLoad.value) {
        return Center(child: CircularProgressIndicator());
      } else if (pieChartcontroller.listData.isEmpty) {
        return Text('AUCUNE DONNÉE DISPONIBLE');
      } else {
        return Container(
          height: 80.0.h,
          width: 1000.0.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              pieChartcontroller.listData[0].facebookCount == 0 &&
                      pieChartcontroller.listData[0].googleCount == 0 &&
                      pieChartcontroller.listData[0].instagramCount == 0 &&
                      pieChartcontroller.listData[0].twitterCount == 0
                  ? Container(
                      height: 100.0.h,
                      width: 130.0.w,
                      child: Center(
                          child: Image.asset(
                        'assets/images/nodata.png',
                        height: 70.h,
                      )),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey.shade300),
                    )
                  : Container(
                      width: 120.0.w,
                      child: PieChart(
                        PieChartData(
                          sections: [
                            PieChartSectionData(
                                value: pieChartcontroller
                                            .listData[0].googleCount ==
                                        ''
                                    ? pieChartcontroller.listData[0].googleCount
                                        .toDouble()
                                    : pieChartcontroller.listData[0].googleCount
                                        .toDouble(),
                                color: Color(0xff34AB53),
                                // title: 'totalcouponwon',
                                radius: 30,
                                titleStyle: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                            PieChartSectionData(
                                value: pieChartcontroller
                                            .listData[0].facebookCount ==
                                        ''
                                    ? pieChartcontroller
                                        .listData[0].facebookCount
                                        .toDouble()
                                    : pieChartcontroller
                                        .listData[0].facebookCount
                                        .toDouble(),
                                color: Color(0xff3b5998),
                                //title: ' utilized',
                                radius: 30,
                                titleStyle: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                            PieChartSectionData(
                                value: pieChartcontroller
                                            .listData[0].instagramCount ==
                                        ''
                                    ? pieChartcontroller
                                        .listData[0].instagramCount
                                        .toDouble()
                                    : pieChartcontroller
                                        .listData[0].instagramCount
                                        .toDouble(),
                                color: Color(0xffE4405F),
                                // title: 'unutilized',
                                radius: 30,
                                titleStyle: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                            PieChartSectionData(
                                value: pieChartcontroller
                                            .listData[0].twitterCount ==
                                        ''
                                    ? pieChartcontroller
                                        .listData[0].twitterCount
                                        .toDouble()
                                    : pieChartcontroller
                                        .listData[0].twitterCount
                                        .toDouble(),
                                color: Color(0xff00acee),
                                // title: 'unutilized',
                                radius: 30,
                                titleStyle: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                          ],
                          centerSpaceRadius: 30,
                          borderData: FlBorderData(show: false),
                          sectionsSpace: 0,
                        ),
                      ),
                    ),
              Container(
                height: 80.0.h,
                width: 130.0.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Container(
                            height: 15.0.h,
                            width: 15.0.w,
                            color: Color(0xff34AB53)),
                        SizedBox(
                          width: 10.0.w,
                        ),
                        Text(
                          pieChartcontroller.listData[0].title[0].title1
                              .toString(),
                          style: tablestyle,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            height: 15.0.h,
                            width: 15.0.w,
                            color: Color(0xffE4405F)),
                        SizedBox(
                          width: 10.0.w,
                        ),
                        Text(
                          pieChartcontroller.listData[0].title[0].title2
                              .toString(),
                          style: tablestyle,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 15.0.h,
                          width: 15.0.w,
                          color: Color(0xff3b5998),
                        ),
                        SizedBox(
                          width: 10.0.w,
                        ),
                        Text(
                          pieChartcontroller.listData[0].title[0].title3
                              .toString(),
                          style: tablestyle,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            height: 15.0.h,
                            width: 15.0.w,
                            color: Color(0xff00acee)),
                        SizedBox(
                          width: 10.0.w,
                        ),
                        Text(
                          pieChartcontroller.listData[0].title[0].title4
                              .toString(),
                          style: tablestyle,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}
