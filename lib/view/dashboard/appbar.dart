import 'package:rewup/controller/profile_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../allpackages.dart';
import '../../controller/user_particpant_controller.dart';
import '../../utils/constants.dart';

class AppbarPage extends StatefulWidget {
  const AppbarPage({Key? key}) : super(key: key);

  @override
  State<AppbarPage> createState() => _AppbarPageState();
}

class _AppbarPageState extends State<AppbarPage> {
  UserParticpantController userParticpantController =
      Get.put(UserParticpantController());
  var usernames;
  @override
  void initState() {
    func();
    super.initState();
  }

  func() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userid = sharedPreferences.getString(Constants.userid);
    userParticpantController.getUserParticpantController();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (userParticpantController.couponLoading.value) {
        return SizedBox(
          width: 20.0,
          height: 10.0,
          child: Shimmer.fromColors(
            baseColor: appbarcolor,
            highlightColor: appbarcolor,
            child: Text(
              'No username',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      } else if (userParticpantController.listData.isEmpty) {
        return Center(
          child: Text('No Data'),
        );
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 3.0.h,
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    "Hello ${userParticpantController.listData[0].data[0].username.toString()}",
                    style: appbarstyle,
                  ),
                ),
                SizedBox(
                  width: 5.0.w,
                ),
                Image.asset(
                  'assets/images/hello.png',
                  height: 15.0.h,
                )
                // Icon(
                //   Icons.waving_hand_outlined,
                //   size: 20,
                // )
              ],
            ),
            SizedBox(
              height: 3.0.h,
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    "Aujourd'hui vous avez eu ${userParticpantController.listData[0].data[0].participantscount.toString()} participants",
                    style: appbarstyle,
                  ),
                ),

                // Icon(
                //   Icons.waving_hand_outlined,
                //   size: 20,
                // )
              ],
            ),
          ],
        );
      }
    });
  }
}
