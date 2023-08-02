import '../allpackages.dart';
import '../view/dashboard/couponwon_page.dart';
import '../view/dashboard/report_coupon_page.dart';

class Routes {
  static final routes = [
    // GetPage(name: '/', page: () => SplashScreen()),

    GetPage(name: '/home', page: () =>   HomeScreen()),
    GetPage(name: '/couponwon', page: () => const CouponwonPage()),
      GetPage(name: '/couponreport', page: () => const ReportCouponPage()),


    
  ];
}
