import 'dart:developer';

import 'package:flutter_localization/flutter_localization.dart';
import 'package:rewup/service/internet_connection_service.dart';
import 'package:rewup/splashscreen.dart';
import 'package:rewup/utils/constants.dart';
import 'package:rewup/utils/routes.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'allpackages.dart';

Future main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final ConnectivityService connectivityService = ConnectivityService();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await checkLogin();

  runApp(MyApp());
}

String? token;
checkLogin() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  token = sharedPreferences.getString(Constants.token);
  log('tokeen');
  log(token.toString());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, this.connectivityService}) : super(key: key);
  ConnectivityService? connectivityService;
  final FlutterLocalization localization = FlutterLocalization.instance;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => FocusableActionDetector(
        child: Shortcuts(
            shortcuts: <LogicalKeySet, Intent>{
              LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
            },
            child: GetMaterialApp(
                supportedLocales: [
                  //  const Locale('en'),
                     const Locale('fr')
                ],
                localizationsDelegates: localization.localizationsDelegates,
                getPages: Routes.routes,
                debugShowCheckedModeBanner: false,
                home: SplashScreen())),
      ),
    );
  }
}
