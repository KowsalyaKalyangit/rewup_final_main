import 'package:rewup/controller/dashboard_controller.dart';
import 'package:rewup/view/profile/option_list.dart';
import 'package:rewup/view/profile/profile_section.dart';

import '../../allpackages.dart';
import '../../controller/login_controller.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  LoginController loginController = Get.put(LoginController());
  Dashboardcontroller dashboardcontroller = Get.put(Dashboardcontroller());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(HomeScreen());
        return true;
      },
      child: Scaffold(
        backgroundColor: appbarcolor,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.00.h,
              ),
              const ProfileSection(),
              SizedBox(
                height: 30.00.h,
              ),
              Container(
                width: 1000.00.w,
                height: 500.0.h,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    )),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const OptionList(),
                    const SizedBox(
                      height: 80,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.065,
                      width: MediaQuery.of(context).size.width * 0.55,
                      decoration: BoxDecoration(
                          color: appbarcolor,
                          border: Border.all(
                            color: appbarcolor,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(const LoginScreen());
                        },
                        style: ElevatedButton.styleFrom(
                          primary: appbarcolor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          textStyle: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 11.00.sp,
                                  letterSpacing: 1.5,
                                  color: screenbackground,
                                  fontWeight: FontWeight.w500)),
                        ),
                        child: InkWell(
                          onTap: () async {
                            await loginController.logout().then((value) {});
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "SE DÉCONNECTER",
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 10.00.sp,
                                        letterSpacing: 1.5,
                                        color: screenbackground,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Image.asset(
                                  'assets/images/logout.png',
                                  height: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.00.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
