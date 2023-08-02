// import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';

import 'package:rewup/controller/graph_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../allpackages.dart';
import '../../controller/dashboard_controller.dart';
import '../../utils/constants.dart';
import 'package:flutter_charts/flutter_charts.dart';

class BarChartExample extends StatefulWidget {
  @override
  _BarChartExampleState createState() => _BarChartExampleState();
}

class _BarChartExampleState extends State<BarChartExample> {
  GraphController graphController = Get.put(GraphController());
  Dashboardcontroller dashboardcontroller = Get.put(Dashboardcontroller());
  var itemdata = ['Joueurs', 'Répétiteurs', 'Utilisé'];
  @override
  void initState() {
    func();
    super.initState();
  }

  func() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var storeid = sharedPreferences.getString(Constants.storeid);
    setState(() {
      graphController.getGraphController(
          dashboardcontroller.fromdate.text, dashboardcontroller.todate.text);
      dashboardcontroller.dahboardcontroller(storeid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (graphController.isgraphLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (graphController.listData.isEmpty) {
        return Center(
          child: Text('AUCUNE DONNÉE DISPONIBLE '),
        );
      } else {
        return Container(
          height: 220.0.h,
          width: 500.0.w,
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) {
                var data = graphController.listData[index];
                var sortarray = [
                  data.totalcustomers,
                  data.repeatcustomers,
                  data.utilized
                ];
                var graphsort = sortarray.sort();
                return Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1.4,
                      child: BarChart(BarChartData(
                          borderData: FlBorderData(
                              border: Border(
                                  top: BorderSide.none,
                                  left: BorderSide(),
                                  bottom: BorderSide())),
                          alignment: BarChartAlignment.spaceAround,
                          barTouchData: BarTouchData(enabled: false),
                          maxY: sortarray.last.toDouble(),
                          minY: 0,
                          gridData: FlGridData(
                              drawHorizontalLine: false,
                              drawVerticalLine: false),
                          titlesData: FlTitlesData(
                              show: true,
                              rightTitles: AxisTitles(),
                              topTitles: AxisTitles(),
                              bottomTitles: AxisTitles(
                                  axisNameSize: 30,
                                  axisNameWidget: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        itemdata[0].toString(),
                                        style: listStyle,
                                      ),
                                      Text(itemdata[1].toString()),
                                      Text(itemdata[2].toString()),
                                    ],
                                  ))),
                          barGroups: [
                            BarChartGroupData(x: 0, barRods: [
                              BarChartRodData(
                                  toY: dashboardcontroller.fromdate.text ==
                                              '' &&
                                          dashboardcontroller.todate.text == ''
                                      ? data.totalcustomers.toDouble()
                                      : data.totalcustomers.toDouble(),
                                  width: 25.0.w,
                                  borderRadius: BorderRadius.zero,
                                  color: Colors.amber[900])
                            ]),
                            BarChartGroupData(x: 1, barRods: [
                              BarChartRodData(
                                  toY: dashboardcontroller.fromdate.text ==
                                              '' &&
                                          dashboardcontroller.todate.text == ''
                                      ? data.repeatcustomers.toDouble()
                                      : data.repeatcustomers.toDouble(),
                                  width: 25.0.w,
                                  borderRadius: BorderRadius.zero,
                                  color: appbarcolor)
                            ]),
                            BarChartGroupData(x: 2, barRods: [
                              BarChartRodData(
                                  toY: dashboardcontroller.fromdate.text ==
                                              '' &&
                                          dashboardcontroller.todate.text == ''
                                      ? data.utilized.toDouble()
                                      : data.utilized.toDouble(),
                                  width: 25.0.w,
                                  borderRadius: BorderRadius.zero,
                                  color: Colors.purple[900])
                            ]),
                          ])),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 40.0.w,
                        ),
                        Container(
                          width: 110.0.w,
                          child: Text(
                            dashboardcontroller.fromdate.text == '' &&
                                    dashboardcontroller.todate.text == ''
                                ? data.totalcustomers.toString()
                                : data.totalcustomers.toString(),
                            style: tablestyle,
                          ),
                        ),
                        Container(
                          width: 110.0.w,
                          child: Text(
                            dashboardcontroller.fromdate.text == '' &&
                                    dashboardcontroller.todate.text == ''
                                ? data.repeatcustomers.toString()
                                : data.repeatcustomers.toString(),
                            style: tablestyle,
                          ),
                        ),
                        Container(
                          width: 40.0.w,
                          child: Text(
                            dashboardcontroller.fromdate.text == '' &&
                                    dashboardcontroller.todate.text == ''
                                ? data.utilized.toString()
                                : data.utilized.toString(),
                            style: tablestyle,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }),
        );
      }
    });
  }
}
