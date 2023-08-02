import 'package:fluttertoast/fluttertoast.dart';

import '../../allpackages.dart';
import '../../controller/change_password_controller.dart';

class CreateNewPasswordInputFields extends StatefulWidget {
  const CreateNewPasswordInputFields({
    Key? key,
  }) : super(key: key);
  // final String? email;

  @override
  State<CreateNewPasswordInputFields> createState() =>
      _CreateNewPasswordInputFieldsState();
}

class _CreateNewPasswordInputFieldsState
    extends State<CreateNewPasswordInputFields> {
  void _togglecnewPinView() {
    setState(() {
      _isPinnewHidden = !_isPinnewHidden;
    });
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isPinnewHidden = true;

  var passwordcontroller = TextEditingController();
  bool _isPinconfirmHidden = true;

  var confirmpasswordcontroller = TextEditingController();

  void _toggleconfirmPinView() {
    setState(() {
      _isPinconfirmHidden = !_isPinconfirmHidden;
    });
  }

  ChangePaswordController changePaswordController =
      Get.put(ChangePaswordController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 23,
                right: 25,
              ),
              child: TextFormField(
                obscureText: _isPinnewHidden,
                controller: changePaswordController.password,
                style: forminputstyle,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                          color: Color(0xFFDDDCDC), width: 0.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                          const BorderSide(color: Color(0xFFDDDCDC), width: 1),
                    ),
                    hintText: 'nouveau mot de passe',
                    contentPadding: const EdgeInsets.all(0),
                    suffixIcon: InkWell(
                      onTap: _togglecnewPinView,
                      child: Icon(
                        _isPinnewHidden
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: MediaQuery.of(context).size.height * 0.03,
                        color: Color(0xff292D32),
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: appbarcolor,
                      size: 20,
                    ),
                    hintStyle: forminputstyle,
                    border: const OutlineInputBorder(
                      gapPadding: 4,
                    )),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 23,
                right: 25,
              ),
              child: TextFormField(
                scrollPhysics: AlwaysScrollableScrollPhysics(),
                obscureText: _isPinconfirmHidden,
                controller: changePaswordController.password_confirmation,
                style: forminputstyle,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                          color: Color(0xFFDDDCDC), width: 0.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                          const BorderSide(color: Color(0xFFDDDCDC), width: 1),
                    ),
                    hintText: 'Confirmer le nouveau mot de passe',
                    contentPadding: const EdgeInsets.all(0),
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: appbarcolor,
                      size: 20,
                    ),
                    suffixIcon: InkWell(
                      onTap: _toggleconfirmPinView,
                      child: Icon(
                        _isPinconfirmHidden
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: MediaQuery.of(context).size.height * 0.03,
                        color: Color(0xff292D32),
                      ),
                    ),
                    hintStyle: forminputstyle,
                    border: const OutlineInputBorder(
                      gapPadding: 4,
                    )),
              ),
            ),
            SizedBox(
              height: 108.00.h,
            ),
            ButtonIconButton(
              press: () {
                // loginController.loginController(context: context);
                if (formKey.currentState!.validate()) {
                  setState(() {
                    if (changePaswordController.password.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Veuillez entrer le mot de passe");
                    } else if (changePaswordController
                        .password_confirmation.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg:
                              'Veuillez saisir le mot de passe de confirmation');
                    } else {
                      changePaswordController.changePasswordController();
                    }
                  });
                }
              },
              bordercolor: appbarcolor,
              text: 'Valider',
            ),
          ],
        ),
      ),
    );
  }
}
