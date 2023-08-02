import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rewup/controller/coupon_won_controller.dart';

import '../../utils/colors.dart';
import '../../utils/textstyles.dart';

class CouponwonPageReadMore extends StatefulWidget {
  const CouponwonPageReadMore({super.key});

  @override
  State<CouponwonPageReadMore> createState() => _CouponwonPageReadMoreState();
}

class _CouponwonPageReadMoreState extends State<CouponwonPageReadMore> {
  CouponWonController couponWonController = Get.put(CouponWonController());

  getfunc() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // var storeid = sharedPreferences.getString(Constants.storeid);
    await couponWonController.getCouponwonController();
  }

  @override
  void initState() {
    setState(() {
      getfunc();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (couponWonController.couponLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (couponWonController.listData.isEmpty) {
        return Center(
          child: Text('AUCUNE DONNÉE DISPONIBLE'),
        );
      } else {
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
                'Coupon Won',
                style: heading,
              )),
          body: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
                height: 200.0.h,
                width: 1000.0.w,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  couponWonController.listData[0].data.length,
                              itemBuilder: (context, index) {
                                var couponname =
                                    couponWonController.listData[0].data[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,

                                    //  crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: 80.0.w,
                                          child: Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: new Text(
                                                  couponname.name.toString(),
                                                  style: listtitlecolor,
                                                ),
                                              )
                                            ],
                                          )),
                                      Container(
                                          width: 50.0.w,
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
                                          width: 100.0.w,
                                          child: Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: new Text(
                                                  couponname.timeAdded
                                                      .toString(),
                                                  style: listtitlecolor,
                                                ),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        );
      }
    });
  }
}
