import 'package:a_check_project/widgets/my_class.dart';
import 'package:flutter/material.dart';
import 'widgets/sign_in.dart';
import 'widgets/classDashboard.dart';
import 'widgets/sign_up.dart';
import 'widgets/mainDashboard.dart';
import 'widgets/create_class.dart';
import 'widgets/create_userType.dart';
import 'widgets/create_accountDetails.dart';
import 'widgets/homePage.dart';
import 'widgets/attendanceSheet.dart';
import 'widget/my_class.dart';
import 'widgets/attendanceRecord.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => Home());
      case "/login":
        return MaterialPageRoute(builder: (_) => Login());
      case "/dashboard":
        return MaterialPageRoute(builder: (_) => MainDashboard());
      case "/sign_up":
        final args = settings.arguments as AccountArguments;
        return MaterialPageRoute(
          builder: (_) => SignUp(
            userType: args.userType,
            fullName: args.fullName,
            schoolName: args.schoolName,
          ),
        );
      case "/user_type":
        return MaterialPageRoute(builder: (_) => CreateUserType());
      case "/create_class":
        return MaterialPageRoute(builder: (_) => CreateClass());
      case "/create_account":
        final args = settings.arguments;
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => CreateAccount(
              data: args,
            ),
          );
        } else {
          return _errorRoute();
        }
      case "/class_dashboard":
        final args = settings.arguments as Classes;
        return MaterialPageRoute(
            builder: (_) => ClassDashboard(
                  myClass: args,
                ));
      case "/check_attendance":
        final args = settings.arguments as Classes;
        return MaterialPageRoute(builder: (_) => AttendanceApp(
          myClass: args,
        ));
      case "/check_record":
        final args = settings.arguments as Classes;
        return MaterialPageRoute(builder: (_) => AttendanceRecord(
          myClass: args,
        ));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
