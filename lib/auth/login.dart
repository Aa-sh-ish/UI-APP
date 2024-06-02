import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_app/common/utils/constants.dart';
import 'package:ui_app/common/widgets/appstyle.dart';
import 'package:ui_app/common/widgets/heightspacer.dart';
import 'package:ui_app/common/widgets/outlinebutton.dart';
import 'package:ui_app/common/widgets/reusabletext.dart';
import 'package:ui_app/common/widgets/shimmerror.dart';
import 'package:ui_app/common/widgets/textfield.dart';
import 'package:intl/intl.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String? _selectedAddress;

  final List<String> _addresses = [
    'Kathmandu',
    'Lalitpur',
    'Bhaktapur',
    'Chitwan',
    'Tanahun'
  ];

  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  String? _selectedSex;

  bool _isToggled = false;

  bool _isvisible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeightSpace(height: 20.h),
              ShimmerError(
                respose: ReusableText(
                    text: "UI APP",
                    textstyle:
                        appstyle(40, AppConst.knavypurple3, FontWeight.bold)),
                basecolor: AppConst.knavypurple4,
                highlightcolor: AppConst.kLight,
              ),
              HeightSpace(height: 30.h),
              CustomeTextField(
                hintText: "name",
                controller: nameController,
                prefixIcon: const Icon(
                  Icons.person,
                  color: AppConst.knavypurpledark,
                ),
              ),
              HeightSpace(height: 10.h),
              CustomeTextField(
                keyboardtype: TextInputType.phone,
                hintText: "Phone No.",
                controller: phoneController,
                prefixIcon: const Icon(
                  Icons.phone,
                  color: AppConst.knavypurpledark,
                ),
              ),
              HeightSpace(height: 10.h),
              Container(
                width: AppConst.kWidth * 0.8,
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppConst.kLight,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  border: Border.all(color: AppConst.knavypurple4),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 8.h, left: 10.w),
                  child: DropdownButton<String>(
                    autofocus: true,
                    icon: null,
                    hint: const Text('Select Address'),
                    value: _selectedAddress,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedAddress = newValue;
                      });
                    },
                    items: _addresses
                        .map<DropdownMenuItem<String>>((String address) {
                      return DropdownMenuItem<String>(
                        value: address,
                        child: Text("        $address"),
                      );
                    }).toList(),
                  ),
                ),
              ),
              HeightSpace(height: 10.h),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  width: AppConst.kWidth * 0.8,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppConst.kLight,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(color: AppConst.knavypurple4),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.h, left: 20.w),
                    child: Text(
                      _selectedDate == null
                          ? 'DOB'
                          : '   DOB: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              HeightSpace(height: 10.h),
              SingleChildScrollView(
                child: Container(
                  width: AppConst.kWidth * 0.8,
                  decoration: BoxDecoration(
                    color: AppConst.kLight,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(color: AppConst.knavypurple4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: "Select Your Sex",
                        textstyle:
                            appstyle(15, AppConst.kBkDark, FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: RadioListTile(
                              title: const Text('Male'),
                              value: 'Male',
                              groupValue: _selectedSex,
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedSex = value;
                                });
                              },
                            ),
                          ),
                          Flexible(
                            child: RadioListTile(
                              title: const Text('Female'),
                              value: 'Female',
                              groupValue: _selectedSex,
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedSex = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              HeightSpace(height: 10.h),
              CustomeTextField(
                obsecure: _isvisible,
                keyboardtype: TextInputType.text,
                hintText: "Password",
                controller: passwordController,
                prefixIcon: const Icon(
                  Icons.lock,
                  color: AppConst.knavypurpledark,
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isvisible = !_isvisible;
                      });
                    },
                    icon: _isvisible
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility)),
              ),
              HeightSpace(height: 10.h),
              Container(
                width: AppConst.kWidth * 0.8,
                height: 60.h,
                decoration: BoxDecoration(
                  color: AppConst.kLight,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  border: Border.all(color: AppConst.knavypurple4),
                ),
                child: ListTile(
                  title: const Text(
                      'I confirm all the Provided information are correct'),
                  trailing: Switch(
                    value: _isToggled,
                    onChanged: (bool value) {
                      setState(() {
                        _isToggled = value;
                      });
                    },
                  ),
                ),
              ),
              HeightSpace(height: 30.h),
              CustomOutlineButton(
                  ontap: () {
                    if (phoneController.text.isEmpty ||
                        nameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: AppConst.kred,
                        content: Text('Add Name and Phone.no '),
                        duration: Duration(seconds: 2),
                      ));
                    } else {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/navigationbar', (Route<dynamic> route) => false);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: AppConst.kGreen,
                        content: Text('     Welcome'),
                        duration: Duration(seconds: 2),
                      ));
                    }
                  },
                  width: 100.w,
                  height: 50.h,
                  borradius: 15,
                  borcolor: AppConst.kGreen,
                  text: "Submit",
                  textstyle: appstyle(15, AppConst.kGreen, FontWeight.bold),
                  textheight: 40.h,
                  textwidth: 80.w)
            ],
          ),
        ),
      ),
    );
  }
}
