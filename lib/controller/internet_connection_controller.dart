// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:get/get.dart';
// import 'package:rewup/allpackages.dart';

// import '../service/internet_connection_service.dart';

// class NetworkController extends GetxController {
//   final ConnectivityService connectivityService = Get.find();

//   @override
//   void onInit() {
//     super.onInit();
//     initConnectivity();
//   }

//   initConnectivity() async {
//     Connectivity result;
//     try {
//       result = await connectivityService.checkConnectivity();
//     } on PlatformException catch (e) {
//       print(e.toString());
//     }
//     return _updateConnectionStatus(result);
//   }

//   _updateConnectionStatus(ConnectivityResult result) {
//     switch (result) {}
//   }
// }
