import 'package:flutter/cupertino.dart';
import 'package:rewup/allpackages.dart';
import 'package:rewup/controller/game_review_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/game_image_controller.dart';
import '../../controller/get_game_controller.dart';
import '../../utils/constants.dart';

class GameCategoriesDetails extends StatefulWidget {
  GameCategoriesDetails({super.key, required this.index, this.id});
  int index;
  String? id;

  @override
  State<GameCategoriesDetails> createState() => _GameCategoriesDetailsState();
}

class _GameCategoriesDetailsState extends State<GameCategoriesDetails> {
  List<Color> color = [Colors.blue, Colors.red, Colors.green];
  var selectedindex = 0;
  var selectedreviewindex;
  var name;
  var textindex = 0;
  var colorindex = 0;

  GameImageController gameimageController = Get.put(GameImageController());
  GameController gameController = Get.put(GameController());
  GameReviewController gameReviewController = Get.put(GameReviewController());
  @override
  void initState() {
    fun();

    super.initState();
  }

  fun() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var storeid = sharedPreferences.getString(Constants.storeid);
    gameController.getGameController(storeid);
    gameimageController.getGameController(widget.id.toString());
    gameReviewController.gamereviewController(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (gameimageController.isgameimageLoading.value ||
          gameController.isgameLoading.value ||
          gameReviewController.isgamereviewLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else if (gameimageController.listData.isEmpty ||
          gameController.listData.isEmpty ||
          gameReviewController.listData.isEmpty) {
        return Center(
          child: Text('AUCUNE DONNÉE DISPONIBLE'),
        );
      } else {
        return Scaffold(
            body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 350.0.h,
                      width: 400.0.w,
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        height: 300.0.h,
                        width: 400.0.w,
                        child: gameimageController.imageUrls[textindex] == ''
                            ? Image.network(gameimageController
                                .listData[0].data[0].welcomeimage)
                            : Image.network(
                                gameimageController.imageUrls[textindex]
                                    .toString(),
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10.0.w,
                      right: 10.0.w,
                      child: Container(
                        height: 80.h,
                        width: 1000.w,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: gameimageController.imageUrls.length,
                            itemBuilder: ((context, index) {
                              return InkWell(
                                onTap: (() {
                                  setState(() {
                                    // print(gameimageController
                                    //     .imageUrls[index].length);
                                    colorindex = index;
                                    textindex = index;

                                    print(colorindex.toString());
                                  });
                                }),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Container(
                                    width: 80.00.w,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                gameimageController
                                                    .imageUrls[index]
                                                    .toString())),
                                        // color: colors[index],
                                        shape: BoxShape.rectangle),
                                  ),
                                ),
                              );
                            })),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 10, right: 20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "QR Code :",
                            style: listStyleappcolor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              print(gameController
                                  .listData[0].data[widget.index].qrcode);
                              showDialog<void>(
                                  context: context,
                                  barrierDismissible:
                                      false, // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Qr Code'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: <Widget>[
                                            Image.network(gameController
                                                .listData[0]
                                                .data[widget.index]
                                                .qrcode)
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        Container(
                                          height: 30.0.h,
                                          width: 50.0.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border:
                                                  Border.all(color: appcolor)),
                                          child: TextButton(
                                            child: Text(
                                              'Ok',
                                              style: listStyleappcolor,
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Image.network(
                              gameController
                                  .listData[0].data[widget.index].qrcode,
                              height: 20,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 30.0.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Coupon:',
                              style: listStyleappcolor,
                            ),
                            SizedBox(
                              width: 250.0.w,
                              child: Text(
                                  gameController
                                      .listData[0].data[widget.index].coupon
                                      .toString(),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                          letterSpacing: 0.2,
                                          fontSize: 10.00.sp,
                                          color: Colors.green[900],
                                          fontWeight: FontWeight.w700))),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 500.0.h,
                        width: 500,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                gameReviewController.listData[0].data.length,
                            itemBuilder: (context, index1) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedreviewindex = index1;
                                      });
                                    },
                                    child: Container(
                                      height: 40.0.h,
                                      child: Card(
                                        color: selectedreviewindex == index1
                                            ? Color(0xff263238)
                                            : screenbackground,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                gameReviewController.listData[0]
                                                    .data[index1].name,
                                                style: selectedreviewindex ==
                                                        index1
                                                    ? menuprofilesection
                                                    : categorytext,
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_drop_down,
                                              color:
                                                  selectedreviewindex == index1
                                                      ? screenbackground
                                                      : appbarcolor,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  selectedreviewindex == index1
                                      ? Container(
                                          height: 80.0.h,
                                          width: 310.0.w,
                                          color: Color.fromARGB(
                                              255, 240, 238, 238),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                    gameReviewController
                                                        .listData[0]
                                                        .data[index1]
                                                        .img,
                                                    height: 70.0.h,
                                                    width: 100.0.w,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    gameReviewController
                                                        .listData[0]
                                                        .data[index1]
                                                        .value,
                                                    style: listtitle,
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  SizedBox(
                                                    width: 190.0.w,
                                                    child: Text(
                                                        gameReviewController
                                                            .listData[0]
                                                            .data[index1]
                                                            .url,
                                                        style: GoogleFonts.poppins(
                                                            textStyle: TextStyle(
                                                                fontSize:
                                                                    10.00.sp,
                                                                color:
                                                                    Colors.blue,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400))),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      : Container()
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ]),
        ));
      }
    });
  }
}
