import 'package:flutter/material.dart';
import 'package:task_one/utils/routes/routes_name.dart';
import '../../../screens/auth_screens/forget_password.dart';
import '../../../screens/auth_screens/login_screen.dart';
import '../../../screens/auth_screens/signup_screen.dart';
import '../../../screens/todo_screens/add_todo.dart';
import '../../../screens/todo_screens/display_todo.dart';
import '../../screens/splash_screen/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routesname.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      case Routesname.addTodoScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const AddTodo());
      case Routesname.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LogninScreen());
      case Routesname.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => SignUpScreen());
      case Routesname.displayTodo:
        return MaterialPageRoute(
            builder: (BuildContext context) => const DisplayTodo());

      case Routesname.forgetpassword:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ForgetPassword());
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Scaffold(
                  body: Center(
                    child: Text("No Routes Defines"),
                  ),
                ));
    }
  }
}
