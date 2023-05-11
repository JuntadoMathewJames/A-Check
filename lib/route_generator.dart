import 'package:flutter/material.dart';
import 'widgets/sign_in.dart';
import 'widgets/classDashboard.dart';
import 'widgets/sign_up.dart';
import 'widgets/mainDashboard.dart';
import 'widgets/create_class.dart';
import 'widgets/create_userType.dart';
import 'widgets/create_accountDetails.dart';
import 'widgets/homePage.dart';
class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case "/":
        return MaterialPageRoute(builder: (_) => Home());
      case "/login":
        return MaterialPageRoute(builder:(_) => Login());
      case "/dashboard":
        return MaterialPageRoute(builder: (_) => MainDashboard());
      case "/sign_up":
        // if (args is String){
        //   return MaterialPageRoute(
        //     builder: (_) =>  SignUp(
        //       data: args,
        //     ),
        //   );
        // }
        // return _errorRoute();
        return MaterialPageRoute(builder: (_) => SignUp());

      case "/user_type":
        return MaterialPageRoute(builder: (_) =>  CreateUserType());
      case "/create_class":
        return MaterialPageRoute(builder: (_) =>  CreateClass());
      case "/create_account":
        if (args is String){
          return MaterialPageRoute(builder: (_) => CreateAccount(
            data: args,
          ));
        }
        return _errorRoute();

        default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute(){
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