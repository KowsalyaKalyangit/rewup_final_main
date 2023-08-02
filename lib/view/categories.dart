import 'package:rewup/view/dashboard/coupondetails_page.dart';
import 'package:rewup/view/dashboard/efficiency_page.dart';
import 'package:rewup/view/dashboard/game_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../allpackages.dart';
import '../controller/coupon_won_controller.dart';
import '../controller/dashboard_controller.dart';
import '../controller/getdetails_controller.dart';

import '../utils/constants.dart';
import 'dashboard/chatsurvey.dart';
import 'dashboard/customer_details.dart';
import 'dashboard/dashboard_list.dart';
import 'dashboard/pie_chart.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  var categorynames = ['Coupon', 'Customers', 'Chat survey'];

  var count = ['16', '16', '0'];
  var selectedindex = 0;
  var images = [
    'assets/images/4.png',
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png'
  ];
  DetailsController detailsController = Get.put(DetailsController());
  CouponWonController couponWonController = Get.put(CouponWonController());

  // Group Value for Radio Button.

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DashboardList(),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Repeat Business",
                  style: listtitle,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              height: 290.h,
              width: 1000.w,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.0.h,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 15.0.h,
                                width: 15.0.w,
                                color: Colors.amber[900],
                              ),
                              SizedBox(
                                width: 10.0.w,
                              ),
                              Text(
                                'Joueurs',
                                style: tablestyle,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 15.0.h,
                                width: 15.0.w,
                                color: appbarcolor,
                              ),
                              SizedBox(
                                width: 10.0.w,
                              ),
                              Text(
                                'Répétiteurs',
                                style: tablestyle,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 15.0.h,
                                width: 15.0.w,
                                color: Colors.purple[900],
                              ),
                              SizedBox(
                                width: 10.0.w,
                              ),
                              Text(
                                "Utilisé",
                                style: tablestyle,
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      // EffieciencyPage(),
                      // Container(
                      //     child: Image.asset(
                      //   'assets/images/chart1.png',
                      //   height: 250.0.h,
                      // )),

                      BarChartExample()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
