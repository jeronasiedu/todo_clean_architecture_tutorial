import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clean/features/todo/presentation/bindings/todo_binding.dart';
import 'package:todo_clean/features/todo/presentation/pages/home.dart';
import 'package:todo_clean/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      initialBinding: TodoBinding(),
      title: 'Todo Clean',
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}
