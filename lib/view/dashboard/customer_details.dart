import 'package:rewup/controller/customer_details_controller.dart';

import '../../allpackages.dart';
import '../../controller/dashboard_controller.dart';

class CustomerDetailsPage extends StatefulWidget {
  const CustomerDetailsPage({super.key, this.chatid, this.count});
  final String? chatid;
  final String? count;
  @override
  State<CustomerDetailsPage> createState() => _CustomerDetailsPageState();
}

class _CustomerDetailsPageState extends State<CustomerDetailsPage> {
  CustomerDetailsController customerDetailsController =
      Get.put(CustomerDetailsController());
  Dashboardcontroller dashboardcontroller = Get.put(Dashboardcontroller());

  @override
  void initState() {
    fun();

    super.initState();
  }

  fun() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // var storeid = sharedPreferences.getString(Constants.storeid);
    customerDetailsController.getCustomerDetailsController(
        fromdate: dashboardcontroller.fromdate.text,
        todate: dashboardcontroller.todate.text);
  }

  final DateTime now = DateTime.now();

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
          // actions: [
          //   Padding(
          //     padding: EdgeInsets.only(right: 15.0),
          //     child: InkWell(
          //       onTap: (() {}),
          //       child: Icon(
          //         Icons.shopping_cart,
          //         color: screenbackground,
          //         size: 22,
          //       ),
          //     ),
          //   ),
          //   Padding(
          //     padding: EdgeInsets.only(right: 15.0),
          //     child: InkWell(
          //       onTap: (() {}),
          //       child: Icon(
          //         Icons.notifications_on,
          //         color: screenbackground,
          //         size: 22,
          //       ),
          //     ),
          //   ),
          // ],
          title: Text(
            'Détails du client',
            style: heading,
          )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // widget.count.toString() == 0.toString()
            //     ? Container()
            //     : Obx(() {
            //         if (customerDetailsController.isCustomerloading.value) {
            //           return Center(
            //             child: CircularProgressIndicator(),
            //           );
            //         } else if (customerDetailsController.listData.isEmpty) {
            //           return Center(
            //             child: Text('AUCUNE DONNÉE DISPONIBLE'),
            //           );
            //         } else {
            //           return Container(
            //               height: 30.0.h,
            //               width: 500.0.w,
            //               decoration: BoxDecoration(
            //                   color: Color(0xff423592).withOpacity(0.2),
            //                   borderRadius: BorderRadius.circular(5)),
            //               child: ListView.builder(
            //                   itemCount:
            //                       customerDetailsController.listData.length,
            //                   itemBuilder: (context, index) {
            //                     return Padding(
            //                       padding: const EdgeInsets.all(8.0),
            //                       child: Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceAround,
            //                         children: [
            //                           Container(
            //                             width: 50.0.w,
            //                             child: Text(
            //                               customerDetailsController
            //                                   .listData[0].title[0].title1
            //                                   .toString(),
            //                               style: profiletext,
            //                             ),
            //                           ),
            //                           Container(
            //                             width: 80.0.w,
            //                             child: Text(
            //                               customerDetailsController
            //                                   .listData[0].title[0].title2
            //                                   .toString(),
            //                               style: profiletext,
            //                             ),
            //                           ),
            //                           Container(
            //                             width: 140.0.w,
            //                             child: Text(
            //                               customerDetailsController
            //                                   .listData[0].title[0].title3
            //                                   .toString(),
            //                               style: profiletext,
            //                             ),
            //                           ),
            //                           // SizedBox(
            //                           //   width: 10.0.w,
            //                           // )
            //                           // Container(
            //                           //   // width: 120.0.w,
            //                           //   child: Text(
            //                           //     couponController
            //                           //         .listData[0].title[index].title4
            //                           //         .toString(),
            //                           //     style: viewdetails,
            //                           //   ),
            //                           // ),
            //                         ],
            //                       ),
            //                     );
            //                   }));
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
                    if (customerDetailsController.isCustomerloading.value) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (customerDetailsController
                        .listData[0].data.isEmpty) {
                      return Center(
                        child: Text('AUCUNE DONNÉE DISPONIBLE'),
                      );
                    } else {
                      return Container(
                          height: 2000.h,
                          width: 500.w,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: customerDetailsController
                                  .listData[0].data.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    height: 70.0.h,
                                    width: 500.0.w,
                                    //  margin: EdgeInsets.all(5),
                                    child: InkWell(
                                        onTap: () {
                                          // Get.to(CustomerchatDetails(
                                          //     customerid: customerDetailsController
                                          //         .listData[0].data[index].id
                                          //         .toString()));
                                        },
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0, right: 10.0),
                                            child: Container(
                                                child: Card(
                                                    elevation: 0.5,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 10.0,
                                                                right: 10.0),
                                                        child: Row(children: [
                                                          CircleAvatar(
                                                            radius: 20,
                                                            backgroundColor:
                                                                appbarcolor,
                                                            child: Text(
                                                              customerDetailsController
                                                                              .listData[
                                                                                  0]
                                                                              .data[
                                                                                  index]
                                                                              .name ==
                                                                          '' ||
                                                                      customerDetailsController
                                                                          .listData[
                                                                              0]
                                                                          .data[
                                                                              index]
                                                                          .name
                                                                          .isEmpty
                                                                  ? '_'
                                                                  : customerDetailsController
                                                                      .listData[
                                                                          0]
                                                                      .data[
                                                                          index]
                                                                      .name[0]
                                                                      .toString(),
                                                              style:
                                                                  menuprofilesection,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 30.0.w,
                                                          ),
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    '${customerDetailsController.listData[0].title[0].title1.toString()}:',
                                                                    style:
                                                                        tablestyle,
                                                                  ),
                                                                  customerDetailsController.listData[0].data[index].name ==
                                                                              '' ||
                                                                          customerDetailsController
                                                                              .listData[0]
                                                                              .data[index]
                                                                              .name
                                                                              .isEmpty
                                                                      ? Text(
                                                                          '-',
                                                                          style:
                                                                              listStyle,
                                                                        )
                                                                      : new Text(
                                                                          dashboardcontroller.fromdate.text == '' && dashboardcontroller.todate.text == ''
                                                                              ? customerDetailsController.listData[0].data[index].name.toString()
                                                                              : customerDetailsController.listData[0].data[index].name.toString(),
                                                                          style:
                                                                              categorydetails,
                                                                        ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: <Widget>[
                                                                  Text(
                                                                    '${customerDetailsController.listData[0].title[0].title2.toString()}:',
                                                                    style:
                                                                        tablestyle,
                                                                  ),
                                                                  new Text(
                                                                      dashboardcontroller.fromdate.text == '' &&
                                                                              dashboardcontroller.todate.text ==
                                                                                  ''
                                                                          ? customerDetailsController
                                                                              .listData[
                                                                                  0]
                                                                              .data[
                                                                                  index]
                                                                              .email
                                                                              .toString()
                                                                          : customerDetailsController
                                                                              .listData[
                                                                                  0]
                                                                              .data[
                                                                                  index]
                                                                              .email
                                                                              .toString(),
                                                                      style: GoogleFonts.poppins(
                                                                          textStyle: TextStyle(
                                                                              letterSpacing: 0.2,
                                                                              fontSize: 8.00.sp,
                                                                              color: appbarcolor,
                                                                              fontWeight: FontWeight.w700))),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: <Widget>[
                                                                  Text(
                                                                    '${customerDetailsController.listData[0].title[0].title3.toString()}:',
                                                                    style:
                                                                        tablestyle,
                                                                  ),
                                                                  new Text(
                                                                      dashboardcontroller.fromdate.text == '' &&
                                                                              dashboardcontroller.todate.text ==
                                                                                  ''
                                                                          ? customerDetailsController
                                                                              .listData[
                                                                                  0]
                                                                              .data[
                                                                                  index]
                                                                              .phone
                                                                              .toString()
                                                                          : customerDetailsController
                                                                              .listData[0]
                                                                              .data[index]
                                                                              .phone
                                                                              .toString(),
                                                                      style: categorydetails),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ])))))));
                              }));
                    }
                  })
          ],
        ),
      ),
    );
  }
}
