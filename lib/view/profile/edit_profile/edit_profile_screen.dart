import 'package:rewup/view/profile/edit_profile/profile_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../allpackages.dart';
import '../../../controller/profile_controller.dart';
import '../../../utils/constants.dart';
import 'detail_section.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ProfileController profileController = Get.put(ProfileController());
  // ignore: prefer_final_fields

  var items = [
    'TamilNadu',
    'Assam',
    'Bihar',
    'Andhra Prdhesh',
    'Uttra ',
  ];

  String dropdownvalue = 'TamilNadu';
  @override
  void initState() {
    func();
    super.initState();
  }

  func() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userid = sharedPreferences.getString(Constants.userid);
    profileController.getProfileController(userid: userid.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appbarcolor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(children: [
                Stack(
                  children: [
                    Center(
                        child: Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 20.00.h),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset(
                              'assets/images/backarrow.png',
                              height: 35,
                              width: 35,
                            ),
                          )
                        ],
                      ),
                    )),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 100.00.h,
                      ),
                      child: Container(
                          height: 900.0.h,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                              )),
                          child: const DetailsSection()),
                    ),
                    const ProfileImage(),
                  ],
                ),
              ]),
            ),
          ),
        ));
  }
}
