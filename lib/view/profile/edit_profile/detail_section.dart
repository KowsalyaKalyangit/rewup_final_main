import 'package:shared_preferences/shared_preferences.dart';

import '../../../allpackages.dart';
import '../../../controller/profile_controller.dart';
import '../../../utils/constants.dart';

class DetailsSection extends StatefulWidget {
  const DetailsSection({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsSection> createState() => _DetailsSectionState();
}

class _DetailsSectionState extends State<DetailsSection> {
  var reason;
  var city;
  TextEditingController mobile = TextEditingController();
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileController.isProfileLoading.value) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (profileController.listData.isEmpty) {
        return Text('AUCUNE DONNÉE DISPONIBLE');
      }
      return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80.00.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Prénom*",
                        style: profiletext,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Color(0xffD9D9D9).withOpacity(0.1),
                        height: 40.00.h, width: 140.00.w,
                        // padding: const EdgeInsets.only(
                        //   left: 20,
                        //   right: 20,
                        // ),
                        child: TextFormField(
                          controller: profileController.firstname,
                          style: tablestyle,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide:
                                    const BorderSide(color: appcolor, width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.1),
                                    width: 1),
                              ),
                              fillColor: const Color(0xffC6C6C6),
                              //  hintText: profileController.username.toString(),
                              prefixIcon: Icon(
                                Icons.person,
                                color: appbarcolor,
                                size: 20,
                              ),
                              contentPadding: const EdgeInsets.only(left: 20),
                              hintStyle: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      fontSize: 10.00.sp,
                                      color: formhintcolor,
                                      fontWeight: FontWeight.w500)),
                              border: const OutlineInputBorder(
                                gapPadding: 4,
                              )),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nom de famille*',
                        style: profiletext,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Color(0xffD9D9D9).withOpacity(0.1),
                        height: 40.00.h, width: 140.00.w,
                        // padding: const EdgeInsets.only(
                        //   left: 20,
                        //   right: 20,
                        // ),
                        child: TextFormField(
                          controller: profileController.lastname,
                          style: tablestyle,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide:
                                    const BorderSide(color: appcolor, width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.1),
                                    width: 1),
                              ),
                              fillColor: const Color(0xffC6C6C6),
                              //  hintText: profileController.username.toString(),
                              prefixIcon: Icon(
                                Icons.person,
                                color: appbarcolor,
                                size: 20,
                              ),
                              contentPadding: const EdgeInsets.only(left: 20),
                              hintStyle: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      fontSize: 10.00.sp,
                                      color: formhintcolor,
                                      fontWeight: FontWeight.w500)),
                              border: const OutlineInputBorder(
                                gapPadding: 4,
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Email',
                style: profiletext,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                color: bgcolor,
                height: 40.00.h, width: 320.00.w,
                // padding: const EdgeInsets.only(
                //   left: 20,
                //   right: 20,
                // ),
                child: TextFormField(
                  // enabled: false,
                  controller: profileController.email,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          letterSpacing: 0.2,
                          fontSize: 10.00.sp,
                          color: appbarcolor,
                          fontWeight: FontWeight.w700)),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(color: appcolor, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.1), width: 1),
                      ),
                      fillColor: const Color(0xffC6C6C6),
                      //  hintText: profileController.username.toString(),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: appbarcolor,
                        size: 20,
                      ),
                      contentPadding: const EdgeInsets.only(left: 20),
                      hintStyle: GoogleFonts.jost(
                          textStyle: TextStyle(
                              fontSize: 10.00.sp,
                              color: formhintcolor,
                              fontWeight: FontWeight.w500)),
                      border: const OutlineInputBorder(
                        gapPadding: 4,
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Téléphone*',
                style: profiletext,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                color: Color(0xffD9D9D9).withOpacity(0.1),
                height: 40.00.h, width: 320.00.w,
                // padding: const EdgeInsets.only(
                //   left: 20,
                //   right: 20,
                // ),
                child: TextFormField(
                  controller: profileController.mobile,
                  style: tablestyle,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(color: appcolor, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.1), width: 1),
                      ),
                      fillColor: const Color(0xffC6C6C6),
                      //  hintText: profileController.username.toString(),
                      prefixIcon: Icon(
                        Icons.phone_outlined,
                        color: appbarcolor,
                        size: 20,
                      ),
                      contentPadding: const EdgeInsets.only(left: 20),
                      hintStyle: GoogleFonts.jost(
                          textStyle: TextStyle(
                              fontSize: 10.00.sp,
                              color: formhintcolor,
                              fontWeight: FontWeight.w500)),
                      border: const OutlineInputBorder(
                        gapPadding: 4,
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Adresse*',
                style: profiletext,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                color: Color(0xffD9D9D9).withOpacity(0.1),
                height: 40.00.h, width: 320.00.w,
                // padding: const EdgeInsets.only(
                //   left: 20,
                //   right: 20,
                // ),
                child: TextFormField(
                  controller: profileController.address,
                  style: tablestyle,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(color: appcolor, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.1), width: 1),
                      ),
                      fillColor: const Color(0xffC6C6C6),
                      //  hintText: profileController.username.toString(),
                      prefixIcon: Icon(
                        Icons.location_on_outlined,
                        color: appbarcolor,
                        size: 20,
                      ),
                      contentPadding: const EdgeInsets.only(left: 20),
                      hintStyle: GoogleFonts.jost(
                          textStyle: TextStyle(
                              fontSize: 10.00.sp,
                              color: formhintcolor,
                              fontWeight: FontWeight.w500)),
                      border: const OutlineInputBorder(
                        gapPadding: 4,
                      )),
                ),
              ),
              SizedBox(
                height: 15.00.h,
              ),
              Text(
                'Ville*',
                style: profiletext,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                color: Color(0xffD9D9D9).withOpacity(0.1),
                height: 40.00.h, width: 320.00.w,
                // padding: const EdgeInsets.only(
                //   left: 20,
                //   right: 20,
                // ),
                child: TextFormField(
                  controller: profileController.city,
                  style: tablestyle,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(color: appcolor, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.1), width: 1),
                      ),
                      fillColor: const Color(0xffC6C6C6),
                      //  hintText: profileController.username.toString(),
                      prefixIcon: Icon(
                        Icons.location_history,
                        color: appbarcolor,
                        size: 20,
                      ),
                      contentPadding: const EdgeInsets.only(left: 20),
                      hintStyle: GoogleFonts.jost(
                          textStyle: TextStyle(
                              fontSize: 10.00.sp,
                              color: formhintcolor,
                              fontWeight: FontWeight.w500)),
                      border: const OutlineInputBorder(
                        gapPadding: 4,
                      )),
                ),
              ),
              SizedBox(
                height: 15.00.h,
              ),
              Text(
                "État*",
                style: profiletext,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                color: Color(0xffD9D9D9).withOpacity(0.1),
                height: 40.00.h, width: 320.00.w,
                // padding: const EdgeInsets.only(
                //   left: 20,
                //   right: 20,
                // ),
                child: TextFormField(
                  controller: profileController.state,
                  style: tablestyle,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(color: appcolor, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.1), width: 1),
                      ),
                      fillColor: const Color(0xffC6C6C6),
                      //  hintText: profileController.username.toString(),
                      prefixIcon: Icon(
                        Icons.location_city,
                        color: appbarcolor,
                        size: 20,
                      ),
                      contentPadding: const EdgeInsets.only(left: 20),
                      hintStyle: GoogleFonts.jost(
                          textStyle: TextStyle(
                              fontSize: 10.00.sp,
                              color: formhintcolor,
                              fontWeight: FontWeight.w500)),
                      border: const OutlineInputBorder(
                        gapPadding: 4,
                      )),
                ),
              ),
              SizedBox(
                height: 15.00.h,
              ),
              Text(
                "Code PIN*",
                style: profiletext,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                color: Color(0xffD9D9D9).withOpacity(0.1),
                height: 40.00.h, width: 320.00.w,
                // padding: const EdgeInsets.only(
                //   left: 20,
                //   right: 20,
                // ),
                child: TextFormField(
                  controller: profileController.pincode,
                  style: tablestyle,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(color: appcolor, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.1), width: 1),
                      ),
                      fillColor: const Color(0xffC6C6C6),
                      //  hintText: profileController.username.toString(),
                      prefixIcon: Icon(
                        Icons.pin,
                        color: appbarcolor,
                        size: 20,
                      ),
                      contentPadding: const EdgeInsets.only(left: 20),
                      hintStyle: GoogleFonts.jost(
                          textStyle: TextStyle(
                              fontSize: 10.00.sp,
                              color: formhintcolor,
                              fontWeight: FontWeight.w500)),
                      border: const OutlineInputBorder(
                        gapPadding: 4,
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Pays*',
                style: profiletext,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                color: Color(0xffD9D9D9).withOpacity(0.1),
                height: 40.00.h, width: 320.00.w,
                // padding: const EdgeInsets.only(
                //   left: 20,
                //   right: 20,
                // ),
                child: TextFormField(
                  controller: profileController.country,
                  style: tablestyle,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(color: appcolor, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.1), width: 1),
                      ),
                      fillColor: const Color(0xffC6C6C6),
                      //  hintText: profileController.username.toString(),
                      prefixIcon: Icon(
                        Icons.location_city,
                        color: appbarcolor,
                        size: 20,
                      ),
                      contentPadding: const EdgeInsets.only(left: 20),
                      hintStyle: GoogleFonts.jost(
                          textStyle: TextStyle(
                              fontSize: 10.00.sp,
                              color: formhintcolor,
                              fontWeight: FontWeight.w500)),
                      border: const OutlineInputBorder(
                        gapPadding: 4,
                      )),
                ),
              ),
              SizedBox(
                height: 15.0.h,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 28.0),
                  child: InkWell(
                    onTap: () async {
                      profileController.geteditprofileController();
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          'SAUVEGARDER',
                          style: buttontext,
                        ),
                      ),
                      height: 40.0.h,
                      width: 100.0.w,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 52, 50, 71),
                        border: Border.all(color: Color(0xff283736)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
