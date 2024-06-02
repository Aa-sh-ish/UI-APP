import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_app/common/utils/constants.dart';
import 'package:ui_app/common/widgets/appstyle.dart';
import 'package:ui_app/common/widgets/heightspacer.dart';
import 'package:ui_app/common/widgets/reusabletext.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/2.jpg"),
              scale: 0.9,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 80.h,
                width: AppConst.kWidth,
                color: AppConst.kBkDark,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.settings,
                      size: 32,
                      color: AppConst.kLight,
                    ),
                    Icon(
                      Icons.flash_auto,
                      size: 32,
                      color: AppConst.kLight,
                    ),
                    Icon(
                      Icons.timer_3_select_rounded,
                      size: 32,
                      color: AppConst.kLight,
                    ),
                    Icon(
                      Icons.fullscreen,
                      size: 32,
                      color: AppConst.kLight,
                    ),
                    Icon(
                      Icons.timelapse,
                      size: 32,
                      color: AppConst.kLight,
                    ),
                    Icon(
                      Icons.nightlight_round_sharp,
                      size: 32,
                      color: AppConst.kLight,
                    )
                  ],
                ),
              ),
              Container(
                color: AppConst.kBkDark,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ReusableText(
                          text: "Potrait",
                          textstyle:
                              appstyle(18, AppConst.kLight, FontWeight.w500),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppConst.kGreyLight,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ReusableText(
                              text: "Photo",
                              textstyle: appstyle(
                                  18, AppConst.kLight, FontWeight.w500),
                            ),
                          ),
                        ),
                        ReusableText(
                          text: "Vedio",
                          textstyle:
                              appstyle(18, AppConst.kLight, FontWeight.w500),
                        ),
                        ReusableText(
                          text: "More",
                          textstyle:
                              appstyle(18, AppConst.kLight, FontWeight.w500),
                        ),
                      ],
                    ),
                    HeightSpace(height: 10.h),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage("assets/1.jpg"),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: AppConst.kLight,
                          child: Icon(
                            Icons.camera,
                            size: 60,
                            color: AppConst.kGreyLight,
                          ),
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: AppConst.kLight,
                          child: Icon(
                            Icons.flip_camera_android_outlined,
                            size: 40,
                            color: AppConst.kGreyLight,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
