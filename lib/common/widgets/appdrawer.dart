import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui_app/common/utils/constants.dart';
import 'package:ui_app/common/widgets/appstyle.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:io';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  File? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  double _rating = 3.0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: AppConst.knavypurple3,
            ),
            accountName: Text(
              'Aashish Lamsal',
              style: appstyle(24, Colors.white, FontWeight.bold),
            ),
            accountEmail: Text(
              '9846999230',
              style: appstyle(16, Colors.white, FontWeight.normal),
            ),
            currentAccountPicture: GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: _image != null ? FileImage(_image!) : null,
                child: _image == null
                    ? Text(
                        'AL',
                        style: appstyle(
                            24, AppConst.knavypurple3, FontWeight.bold),
                      )
                    : null,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt_rounded),
            title: const Text('Camera'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/camera');
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Rate My Work',
                  style: appstyle(20, AppConst.knavypurple3, FontWeight.bold),
                ),
                RatingBar.builder(
                  initialRating: _rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _rating = rating;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
