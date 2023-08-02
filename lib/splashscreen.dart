import 'dart:async';

import 'package:rewup/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'allpackages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      String? token;
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      token = sharedPreferences.getString(Constants.token);
      if (token != null) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            fullscreenDialog: true,
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return HomeScreen();
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                opacity:
                    animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
                child: HomeScreen(),
              );
            },
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            fullscreenDialog: true,
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return HomeScreen();
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                opacity:
                    animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
                child: const LoginScreen(),
              );
            },
          ),
        );
      }
    }

        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (BuildContext context) => const LoginScreen())
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenbackground,
      body: Image.asset(
        'assets/images/splash4.jpeg',
        height: 1000.0.h,
        width: 1000.0.w,
        fit: BoxFit.fill,
      ),
    );
  }
}
