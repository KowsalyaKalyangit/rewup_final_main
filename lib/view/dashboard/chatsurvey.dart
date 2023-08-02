import 'package:rewup/view/dashboard/chatsurvey_customerdetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../allpackages.dart';
import '../../controller/chatsurvey_controller.dart';
import '../../utils/constants.dart';
import 'package:intl/intl.dart';

class ChatSurvey extends StatefulWidget {
  const ChatSurvey({super.key});

  @override
  State<ChatSurvey> createState() => _ChatSurveyState();
}

class _ChatSurveyState extends State<ChatSurvey> {
  ChatSurveyController chatSurveyController = Get.put(ChatSurveyController());
  int? snumber = 1;
  @override
  void initState() {
    fun();

    super.initState();
  }

  fun() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var storeid = sharedPreferences.getString(Constants.storeid);
    chatSurveyController.getChatSurveyController(storeid.toString());
  }

  final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (chatSurveyController.ischatsurveyLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (chatSurveyController.listData.isEmpty) {
          return Center(child: Text('AUCUNE DONNÉE DISPONIBLE'));
        } else {
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
                  'Sondage par chat',
                  style: heading,
                )),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  //   children: [
                  //     Container(
                  //       padding:
                  //           EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                  //       height: 60.0.h,
                  //       width: 250.0.w,
                  //       child: GestureDetector(
                  //         child: TextFormField(
                  //           style: listStyle,
                  //           decoration: InputDecoration(
                  //               prefixIcon: const Icon(
                  //                 Icons.search,
                  //                 color: appcolor,
                  //               ),
                  //               suffixIcon: const Icon(
                  //                 Icons.mic,
                  //                 color: appcolor,
                  //               ),
                  //               focusedBorder: OutlineInputBorder(
                  //                 borderRadius: BorderRadius.circular(5.0),
                  //                 borderSide: const BorderSide(
                  //                     color: appcolor, width: 1),
                  //               ),
                  //               enabledBorder: OutlineInputBorder(
                  //                 borderRadius: BorderRadius.circular(5.0),
                  //                 borderSide: const BorderSide(
                  //                     color: formhintcolor, width: 1),
                  //               ),
                  //               fillColor: const Color(0xffC6C6C6),
                  //               hintText: 'Search your products',
                  //               contentPadding: const EdgeInsets.only(left: 10),
                  //               hintStyle: formhintstylesearch,
                  //               border: const OutlineInputBorder(
                  //                 gapPadding: 4,
                  //               )),
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       height: 50.0.h,
                  //       width: 100.0.w,
                  //       child: Card(
                  //         child: ListTile(
                  //           title: const Icon(Icons.filter_alt_outlined),
                  //           trailing: Text(
                  //             'Filter',
                  //             style: listStyle,
                  //           ),
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // ),
                  Container(
                    height: 900.h,
                    width: 500.w,
                    child: ListView.builder(
                        itemCount: chatSurveyController.listData[0].data.length,
                        itemBuilder: (context, index) {
                          return Container(
                              height: 80.0.h,
                              width: 500.0.w,
                              //  margin: EdgeInsets.all(5),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    snumber = index + 1;
                                  });
                                  print('printtt');
                                  Get.to(ChatSurveyCustomerDetails(
                                      chatid: chatSurveyController
                                          .listData[0].data[index].id
                                          .toString()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Card(
                                        child: ListTile(
                                      title: Text(
                                        chatSurveyController
                                            .listData[0].data[index].title
                                            .toString(),
                                        style: listStyle,
                                      ),
                                      subtitle: Text(
                                        chatSurveyController
                                            .listData[0].data[index].description
                                            .toString(),
                                        style: listStyle,
                                      ),
                                      trailing: Text(
                                        DateFormat.yMMMMd().format(
                                            chatSurveyController.listData[0]
                                                .data[index].startDate),
                                        style: formhintstylesearch,
                                      ),
                                      leading: CircleAvatar(
                                        backgroundColor: appbarcolor,
                                        child: Text(snumber.toString()),
                                      ),
                                    )),
                                  ),
                                ),
                              ));
                        }),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
