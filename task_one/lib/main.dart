import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_one/firebase_options.dart';
import 'package:task_one/provider/provider.dart';
import 'package:task_one/provider/todo_provider.dart';
import 'package:task_one/screens/auth_screens/login_screen.dart';
import 'package:task_one/utils/routes/routes.dart';
import 'package:task_one/utils/routes/routes_name.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AuthProvider()), // Your AuthProvider
        ChangeNotifierProvider(
            create: (_) => TodoProvider()), // Your AuthProvider
      ],
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LogninScreen(),
        initialRoute: Routesname.splashScreen,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}
