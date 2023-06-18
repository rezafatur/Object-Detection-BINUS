import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:object_detection_app/app/modules/home/views/home_view.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size.configs.dart';
import '../../../data/models/SensorDataDummy.dart';
import '../controllers/emergency_controller.dart';

class EmergencyView extends GetView<EmergencyController> {
  const EmergencyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.screenHeight!;
    double sizeW = SizeConfig.screenWidth!;

    return Scaffold(
      body: Stack(
        children: [
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
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 25,
            ),
            child: Container(
              width: sizeW,
              decoration: BoxDecoration(
                color: MediumVermilion,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: SilverFoil,
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/BahayaWarning.png',
                      height: sizeH * 0.03,
                    ),
                    SizedBox(
                      width: sizeW * 0.025,
                    ),
                    Text(
                      "Emergency",
                      textAlign: TextAlign.center,
                      style: textExtraLargeWhite700,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: sizeH * 0.6,
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
                  Image.asset(
                    'assets/images/EmergencyProfile.png',
                    height: sizeH * 0.1,
                  ),
                  SizedBox(
                    height: sizeH * 0.01,
                  ),
                  Text(
                    "John Smith",
                    style: textExtraLargeBlackBold,
                  ),
                  SizedBox(
                    height: sizeH * 0.025,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: sizeW,
                          decoration: BoxDecoration(
                            color: MediumVermilion,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Text(
                              "Butuh Bantuan",
                              textAlign: TextAlign.center,
                              style: textLargeWhite700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: sizeH * 0.01,
                        ),
                        SingleChildScrollView(
                          child: SizedBox(
                            height: sizeH * 0.15,
                            child: ListView.separated(
                              physics: const AlwaysScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: SensorContents.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: sizeW,
                                  decoration: BoxDecoration(
                                    color: BrightGray,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              SensorContents[index].sensor,
                                              textAlign: TextAlign.start,
                                              style: textLargeBlack700,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              SensorContents[index].time,
                                              textAlign: TextAlign.end,
                                              style: textLargeBlack700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(
                                height: 10,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: sizeH * 0.05,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeView(),
                              ),
                            );
                          },
                          child: Container(
                            width: sizeW,
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
                                "Tutup",
                                textAlign: TextAlign.center,
                                style: textLargeBlack700,
                              ),
                            ),
                          ),
                        ),
                      ],
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
