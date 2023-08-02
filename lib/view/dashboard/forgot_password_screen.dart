import 'package:fluttertoast/fluttertoast.dart';
import 'package:rewup/controller/forgot_password_controller.dart';

import '../../allpackages.dart';
import 'forgot_inputscreen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  AssetImage? images;
  // String? token;

  @override
  void initState() {
    // loginController.loginController();
    super.initState();
    images = AssetImage(
      'assets/images/forgot1.gif',
    );
  }

  @override
  void dispose() {
    //  print('${widget.asset} dispose');
    images!.evict();
    super.dispose();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                              Text('Content de te revoir',
                                  style: toptitleStyle),
                              SizedBox(height: 10.20.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      '''
Saisissez l'adresse e-mail associée \n à votre compte''',
                                      textAlign: TextAlign.center,
                                      style: formhintstylesearch,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 3.00.h),
                              ForgotInputFields(),
                              SizedBox(height: 10.00.h),
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
