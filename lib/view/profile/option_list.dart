import 'package:rewup/view/dashboard/customerchatdetails.dart';
import 'package:rewup/view/dashboard/game_details.dart';

import '../../allpackages.dart';
import '../dashboard/chatsurvey.dart';
import '../dashboard/chatsurvey_customerdetails.dart';
import '../dashboard/coupondetails_page.dart';
import '../dashboard/email_templates/emial_template.dart';
import '../dashboard/email_templates/game_template.dart';
import '../dashboard/store_details_page.dart';
import '../reset_password/create_password.dart';

class OptionList extends StatefulWidget {
  const OptionList({Key? key}) : super(key: key);

  @override
  State<OptionList> createState() => _OptionListState();
}

class _OptionListState extends State<OptionList> {
  var menuoptions = [
    'DÉTAILS DU COUPON',
    // "ENQUÊTE SUR LE CHA",

    "MODIFIER LE MOT DE PASSE",
    "NOUS CONTACTER"
  ];
  var menuscreens = [
    // const HomeScreen(),0

    const CouponDetailsPage(),
    // const ChatSurvey(),
    CreatenewPassword(),
    EmailTemplate(),
  ];
  var image = [
    'assets/images/voucher.png',
    // 'assets/images/qa.png',
    'assets/images/password.png',
    'assets/images/email.png',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: menuoptions.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Get.to(menuscreens[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Container(
                    height: 40.0.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            width: 2, color: const Color(0xffF5F5F5))),
                    padding: const EdgeInsets.only(left: 10, top: 2, bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              image[index],
                              height: 30,
                            ),
                            SizedBox(
                              width: 20.0.w,
                            ),
                            Text(
                              menuoptions[index],
                              style: tablestyle,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 28.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: formhintcolor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          );
        });
  }
}
