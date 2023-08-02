import 'package:fluttertoast/fluttertoast.dart';

import '../../allpackages.dart';
import '../../controller/forgot_password_controller.dart';

class ForgotInputFields extends StatefulWidget {
  const ForgotInputFields({Key? key}) : super(key: key);

  @override
  State<ForgotInputFields> createState() => _ForgotInputFieldsState();
}

class _ForgotInputFieldsState extends State<ForgotInputFields> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());
  bool _isPinnewHidden = true;

  void _togglecnewPinView() {
    setState(() {
      _isPinnewHidden = !_isPinnewHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          Container(
            color: Colors.white,
            height: 40.00.h, width: 300.00.w,
            // padding: const EdgeInsets.only(
            //   left: 20,
            //   right: 20,
            // ),
            child: TextFormField(
              style: forminputstyle,
              controller: forgotPasswordController.email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(color: appcolor, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Color(0xFFC5C2C2), width: 1),
                  ),
                  fillColor: const Color(0xffC6C6C6),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: appbarcolor,
                    size: 20,
                  ),
                  hintText: "Identifiant de messagerie",
                  contentPadding: const EdgeInsets.only(left: 10),
                  //hintStyle: formhintstyle,
                  border: const OutlineInputBorder(
                    gapPadding: 4,
                  )),
            ),
          ),
          SizedBox(height: 30.00.h),
          ButtonIconButton(
            press: () {
              if (formKey.currentState!.validate()) {
                if (forgotPasswordController.email.text.isEmpty) {
                  Fluttertoast.showToast(
                      msg: 'Veuillez saisir une adresse e-mail valide');
                } else {
                  forgotPasswordController.forgotPasswordController();
                }
                // Get.to(ForgotOTPScreen());
              }
            },
            bordercolor: appbarcolor,
            text: 'ENVOYER LE MOT DE PASSE',
          ),
        ],
      ),
    );
  }
}
