import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:object_detection_app/app/data/models/SensorDataDummy.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size.configs.dart';
import '../../home/views/home_view.dart';
import '../../emergency/views/emergency_view.dart';
import '../controllers/bahaya_controller.dart';

class BahayaView extends GetView<BahayaController> {
  const BahayaView({Key? key}) : super(key: key);

  void showEmergencyDialog(BuildContext context) {
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
                  "Permintaan Bantuan",
                  style: textLargeBlackBold,
                ),
                SizedBox(
                  height: sizeH * 0.01,
                ),
                Text(
                  "Telah Dikirim",
                  style: textLargeBlack400,
                ),
                SizedBox(
                  height: sizeH * 0.025,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
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
        );
      },
    );
  }

  void showHeningkanDialog(BuildContext context) async {
    SizeConfig().init(context);
    double sizeH = SizeConfig.screenHeight!;
    double sizeW = SizeConfig.screenWidth!;

    File? selectedImage;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Keterangan",
                      style: textLargeBlack700,
                    ),
                    SizedBox(
                      height: sizeH * 0.025,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizeH * 0.025,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final picker = ImagePicker();
                        final pickedImage =
                            await picker.getImage(source: ImageSource.camera);
                        if (pickedImage != null) {
                          setState(() {
                            selectedImage = File(pickedImage.path);
                          });
                        }
                      },
                      child: selectedImage != null
                          ? SizedBox(
                              width: sizeW,
                              height: sizeH * 0.25,
                              child: Image.file(
                                selectedImage!,
                                fit: BoxFit.contain,
                              ),
                            )
                          : Container(
                              width: sizeW,
                              height: sizeH * 0.25,
                              decoration: BoxDecoration(
                                color: BrightGray,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: SilverFoil,
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 75,
                                ),
                                child: Image.asset(
                                  'assets/images/BahayaHeningkanPhoto.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: sizeH * 0.025,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeView(),
                          ),
                        );
                      },
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
                          child: Text(
                            "Submit",
                            textAlign: TextAlign.center,
                            style: textLargeWhite700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EmergencyView(),
                ),
              );
            },
            child: Padding(
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
                        "Bahaya",
                        textAlign: TextAlign.center,
                        style: textExtraLargeWhite700,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: sizeH * 0.45,
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
                  Text(
                    "Ada Yang Mendekat",
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
                          height: sizeH * 0.025,
                        ),
                        GestureDetector(
                          onTap: () {
                            showEmergencyDialog(context);
                          },
                          child: Container(
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
                                "Emergency",
                                textAlign: TextAlign.center,
                                style: textLargeWhite700,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: sizeH * 0.025,
                        ),
                        GestureDetector(
                          onTap: () {
                            showHeningkanDialog(context);
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
                                "Heningkan",
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
