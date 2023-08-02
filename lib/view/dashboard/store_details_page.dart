// ignore_for_file: unnecessary_null_comparison

import 'package:rewup/controller/getstore_controller.dart';

import '../../allpackages.dart';

class StoreDetailsPage extends StatefulWidget {
  const StoreDetailsPage({super.key});

  @override
  State<StoreDetailsPage> createState() => _StoreDetailsPageState();
}

class _StoreDetailsPageState extends State<StoreDetailsPage> {
  StoreController storeController = Get.put(StoreController());
  @override
  void initState() {
    storeController.getStoreController();
    super.initState();
  }

  bool _isPinnewHidden = false;
  bool showText = false;
  void _togglecnewPinView() {
    setState(() {
      _isPinnewHidden = !_isPinnewHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: appbarcolor,
          //  / automaticallyImplyLeading: false,
          //centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
                onTap: () {
                  Get.offAll(HomeScreen());
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
            "Détails du magasin",
            style: heading,
          )),
      body: Obx(() {
        if (storeController.isStoreLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (storeController.listData.isEmpty) {
          return Center(child: Text('AUCUNE DONNÉE DISPONIBLE'));
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 180.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Color(0xFFDFD9D9))),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Card(
                          child: Column(
                            children: [
                              Image.network(
                                storeController.listData[0].data[0].image,
                                height: 150.h,
                                width: 150.w,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
                    child: Text(
                      'nom du magasin',
                      style: alerttext,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                    child: Container(
                      height: 40.0.h,
                      width: 400.0.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          storeController.listData[0].data[0].name,
                          style: forminputstyle,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
                    child: Text(
                      'nom d\'utilisateur',
                      style: alerttext,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                    child: Container(
                      height: 40.0.h,
                      width: 400.0.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          storeController.listData[0].data[0].username,
                          style: forminputstyle,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
                    child: Text(
                      'Code',
                      style: alerttext,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                    child: Container(
                      height: 40.0.h,
                      width: 400.0.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            showText
                                ? Visibility(
                                    visible: showText,
                                    child: Text(
                                      storeController
                                          .listData[0].data[0].ranValue
                                          .toString(),
                                      style: listStyle,
                                    ))
                                : Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      '****',
                                      style: editprofilename,
                                    ),
                                  ),
                            SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  showText = !showText;
                                });
                              },
                              child: Icon(
                                  showText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  size: MediaQuery.of(context).size.height *
                                      0.025,
                                  color: formhintcolor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
                    child: Text(
                      'Statut',
                      style: alerttext,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                    child: Container(
                      height: 40.0.h,
                      width: 80.0.w,
                      decoration: BoxDecoration(
                          color: storeController.listData[0].data[0].status == 1
                              ? const Color.fromARGB(255, 104, 136, 105)
                              : Colors.red[700],
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            storeController.listData[0].data[0].status == 1
                                ? 'Active'
                                : 'InActive',
                            style: headingcolor,
                          ),
                        ),
                      ),
                    ),
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
