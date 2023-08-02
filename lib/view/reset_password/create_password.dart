import '../../allpackages.dart';
import 'createpassword_inputfiels.dart';
import 'dummydetails.dart';

class CreatenewPassword extends StatefulWidget {
  const CreatenewPassword({
    Key? key,
  }) : super(key: key);

  @override
  State<CreatenewPassword> createState() => _CreatenewPasswordState();
}

class _CreatenewPasswordState extends State<CreatenewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: appbarcolor,
            //  / automaticallyImplyLeading: false,
            centerTitle: true,
            leading: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back))),
            title: Text(
              'Modifier le mot de passe',
              style: heading,
            )),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              DummyDetails(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CreateNewPasswordInputFields(),
            ],
          ),
        )));
  }
}
