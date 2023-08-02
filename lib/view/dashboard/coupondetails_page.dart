import 'package:rewup/controller/getcoupon_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../allpackages.dart';
import '../../utils/constants.dart';

class CouponDetailsPage extends StatefulWidget {
  const CouponDetailsPage({super.key});

  @override
  State<CouponDetailsPage> createState() => _CouponDetailsPageState();
}

class _CouponDetailsPageState extends State<CouponDetailsPage> {
  CouponController couponController = Get.put(CouponController());
  @override
  void initState() {
    fun();
    super.initState();
  }

  fun() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var storeid = sharedPreferences.getString(Constants.storeid);
    couponController.getCouponController(storeid.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: appbarcolor,
          //  / automaticallyImplyLeading: false,
          //centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: screenbackground,
                )),
          ),
          title: Text(
            'Coupons',
            style: heading,
          )),
      body: Obx(() {
        if (couponController.isCouponLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (couponController.listData[0].data.isEmpty) {
          return Center(child: Text('AUCUNE DONNÉE DISPONIBLE'));
        } else {
          return SingleChildScrollView(
            child: LayoutBuilder(builder: (context, constraints) {
              return RefreshIndicator(
                onRefresh: () async {
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  var storeid = sharedPreferences.getString(Constants.storeid);
                  couponController.getCouponController(storeid.toString());
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Obx(() {
                    //   if (couponController.isCouponLoading.value) {
                    //     return Center(
                    //       child: CircularProgressIndicator(),
                    //     );
                    //   } else if (couponController.listData.isEmpty) {
                    //     return Center(
                    //       child: Text('AUCUNE DONNÉE DISPONIBLE'),
                    //     );
                    //   } else {
                    //     return Container(
                    //         height: 30.0.h,
                    //         width: 500.0.w,
                    //         decoration: BoxDecoration(
                    //             color: Color(0xff423592).withOpacity(0.2),
                    //             borderRadius: BorderRadius.circular(5)),
                    //         child: ListView.builder(
                    //             itemCount: couponController.listData.length,
                    //             itemBuilder: (context, index) {
                    //               return Padding(
                    //                 padding: const EdgeInsets.all(8.0),
                    //                 child: Row(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.spaceAround,
                    //                   children: [
                    //                     Container(
                    //                       width: 50.0.w,
                    //                       child: Text(
                    //                         couponController
                    //                             .listData[0].title[0].title1
                    //                             .toString(),
                    //                         style: profiletext,
                    //                       ),
                    //                     ),
                    //                     Container(
                    //                       width: 50.0.w,
                    //                       child: Text(
                    //                         couponController
                    //                             .listData[0].title[index].title2
                    //                             .toString(),
                    //                         style: profiletext,
                    //                       ),
                    //                     ),
                    //                     Container(
                    //                       width: 60.0.w,
                    //                       child: Text(
                    //                         couponController
                    //                             .listData[0].title[index].title3
                    //                             .toString(),
                    //                         style: profiletext,
                    //                       ),
                    //                     ),
                    //                     SizedBox(
                    //                       width: 10.0.w,
                    //                     )
                    // Container(
                    //   // width: 120.0.w,
                    //   child: Text(
                    //     couponController
                    //         .listData[0].title[index].title4
                    //         .toString(),
                    //     style: viewdetails,
                    //   ),
                    // ),
                    //                   ],
                    //                 ),
                    //               );
                    //             }));
                    //   }
                    // }),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10),
                        child: Container(
                          height: 900.h,
                          width: 500.w,
                          child: ListView.builder(
                              itemCount:
                                  couponController.listData[0].data.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 100.0.h,
                                  width: 500.0.w,
                                  child: Card(
                                    child: Row(children: [
                                      SizedBox(
                                        width: 30,
                                      ),
                                      CircleAvatar(
                                        backgroundColor: appbarcolor,
                                        radius: 40,
                                        child: Image.network(
                                          couponController
                                              .listData[0].data[index].image,
                                          height: 25.h,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Titre:',
                                                style: tablestyle,
                                              ),
                                              Text(
                                                couponController.listData[0]
                                                    .data[index].title
                                                    .toString(),
                                                style: categorydetails,
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Code coupon:',
                                                style: tablestyle,
                                              ),
                                              Text(
                                                couponController.listData[0]
                                                    .data[index].couponCode
                                                    .toString(),
                                                style: categorydetails,
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Catégorie:',
                                                style: tablestyle,
                                              ),
                                              Text(
                                                couponController.listData[0]
                                                    .data[index].category
                                                    .toString(),
                                                style: categorydetails,
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Statut:',
                                                style: tablestyle,
                                              ),
                                              Text(
                                                couponController
                                                            .listData[0]
                                                            .data[index]
                                                            .status ==
                                                        1
                                                    ? 'Active'
                                                    : 'InActive',
                                                style: categorydetails,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            showDialog<void>(
                                                context: context,
                                                barrierDismissible:
                                                    false, // user must tap button!
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Column(
                                                      children: [
                                                        Text(
                                                          'bon de réduction',
                                                          style:
                                                              homepagecountcolor,
                                                        ),
                                                        SizedBox(
                                                          height: 15.h,
                                                        ),
                                                        SizedBox(
                                                          height: 10.h,
                                                        ),
                                                        Image.network(
                                                          couponController
                                                              .listData[0]
                                                              .data[index]
                                                              .image,
                                                          height: 150.h,
                                                        )
                                                      ],
                                                    ),
                                                    content:
                                                        SingleChildScrollView(
                                                      child: ListBody(
                                                        children: <Widget>[],
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            appbarcolor,
                                                        radius: 20,
                                                        child: TextButton(
                                                          child: Text(
                                                            'ok',
                                                            style: headingcolor,
                                                          ),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                });
                                          },
                                          icon: Icon(
                                            Icons.arrow_forward_ios_sharp,
                                            size: 15,
                                            color: Colors.grey,
                                          ))
                                    ]),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          );
        }
      }),
    );
  }
}
