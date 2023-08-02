import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../allpackages.dart';
import '../../../controller/game_template/create_gametemplate_controller.dart';
import '../../../controller/game_template/get_gametemplate_controller.dart';

class GameTemplate extends StatefulWidget {
  const GameTemplate({super.key});

  @override
  State<GameTemplate> createState() => _GameTemplateState();
}

class _GameTemplateState extends State<GameTemplate> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GetGameTemplateController getGameTemplateController =
      Get.put(GetGameTemplateController());
  CreateGameTemplateController createGameTemplateController =
      Get.put(CreateGameTemplateController());
  @override
  void initState() {
    func();
    super.initState();
  }

  func() async {
    await getGameTemplateController.getGameTemplateController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: appbarcolor,
        onPressed: () {
          //Get.to(GameTemplateCreate());
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text(
                'Modèle de jeu',
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
                              controller: createGameTemplateController.name,
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
                              controller: createGameTemplateController.content,
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
                                  hintText: "Contenu du jeu",
                                  contentPadding:
                                      const EdgeInsets.only(left: 10),
                                  hintStyle: formhintstyle,
                                  border: const OutlineInputBorder(
                                    gapPadding: 4,
                                  )),
                            ),
                          ),
                          SizedBox(height: 20.00.h),
                          ButtonIconButton(
                            press: () async {
                              print('clickk');
                              if (formKey.currentState!.validate()) {
                                print('click');
                                if (createGameTemplateController
                                    .name.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Veuillez remplir le nom");
                                } else if (createGameTemplateController
                                    .content.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: 'Veuillez remplir le contenu');
                                } else {
                                  getGameTemplateController
                                      .couponLoading(false);
                                  await createGameTemplateController
                                      .createGameTemplateController(
                                          context: context)
                                      .then((value) {
                                    createGameTemplateController.name.clear();
                                    createGameTemplateController.content
                                        .clear();
                                    getGameTemplateController
                                        .getGameTemplateController();
                                    Get.back();
                                  });
                                }
                              }
                            },
                            bordercolor: appbarcolor,
                            text: 'ENVOYER',
                          ),
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
            'Modèles de jeu',
            style: heading,
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              if (getGameTemplateController.couponLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (getGameTemplateController.listData.isEmpty) {
                return Center(
                  child: Text('AUCUNE DONNÉE DISPONIBLE'),
                );
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
                            itemCount: getGameTemplateController
                                .listData[0].data.length,
                            itemBuilder: (context, index) {
                              var couponname = getGameTemplateController
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
                                                        "Contenu du jeu",
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
                                              createGameTemplateController
                                                      .name.text =
                                                  getGameTemplateController
                                                      .listData[0]
                                                      .data[index]
                                                      .name
                                                      .toString();
                                              createGameTemplateController
                                                      .content.text =
                                                  getGameTemplateController
                                                      .listData[0]
                                                      .data[index]
                                                      .description
                                                      .toString();
                                              showDialog<String>(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        AlertDialog(
                                                  title: Text(
                                                    'Modifier le message',
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
                                                                      createGameTemplateController
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
                                                                      createGameTemplateController
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
                                                                      hintText: "Contenu du jeu",
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
                                                              ButtonIconButton(
                                                                press:
                                                                    () async {
                                                                  print(
                                                                      'clickk');
                                                                  if (formKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                    print(
                                                                        'click');
                                                                    if (createGameTemplateController
                                                                        .name
                                                                        .text
                                                                        .isEmpty) {
                                                                      Fluttertoast
                                                                          .showToast(
                                                                              msg: "Veuillez remplir le nom");
                                                                    } else if (createGameTemplateController
                                                                        .content
                                                                        .text
                                                                        .isEmpty) {
                                                                      Fluttertoast
                                                                          .showToast(
                                                                              msg: 'Veuillez remplir le contenu');
                                                                    } else {
                                                                      getGameTemplateController
                                                                          .couponLoading(
                                                                              false);
                                                                      await createGameTemplateController
                                                                          .updateGameTemplateController(
                                                                              context: context,
                                                                              storereqid: getGameTemplateController.listData[0].data[index].id.toString())
                                                                          .then((value) {
                                                                        getGameTemplateController
                                                                            .getGameTemplateController();
                                                                        Get.back();
                                                                      });
                                                                    }
                                                                  }
                                                                },
                                                                bordercolor:
                                                                    appbarcolor,
                                                                text:
                                                                    'Modifier',
                                                              ),
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
