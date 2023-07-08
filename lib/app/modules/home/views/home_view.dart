import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:object_detection_app/app/modules/bahaya/views/bahaya_view.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size.configs.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  // Konfirmasi Keluar Akun
  void showLogoutConfirmation(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.screenHeight!;
    double sizeW = SizeConfig.screenWidth!;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Apakah Anda yakin ingin keluar dari akun Anda?",
                  textAlign: TextAlign.center,
                  style: textLargeBlackBold,
                ),
                SizedBox(
                  height: sizeH * 0.025,
                ),
                Row(
                  children: [
                    // Button atau Tombol "Tidak"
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: BgWhite,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: DarkBlack,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Text(
                              "Tidak",
                              style: textMediumBlack,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: sizeW * 0.05,
                    ),

                    // Button atau Tombol "Ya"
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.logoutUser();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: MediumVermilion,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: MediumVermilion,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Text(
                              "Ya",
                              style: textMediumWhiteBold,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.screenHeight!;
    double sizeW = SizeConfig.screenWidth!;

    return Scaffold(
      body: Stack(
        children: [
          // Flutter Map - Open Street Map
          FlutterMap(
            options: MapOptions(
              center: LatLng(-7.939919, 112.681268),
              zoom: 18.2,
              rotation: 55,
              minZoom: 16.4,
              maxZoom: 18.4,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
            ],
          ),

          // Section 1 - Navigasi Atas
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Presisikan Map
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: BgWhite,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: SilverFoil,
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Transform.scale(
                      scale: 0.85,
                      child: Image.asset(
                        'assets/images/HomeSetting.png',
                        height: sizeH * 0.05,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: sizeW * 0.05,
                ),

                // Nama User
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: BgWhite,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: SilverFoil,
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Text(
                      "John Smith",
                      textAlign: TextAlign.center,
                      style: textLargeBlack700,
                    ),
                  ),
                ),
                SizedBox(
                  width: sizeW * 0.05,
                ),

                // Logout
                InkWell(
                  onTap: () {
                    showLogoutConfirmation(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: BgWhite,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: SilverFoil,
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Transform.scale(
                      scale: 0.75,
                      child: Image.asset(
                        'assets/images/HomeLogout.png',
                        height: sizeH * 0.05,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Section 2 - Navigasi Bawah
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: sizeH * 0.25,
              width: sizeW,
              decoration: const BoxDecoration(
                color: BgWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Lokasi Kampus
                  Text(
                    "BINUS @Malang",
                    style: textExtraLargeBlackBold,
                  ),
                  SizedBox(
                    height: sizeH * 0.05,
                  ),

                  // Button atau Tombol "Login"
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BahayaView(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: Container(
                        width: sizeW,
                        decoration: BoxDecoration(
                          color: CaribbeanGreen,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/HomeSafe.png',
                                height: sizeH * 0.03,
                              ),
                              SizedBox(
                                width: sizeW * 0.025,
                              ),
                              Text(
                                "Aman",
                                style: textLargeWhite700,
                              ),
                            ],
                          ),
                        ),
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
