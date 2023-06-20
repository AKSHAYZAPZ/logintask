import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../consts/consts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.email});
  final email;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  email,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Log Out"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}