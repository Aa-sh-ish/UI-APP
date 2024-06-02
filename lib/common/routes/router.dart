import 'package:flutter/material.dart';
import 'package:ui_app/auth/login.dart';
import 'package:ui_app/common/widgets/navigationbar.dart';
import 'package:ui_app/core/pages/Camera/camera.dart';

class Routes {
  static Route? onGenerateRoure(RouteSettings settings) {
    switch (settings.name) {
      case "/navigationbar":
        return MaterialPageRoute(builder: (context) => (const NavigatorPage()));

      case "/login":
        return MaterialPageRoute(builder: (context) => (const LoginPage()));

      case "/camera":
        return MaterialPageRoute(builder: (context) => (const Camera()));
    }
    return null;
  }
}
