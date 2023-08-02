import '../../allpackages.dart';
import '../../controller/login_controller.dart';
import '../dashboard/forgot_password_screen.dart';

class LoginInputFields extends StatefulWidget {
  const LoginInputFields({Key? key}) : super(key: key);

  @override
  State<LoginInputFields> createState() => _LoginInputFieldsState();
}

class _LoginInputFieldsState extends State<LoginInputFields> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginController loginController = Get.put(LoginController());
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
          Container(
            color: Colors.white,
            height: 50.00.h, width: 300.00.w,
            // padding: const EdgeInsets.only(
            //   left: 20,
            //   right: 20,
            // ),
            child: TextFormField(
              controller: loginController.email,
              style: forminputstyle,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(color: appcolor, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                        color: const Color(0xffC6C6C6).withOpacity(0.5),
                        width: 1),
                  ),
                  fillColor: const Color(0xffC6C6C6),
                  hintText: 'e-mail',
                  contentPadding: const EdgeInsets.only(left: 10),
                  hintStyle: formhintstyle,
                  border: const OutlineInputBorder(
                    gapPadding: 4,
                  )),
            ),
          ),
          SizedBox(height: 3.00.h),
          Container(
            color: Colors.white,
            height: 50.00.h, width: 300.00.w,
            // padding: const EdgeInsets.only(
            //   left: 20,
            //   right: 20,
            // ),
            child: TextFormField(
              controller: loginController.password,
              obscureText: _isPinnewHidden,
              style: forminputstyle,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(color: appcolor, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                        color: const Color(0xffC6C6C6).withOpacity(0.5),
                        width: 1),
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      _togglecnewPinView();
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 5, bottom: 15),
                      child: Icon(
                        _isPinnewHidden
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: MediaQuery.of(context).size.height * 0.025,
                        color: const Color(0xffC6C6C6),
                      ),
                    ),
                  ),
                  fillColor: const Color(0xffC6C6C6),
                  hintText: "Mot de passe",
                  contentPadding: const EdgeInsets.only(left: 10),
                  hintStyle: formhintstyle,
                  border: const OutlineInputBorder(
                    gapPadding: 4,
                  )),
            ),
          ),
          SizedBox(height: 5.00.h),
          InkWell(
            onTap: () {
              Get.to(const ForgotPassword());
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Mot de passe oublié?',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 9.00.sp,
                            color: appbarcolor,
                            fontWeight: FontWeight.w600)),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20.00.h),
          ButtonIconButton(
            press: () async {
              print('clickk');
              if (formKey.currentState!.validate()) {
                print('click');

                await loginController.loginController(context: context);
              }
            },
            bordercolor: appbarcolor,
            text: 'CONNEXION',
          ),
        ],
      ),
    );
  }
}
