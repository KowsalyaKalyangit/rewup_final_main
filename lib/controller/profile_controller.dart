import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rewup/allpackages.dart';
import 'package:rewup/model/edit_profile_model.dart';
import 'package:rewup/service/edit_profile_service.dart';

import 'package:rewup/service/profile_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/profile_model.dart';
import '../utils/constants.dart';
import 'login_controller.dart';

class ProfileController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  TextEditingController username = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController country = TextEditingController();
  RxString storename = ''.obs;

  var _listData = <ProfileModel>[];
  var item = [];
  var profileusername;
  List<ProfileModel> get listData => _listData;
  RxBool isProfileLoading = true.obs;
  RxBool editloading = true.obs;
  var _editprofiledata = <EditProfileModel>[];
  List<EditProfileModel> get editprofiledata => _editprofiledata;
  Map map = {};
  Future getProfileController({userid}) async {
    isProfileLoading(true);
    try {
      var data = await ProfileService()
          .profileService(userid: userid, dashboard: "getuser");
      if (data != null) {
        _listData.clear();
        _listData.add(data);
        username.text = data.data[0].username.toString();
        mobile.text = data.data[0].mobile.toString();
        email.text = data.data[0].email.toString();
        firstname.text = data.data[0].firstname.toString();
        lastname.text = data.data[0].lastname.toString();
        address.text = data.data[0].address;
        city.text = data.data[0].city;
        state.text = data.data[0].state;
        pincode.text = data.data[0].zip;
        country.text = data.data[0].country;
        profileusername = data.data[0].username.toString();
        storename.value = data.data[0].storename.toString();
        isProfileLoading(false);
        //Get.back();
      } else {
        isProfileLoading(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future geteditprofileController() async {
    // if (editloading.value) {
    //   _loadingBar(context);
    // }
    try {
      var data = await EditProfileService().editprofileService(
        dashboard: "edituser",
        firstname: firstname.text,
        lastname: lastname.text,
        email: email.text,
        mobile: mobile.text,
        country_code: country.text,
        address: address.text,
        state: state.text,
        zip: pincode.text,
        city: city.text,
        country: country.text,
      );
      if (data != null) {
        _editprofiledata.clear();
        _editprofiledata.add(data);
        Fluttertoast.showToast(msg: 'mis à jour avec succès');
        editloading(false);
        // Get.back();
      } else {
        editloading(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}

void _loadingBar(BuildContext ctx) {
  showDialog(
      barrierDismissible: false,
      context: ctx,
      builder: (BuildContext context) {
        return const Center(
          child: Loader(),
        );
      });
}
