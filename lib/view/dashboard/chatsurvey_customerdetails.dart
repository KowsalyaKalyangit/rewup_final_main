import 'package:rewup/view/dashboard/customerchatdetails.dart';

import '../../allpackages.dart';

import '../../controller/survey_customerdetails_controller.dart';

class ChatSurveyCustomerDetails extends StatefulWidget {
  const ChatSurveyCustomerDetails({super.key, this.chatid});
  final String? chatid;
  @override
  State<ChatSurveyCustomerDetails> createState() =>
      _ChatSurveyCustomerDetailsState();
}

class _ChatSurveyCustomerDetailsState extends State<ChatSurveyCustomerDetails> {
  ChatSurveyCustomerDetailsController chatSurveyCustomerDetailsController =
      Get.put(ChatSurveyCustomerDetailsController());
  @override
  void initState() {
    fun();

    super.initState();
  }

  fun() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //  var storeid = sharedPreferences.getString(Constants.storeid);
    chatSurveyCustomerDetailsController
        .getChatSurveyCustomerDetailsController(widget.chatid.toString());
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
        body: Obx(() {
          if (chatSurveyCustomerDetailsController.ischatsurveyLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (chatSurveyCustomerDetailsController
              .listData[0].data.isEmpty) {
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
                        itemCount: chatSurveyCustomerDetailsController
                            .listData[0].data.length,
                        itemBuilder: (context, index) {
                          return Container(
                              height: 80.0.h,
                              width: 500.0.w,
                              //  margin: EdgeInsets.all(5),
                              child: InkWell(
                                onTap: () {
                                  Get.to(CustomerchatDetails(
                                      customerid:
                                          chatSurveyCustomerDetailsController
                                              .listData[0].data[index].id
                                              .toString()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Card(
                                        child: ListTile(
                                      title: Text(
                                        chatSurveyCustomerDetailsController
                                                .listData[0]
                                                .data[index]
                                                .name
                                                .isEmpty
                                            ? 'kowsi'
                                            : chatSurveyCustomerDetailsController
                                                .listData[0].data[index].name
                                                .toString(),
                                        style: listStyle,
                                      ),
                                      subtitle: Text(
                                        chatSurveyCustomerDetailsController
                                                .listData[0]
                                                .data[index]
                                                .email
                                                .isEmpty
                                            ? ''
                                            : chatSurveyCustomerDetailsController
                                                .listData[0].data[index].email
                                                .toString(),
                                        style: listStyle,
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                      ),
                                      leading: CircleAvatar(
                                        backgroundColor: appbarcolor,
                                        child: Text(
                                          chatSurveyCustomerDetailsController
                                                  .listData[0]
                                                  .data[index]
                                                  .name
                                                  .isEmpty
                                              ? 'k'
                                              : chatSurveyCustomerDetailsController
                                                  .listData[0]
                                                  .data[index]
                                                  .name[0]
                                                  .toString(),
                                          style: menuprofilesection,
                                        ),
                                      ),
                                    )),
                                  ),
                                ),
                              ));
                        }),
                  ),
                ],
              ),
            );
          }
        }));
  }
}
