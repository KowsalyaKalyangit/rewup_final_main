import 'package:rewup/controller/get_game_controller.dart';
import 'package:rewup/controller/send_game_request_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../allpackages.dart';
import '../../utils/constants.dart';
import 'game_category_details.dart';

class GameDetailsPage extends StatefulWidget {
  const GameDetailsPage({super.key});

  @override
  State<GameDetailsPage> createState() => _GameDetailsPageState();
}

class _GameDetailsPageState extends State<GameDetailsPage> {
  GameController gameController = Get.put(GameController());
  SendGameRequestController sendGameRequestController =
      Get.put(SendGameRequestController());
  @override
  void initState() {
    fun();

    super.initState();
  }

  fun() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var storeid = sharedPreferences.getString(Constants.storeid);
    gameController.getGameController(storeid.toString());
    // await sendGameRequestController.getsendgamerequest(
    //     gameid: gameController.listData[0].data[0].gameId);
  }

  showfunc() {
    return Text('kowsii');
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            title: Column(
              children: [
                Text(
                  'Demande de changement de jeux',
                  style: alerttext,
                ),
                Divider(
                  color: toptitlecolor,
                )
              ],
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Text(
                      '''Etes-vous sûre(e) de vouloir effectuer le changement de jeu ?  Si vous confirmez, le jeu selectionné deviendra actif dans un délai de 24 heures maximum''',
                      style: tablestyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 10),
                  //   child: Text(
                  //     'SI vous confirmez, le jeux sélectionné deviendra actif dans',
                  //     style: tablestyle,
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ),
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.only(left: 20.0, right: 20.0, top: 5),
                  //   child: Text(
                  //     '24 h',
                  //     style: tablestyle,
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ),
                ],
              ),
            ),
            actions: <Widget>[
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () async {
                          Get.back();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: appbarcolor,
                          ),
                          height: 30.0.h,
                          width: 100.0.w,
                          child: Center(
                              child: Text(
                            "Annuler",
                            style: headingcolor,
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await sendGameRequestController
                              .getsendgamerequest(
                                  gameid:
                                      gameController.listData[0].data[0].gameId)
                              .then((value) {
                            const snackdemo = SnackBar(
                              content: Center(
                                child: Text('Demande envoyée'),
                              ),
                              backgroundColor: appbarcolor,
                              elevation: 10,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(5),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackdemo);
                          });
                          Get.back();
                        },
                        child: Container(
                          height: 30.0.h,
                          width: 100.0.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: appbarcolor,
                          ),
                          child: Center(
                              child: Text(
                            "CONFIRMER",
                            style: headingcolor,
                          )),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              )
            ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    Get.offAll(HomeScreen());
                  },
                  child: Icon(Icons.arrow_back))),
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
            'Jeux',
            style: heading,
          )),
      body: Obx(() {
        if (gameController.isgameLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (gameController.listData[0].data.isEmpty ||
            gameController.listData.isEmpty) {
          return Center(child: Text('AUCUNE DONNÉE DISPONIBLE'));
        } else {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Obx(() {
                //   if (sendGameRequestController.couponLoading.value) {
                //     return Container(
                //       height: 1,
                //       child: Text(''),
                //     );
                //   } else if (sendGameRequestController.listData.isEmpty) {
                //     return Center(
                //       child: Text('No Data Found'),
                //     );
                //   } else {
                //     return Padding(
                //       padding:
                //           const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                //       child: Text(
                //         sendGameRequestController.listData[0].data[0].status
                //             .toString(),
                //         style: alerttext,
                //         textAlign: TextAlign.center,
                //       ),
                //     );
                //   }
                // }),
                gameController.listData[0].data.length > 1 ||
                        gameController.listData[0].data[0].status != 'Active'
                    ? Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 10),
                        child: Text(
                          gameController.listData[0].gamemessage.toString(),
                          style: alerttext,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Container(
                    height: 900.h,
                    width: 500.w,
                    child: RefreshIndicator(
                      onRefresh: () async {
                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        var storeid =
                            sharedPreferences.getString(Constants.storeid);
                        gameController.getGameController(storeid.toString());
                      },
                      child: ListView.builder(
                          itemCount: gameController.listData[0].data.length,
                          itemBuilder: (context, index) {
                            // var gamedata = gameController.listData[0].data[index];
                            return Container(
                                height: 120.0.h,
                                width: 500.0.w,
                                //  margin: EdgeInsets.all(5),
                                child: InkWell(
                                  onTap: () {
                                    // Get.to(GameCategoriesDetails(
                                    //     index: index,
                                    //     id: gamedata.id.toString()));
                                    setState(() {
                                      gameController.listData[0].data[index]
                                                  .status ==
                                              'Active'
                                          ? showfunc()
                                          : _showMyDialog();
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Card(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Image.network(
                                                      gameController
                                                          .listData[0]
                                                          .data[index]
                                                          .welcomeimage
                                                          .toString(),
                                                      height: 50.0.h,
                                                      width: 50.0.w,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Jeu:',
                                                            style:
                                                                listStyleappcolor,
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Container(
                                                            width: 100.0.w,
                                                            child: Text(
                                                              gameController
                                                                  .listData[0]
                                                                  .data[index]
                                                                  .game,
                                                              style: listStyle,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Magasin:',
                                                            style:
                                                                listStyleappcolor,
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Container(
                                                              width: 130.w,
                                                              child: Row(
                                                                children: <Widget>[
                                                                  Flexible(
                                                                      child:
                                                                          new Text(
                                                                    gameController
                                                                        .listData[
                                                                            0]
                                                                        .data[
                                                                            index]
                                                                        .store,
                                                                    style:
                                                                        listStyle,
                                                                  ))
                                                                ],
                                                              )),
                                                          Icon(
                                                            Icons
                                                                .arrow_right_outlined,
                                                            color: Colors.grey,
                                                          )
                                                        ],
                                                      ),

                                                      // Row(
                                                      //   children: [
                                                      //     Text(
                                                      //       'Redirect_url:',
                                                      //       style:
                                                      //           listStyleappcolor,
                                                      //     ),
                                                      //     SizedBox(
                                                      //       width: 5,
                                                      //     ),
                                                      //   ],
                                                      // ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          print('kowsi');
                                                        },
                                                        child: Container(
                                                            height: 20.0.h,
                                                            width: 60.0.w,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: gameController
                                                                            .listData[
                                                                                0]
                                                                            .data[
                                                                                index]
                                                                            .status ==
                                                                        'Active'
                                                                    ? appbarcolor
                                                                    : Colors.red[
                                                                        700]),
                                                            child: Center(
                                                              child: Text(
                                                                gameController
                                                                    .listData[0]
                                                                    .data[index]
                                                                    .status
                                                                    .toString(),
                                                                style:
                                                                    viewdetails,
                                                              ),
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ));
                          }),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
