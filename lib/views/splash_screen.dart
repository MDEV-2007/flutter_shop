import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shop/app_style.dart';
import 'package:get/get.dart';
import 'package:shop/views/login.screen.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.to(());
      });
    return const Scaffold(
      backgroundColor: kSplash,
      body: Center(
        child: Text(
          "Splash Screen",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
          ),
      ),
    );
  }
}