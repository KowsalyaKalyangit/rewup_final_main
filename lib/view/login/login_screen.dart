import '../../allpackages.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AssetImage? images;
  // String? token;

  @override
  void initState() {
    // loginController.loginController();
    super.initState();
    images = AssetImage(
      "assets/images/login2.gif",
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: appbarcolor,
          body: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
                color: appbarcolor,
              ),
              DraggableScrollableSheet(
                builder: (BuildContext buildContext,
                    ScrollController scrollController) {
                  return Material(
                      elevation: 5,
                      shadowColor: Colors.black,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30.0),
                              topLeft: Radius.circular(30.0),
                            ),
                            color: Colors.white),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            children: [
                              Container(
                                height: 250.00.h,
                                width: 600.00.w,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: images!)),
                              ),
                              //  SizedBox(height: 4.00.hp),
                              Text("Content de te revoir",
                                  style: toptitleStyle),
                              SizedBox(height: 00.30.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      'Connectez-vous pour explorer continue',
                                      style: toptitleStyle,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 3.00.h),
                              const LoginInputFields(),
                              SizedBox(height: 10.00.h),

                              GestureDetector(
                                onTap: () {
                                  // Get.to(SignupScreen());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Vous n'avez pas de compte ?",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 10.00.sp,
                                              color: const Color(0xff373737),
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    Text(
                                      'Créer maintenant',
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 9.00.sp,
                                              color: appbarcolor,
                                              fontWeight: FontWeight.w600)),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 1.00.h),
                            ],
                          ),
                        ),
                      ));
                },
                // minChildSize<=initialChildSize
                // initial size of the sheet when app is opened.
                // default value 0.5
                initialChildSize: .9, //will take 30% of screen space
                //minimum size to which sheet can be dropped down.
                // default value .25
                minChildSize: .85,

                //max size to which  sheet can be dragged up
                //default value 1.0
                maxChildSize: 0.95,
              ),
            ],
          )),
    );
  }
}
