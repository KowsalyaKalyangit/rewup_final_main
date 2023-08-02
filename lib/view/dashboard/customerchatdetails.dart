import '../../allpackages.dart';

import '../../controller/customerchatdetails_controller.dart';

import '../../utils/faq_fun.dart';

class CustomerchatDetails extends StatefulWidget {
  const CustomerchatDetails({super.key, this.customerid});
  final String? customerid;
  @override
  State<CustomerchatDetails> createState() => _CustomerchatDetailsState();
}

class _CustomerchatDetailsState extends State<CustomerchatDetails> {
  CustomerChatDetailsController CustomerchatDetailsController =
      Get.put(CustomerChatDetailsController());
  @override
  void initState() {
    print('customer*************');
    print(widget.customerid.toString());
    fun();

    super.initState();
  }

  fun() async {
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //var storeid = sharedPreferences.getString(Constants.storeid);
    CustomerchatDetailsController.getCustomerChatDetailsController(
        widget.customerid.toString());
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
              'Détails du chat client',
              style: heading,
            )),
        body: Obx(() {
          if (CustomerchatDetailsController.ischatsurveyLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (CustomerchatDetailsController.listData[0].data.isEmpty) {
            return Center(child: Text('AUCUNE DONNÉE DISPONIBLE'));
          } else {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 1000.h,
                    width: 500.w,
                    child: ListView.builder(
                        itemCount: CustomerchatDetailsController
                            .listData[0].data.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: FAQ(
                                    question: CustomerchatDetailsController
                                        .listData[0].data[index].question
                                        .toString(),
                                    answer: CustomerchatDetailsController
                                        .listData[0].data[index].answers
                                        .toString(),
                                    ansStyle: listStyle,
                                    queStyle: listStyleappcolor),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            );
          }
        }));
  }
}
