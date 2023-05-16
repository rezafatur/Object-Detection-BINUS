// Berhasil memasukkan login
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:object_detection_app/app/modules/home/views/home_view.dart';
import 'package:object_detection_app/core/theme/colors.dart';
import 'package:object_detection_app/core/theme/text_theme.dart';
import '../../../../core/utils/size.configs.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.screenHeight!;
    double sizeW = SizeConfig.screenWidth!;

    return Scaffold(
      backgroundColor: BgWhite,
      body: Stack(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              margin: EdgeInsets.only(
                left: 45,
                right: 45,
              ),
              height: sizeH * 0.35,
              decoration: BoxDecoration(
                color: BgWhite,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: SilverFoil,
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/SplashLogo.png',
                        height: sizeH * 0.075,
                      ),
                      Text(
                        "Object Detection",
                        style: objectHeader,
                      ),
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: sizeW,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeView(),
                          ),
                        );
                      },
                      child: Text(
                        "Login",
                        style: loginButton,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: CaribbeanGreen,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
