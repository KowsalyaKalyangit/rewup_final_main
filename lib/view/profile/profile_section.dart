import 'package:rewup/controller/profile_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../allpackages.dart';
import '../../utils/constants.dart';
import 'edit_profile/edit_profile_screen.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({Key? key}) : super(key: key);

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  ProfileController profileController = Get.put(ProfileController());
  var usernames;
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
    return Obx(() {
      if (profileController.isProfileLoading.value) {
        return CircularProgressIndicator();
      } else if (profileController.listData.isEmpty) {
        return Center(
          child: Text('No Data'),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Row(
            children: [
              Obx(() {
                if (profileController.isProfileLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (profileController.listData.isEmpty) {
                  return Center(
                    child: Text('AUCUNE DONNÉE DISPONIBLE'),
                  );
                } else {
                  return Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 35.0,
                      child: CircleAvatar(
                        backgroundColor: appbarcolor,
                        radius: 33.0,
                        child: CircleAvatar(
                          backgroundColor: appbarcolor,
                          backgroundImage: NetworkImage(profileController
                              .listData[0].data[0].storeimg
                              .toString()),
                          radius: 32.0,
                        ),
                      ),
                    ),
                  );
                }
              }),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 3),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          profileController.username.text.isEmpty
                              ? 'Tony Rajesh'
                              : profileController.storename.value.toString(),
                          style: heading,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(const EditProfileScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0, right: 30),
                  child: Image.asset(
                    'assets/images/edit.png',
                    height: 40,
                    width: 30,
                  ),
                ),
              )
            ],
          ),
        );
      }
    });
  }
}
