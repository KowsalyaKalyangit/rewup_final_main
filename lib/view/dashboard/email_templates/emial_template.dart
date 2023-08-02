import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rewup/controller/email_template/create_emailtemplate_controller.dart';
import 'package:rewup/controller/email_template/get_emailtemplate_controller.dart';

import '../../../allpackages.dart';
import 'game_template.dart';

class EmailTemplate extends StatefulWidget {
  const EmailTemplate({super.key});

  @override
  State<EmailTemplate> createState() => _EmailTemplateState();
}

class _EmailTemplateState extends State<EmailTemplate> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GetEmailTemplateController getEmailTemplateController =
      Get.put(GetEmailTemplateController());
  CreateEmailTemplateController createEmailTemplateController =
      Get.put(CreateEmailTemplateController());
  @override
  void initState() {
    func();
    super.initState();
  }

  func() async {
    await getEmailTemplateController.getEmailTemplateController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: appbarcolor,
        onPressed: () {
          //Get.to(EmailTemplateCreate());
          showDialog<String>(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text(
                'Ecrire un message',
                style: homepagecountcolor,
              ),
              actions: [
                Column(
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            height: 50.00.h, width: 300.00.w,
                            // padding: const EdgeInsets.only(
                            //   left: 20,
                            //   right: 20,
                            // ),
                            child: TextFormField(
                              controller: createEmailTemplateController.name,
                              style: forminputstyle,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                        color: appcolor, width: 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                        color: const Color(0xffC6C6C6)
                                            .withOpacity(0.5),
                                        width: 1),
                                  ),
                                  fillColor: const Color(0xffC6C6C6),
                                  hintText: 'Objet',
                                  contentPadding:
                                      const EdgeInsets.only(left: 10),
                                  hintStyle: formhintstyle,
                                  border: const OutlineInputBorder(
                                    gapPadding: 4,
                                  )),
                            ),
                          ),
                          SizedBox(height: 3.00.h),
                          Container(
                            color: Colors.white,
                            height: 100.00.h, width: 300.00.w,
                            // padding: const EdgeInsets.only(
                            //   left: 20,
                            //   right: 20,
                            // ),
                            child: TextFormField(
                              controller: createEmailTemplateController.content,
                              style: forminputstyle,
                              maxLines: 20,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                        color: appcolor, width: 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                        color: const Color(0xffC6C6C6)
                                            .withOpacity(0.5),
                                        width: 1),
                                  ),
                                  fillColor: const Color(0xffC6C6C6),
                                  hintText: "votre message",
                                  contentPadding:
                                      const EdgeInsets.only(left: 10),
                                  hintStyle: formhintstyle,
                                  border: const OutlineInputBorder(
                                    gapPadding: 4,
                                  )),
                            ),
                          ),
                          SizedBox(height: 20.00.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () async {
                                  print('clickk');
                                  if (formKey.currentState!.validate()) {
                                    print('click');

                                    Get.back();
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: appbarcolor,
                                  ),
                                  height: 30.0.h,
                                  width: 70.0.w,
                                  child: Center(
                                      child: Text(
                                    "Annuler",
                                    style: headingcolor,
                                  )),
                                ),
                                // bordercolor: appbarcolor,
                                // text: "ENVOYER",
                              ),
                              InkWell(
                                onTap: () async {
                                  print('clickk');
                                  if (formKey.currentState!.validate()) {
                                    print('click');
                                    if (createEmailTemplateController
                                        .name.text.isEmpty) {
                                      Fluttertoast.showToast(
                                          msg: 'veuillez remplir le nom');
                                    } else if (createEmailTemplateController
                                        .content.text.isEmpty) {
                                      Fluttertoast.showToast(
                                          msg: 'veuillez remplir le contenu');
                                    } else {
                                      getEmailTemplateController
                                          .couponLoading(false);
                                      await createEmailTemplateController
                                          .createEmailTemplateController(
                                              context: context)
                                          .then((value) {
                                        setState(() {
                                          createEmailTemplateController
                                              .name.text = '';
                                          createEmailTemplateController
                                              .content.text = '';
                                        });
                                        getEmailTemplateController
                                            .getEmailTemplateController();
                                        Get.back();
                                      });
                                    }
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: appbarcolor,
                                  ),
                                  height: 30.0.h,
                                  width: 70.0.w,
                                  child: Center(
                                      child: Text(
                                    "ENVOYER",
                                    style: headingcolor,
                                  )),
                                ),
                                // bordercolor: appbarcolor,
                                // text: "ENVOYER",
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
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
            "Nous contacter",
            style: heading,
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              if (getEmailTemplateController.couponLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (getEmailTemplateController.listData[0].data.isEmpty) {
                return Container(
                    height: 500.0.h,
                    width: 500.w,
                    child: Center(child: Text('AUCUNE DONNÉE DISPONIBLE')));
              } else {
                return SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      // Container(
                      //   height: 40.0.h,
                      //   width: 500.w,
                      //   decoration: BoxDecoration(
                      //       color: Color(0xff423592).withOpacity(0.2),
                      //       borderRadius: BorderRadius.circular(5)),
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         width: 110.0.w,
                      //         child: Center(
                      //           child: Text(
                      //             'SN.No',
                      //             style: tablestyle,
                      //           ),
                      //         ),
                      //       ),
                      //       Container(
                      //         width: 120.0.w,
                      //         child: Center(
                      //           child: Text(
                      //             'Name',
                      //             style: tablestyle,
                      //           ),
                      //         ),
                      //       ),
                      //       Container(
                      //         width: 130.0.w,
                      //         child: Center(
                      //           child: Text(
                      //             'Edit',
                      //             style: tablestyle,
                      //           ),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      Container(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: getEmailTemplateController
                                .listData[0].data.length,
                            itemBuilder: (context, index) {
                              var couponname = getEmailTemplateController
                                  .listData[0].data[index];
                              return Container(
                                  height: 70.0.h,
                                  width: 500.w,
                                  child: Card(
                                      child: ListTile(
                                          minLeadingWidth: 50.0.w,
                                          leading: CircleAvatar(
                                            backgroundColor: appbarcolor,
                                            child: Text(
                                              couponname.slNo.toString(),
                                              style: buttontext,
                                            ),
                                          ),
                                          title: Text(
                                            couponname.name.toString(),
                                            style: tablestyle,
                                          ),
                                          subtitle: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                couponname.description
                                                    .toString(),
                                                style: formhintstyle,
                                                maxLines: 2,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (ctx) =>
                                                        AlertDialog(
                                                      titlePadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 14,
                                                              vertical: 10),
                                                      contentPadding:
                                                          EdgeInsets.all(0),
                                                      title: Text(
                                                        "votre message",
                                                        style: homepagecount,
                                                      ),
                                                      // content: const Text(
                                                      //     "You have raised a Alert Dialog Box"),
                                                      actions: <Widget>[
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            left: 14,
                                                            right: 14,
                                                          ),
                                                          child: Text(
                                                            couponname
                                                                .description
                                                                .toString(),
                                                            style: tablestyle,
                                                          ),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(ctx)
                                                                .pop();
                                                          },
                                                          child: Container(
                                                            height: 30.0.h,
                                                            width: 60.0.w,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color:
                                                                    appbarcolor),
                                                            child: Center(
                                                              child: Text(
                                                                "D'accord",
                                                                style:
                                                                    buttontext,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  "En savoir plus",
                                                  style: orderdetailsblue,
                                                ),
                                              )
                                            ],
                                          ),
                                          trailing: InkWell(
                                            onTap: () {
                                              createEmailTemplateController
                                                      .name.text =
                                                  getEmailTemplateController
                                                      .listData[0]
                                                      .data[index]
                                                      .name
                                                      .toString();
                                              createEmailTemplateController
                                                      .content.text =
                                                  getEmailTemplateController
                                                      .listData[0]
                                                      .data[index]
                                                      .description
                                                      .toString();
                                              showDialog<String>(
                                                barrierDismissible: false,
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        AlertDialog(
                                                  title: Text(
                                                    "Modifier le message",
                                                    style: homepagecountcolor,
                                                  ),
                                                  actions: [
                                                    Column(
                                                      children: [
                                                        Form(
                                                          key: formKey,
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                color: Colors
                                                                    .white,
                                                                height: 50.00.h,
                                                                width: 300.00.w,
                                                                // padding: const EdgeInsets.only(
                                                                //   left: 20,
                                                                //   right: 20,
                                                                // ),
                                                                child:
                                                                    TextFormField(
                                                                  controller:
                                                                      createEmailTemplateController
                                                                          .name,
                                                                  style:
                                                                      forminputstyle,
                                                                  decoration: InputDecoration(
                                                                      focusedBorder: OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5.0),
                                                                        borderSide: const BorderSide(
                                                                            color:
                                                                                appcolor,
                                                                            width:
                                                                                1),
                                                                      ),
                                                                      enabledBorder: OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5.0),
                                                                        borderSide: BorderSide(
                                                                            color:
                                                                                const Color(0xffC6C6C6).withOpacity(0.5),
                                                                            width: 1),
                                                                      ),
                                                                      fillColor: const Color(0xffC6C6C6),
                                                                      hintText: 'Objet',
                                                                      contentPadding: const EdgeInsets.only(left: 10),
                                                                      hintStyle: formhintstyle,
                                                                      border: const OutlineInputBorder(
                                                                        gapPadding:
                                                                            4,
                                                                      )),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height:
                                                                      3.00.h),
                                                              Container(
                                                                color: Colors
                                                                    .white,
                                                                height:
                                                                    100.00.h,
                                                                width: 300.00.w,
                                                                // padding: const EdgeInsets.only(
                                                                //   left: 20,
                                                                //   right: 20,
                                                                // ),
                                                                child:
                                                                    TextFormField(
                                                                  controller:
                                                                      createEmailTemplateController
                                                                          .content,
                                                                  maxLines: 20,
                                                                  style:
                                                                      forminputstyle,
                                                                  decoration: InputDecoration(
                                                                      focusedBorder: OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5.0),
                                                                        borderSide: const BorderSide(
                                                                            color:
                                                                                appcolor,
                                                                            width:
                                                                                1),
                                                                      ),
                                                                      enabledBorder: OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5.0),
                                                                        borderSide: BorderSide(
                                                                            color:
                                                                                const Color(0xffC6C6C6).withOpacity(0.5),
                                                                            width: 1),
                                                                      ),
                                                                      fillColor: const Color(0xffC6C6C6),
                                                                      hintText: "Modifier le contenu",
                                                                      contentPadding: const EdgeInsets.only(left: 10),
                                                                      hintStyle: formhintstyle,
                                                                      border: const OutlineInputBorder(
                                                                        gapPadding:
                                                                            4,
                                                                      )),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height:
                                                                      20.00.h),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      print(
                                                                          'clickk');

                                                                      getEmailTemplateController
                                                                          .getEmailTemplateController()
                                                                          .then(
                                                                              (value) {
                                                                        createEmailTemplateController
                                                                            .name
                                                                            .text = '';
                                                                        createEmailTemplateController
                                                                            .content
                                                                            .text = '';
                                                                        Get.back();
                                                                      });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                        color:
                                                                            appbarcolor,
                                                                      ),
                                                                      height:
                                                                          30.0.h,
                                                                      width:
                                                                          70.0.w,
                                                                      child: Center(
                                                                          child: Text(
                                                                        "Annuler",
                                                                        style:
                                                                            headingcolor,
                                                                      )),
                                                                    ),
                                                                    // bordercolor:
                                                                    //     appbarcolor,
                                                                    // text:
                                                                    //     "Modifier",
                                                                  ),
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      print(
                                                                          'clickk');
                                                                      if (formKey
                                                                          .currentState!
                                                                          .validate()) {
                                                                        print(
                                                                            'click');
                                                                        if (createEmailTemplateController
                                                                            .name
                                                                            .text
                                                                            .isEmpty) {
                                                                          Fluttertoast.showToast(
                                                                              msg: 'pls fill name');
                                                                        } else if (createEmailTemplateController
                                                                            .content
                                                                            .text
                                                                            .isEmpty) {
                                                                          Fluttertoast.showToast(
                                                                              msg: 'pls fill content');
                                                                        } else {
                                                                          getEmailTemplateController
                                                                              .couponLoading(false);
                                                                          await createEmailTemplateController
                                                                              .updateEmailTemplateController(context: context, templateid: getEmailTemplateController.listData[0].data[index].id.toString())
                                                                              .then((value) {
                                                                            getEmailTemplateController.getEmailTemplateController();

                                                                            Get.back();
                                                                          });
                                                                        }
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                        color:
                                                                            appbarcolor,
                                                                      ),
                                                                      height:
                                                                          30.0.h,
                                                                      width:
                                                                          70.0.w,
                                                                      child: Center(
                                                                          child: Text(
                                                                        "Modifier",
                                                                        style:
                                                                            headingcolor,
                                                                      )),
                                                                    ),
                                                                    // bordercolor:
                                                                    //     appbarcolor,
                                                                    // text:
                                                                    //     "Modifier",
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                            child: Container(
                                              width: 20.0.w,
                                              height: 15.0.h,
                                              child: Image.asset(
                                                'assets/images/edit1.png',
                                                height: 15,
                                                width: 10.0.w,
                                                fit: BoxFit.contain,
                                                color: appbarcolor,
                                              ),
                                            ),
                                          ))));
                            }),
                      )
                    ]));
              }
            }),
          ],
        ),
      ),
    );
  }
}
