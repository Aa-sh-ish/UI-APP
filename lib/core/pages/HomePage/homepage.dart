import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ui_app/common/utils/constants.dart';
import 'package:ui_app/common/widgets/appdrawer.dart';
import 'package:ui_app/common/widgets/appstyle.dart';
import 'package:ui_app/common/widgets/heightspacer.dart';
import 'package:ui_app/common/widgets/reusabletext.dart';
import 'package:ui_app/common/widgets/textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  final List<String> imgList = [
    "assets/1.jpg",
    "assets/2.jpg",
    "assets/3.jpg",
    "assets/4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppConst.knavypurple3,
          actions: [
            HeightSpace(height: 20.h),
            CustomeTextField(
              keyboardtype: TextInputType.text,
              hintText: "Search",
              controller: searchController,
              hintstyle: appstyle(16, AppConst.knavypurple4, FontWeight.bold),
              prefixIcon: const Icon(
                Icons.search,
                color: AppConst.knavypurpledark,
              ),
            ),
          ],
        ),
        drawer: const AppDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              width: 200,
              height: 40,
              text: "Place That I visit Near by",
              textstyle: appstyle(
                20,
                AppConst.knavypurple4,
                FontWeight.w600,
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                scrollDirection: Axis.horizontal,
              ),
              items: imgList
                  .map((item) => Container(
                        decoration: BoxDecoration(
                          color: AppConst.kLight,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          border: Border.all(color: AppConst.knavypurple4),
                        ),
                        child: Image.asset(
                          item,
                          fit: BoxFit.fitHeight,
                          width: 1000,
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
