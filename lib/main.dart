import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:testapp/viwe/page.dart';
import 'package:testapp/viwe/pagthree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
      appBar: AppBar(
        title: const Text("data"),
      ),
      body: TextButton(
          onPressed: () {
            Get.off( PAGETH());
          },
          child: Text("goropage to")),
    ));
  }
}
