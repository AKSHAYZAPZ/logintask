import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../views/home_screen.dart';
class UserViewModel extends ChangeNotifier {
  final registrationFormKey = GlobalKey<FormState>();
  final loginFormkey = GlobalKey<FormState>();

  bool isvisible = true;
  // DateTime? selectedDate;
  final nameController = TextEditingController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final dobController = TextEditingController();
  void registerUser(
    BuildContext context,
  ) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (registrationFormKey.currentState?.validate() ?? false) {
      await Get.to(() => HomeScreen(email: emailController.text));
      nameController.text = '';
      emailController.text = '';
      passwordController.text = '';
      dobController.text = '';
    } else {
      return;
    }
  }

  void loginUser(
    BuildContext context,
  ) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (loginFormkey.currentState?.validate() ?? false) {
      await Get.to(() => HomeScreen(email: emailController.text));
      emailController.text = '';
      passwordController.text = '';
    } else {
      return;
    }
  }

  void passwordvisibility() {
    isvisible = !isvisible;
    notifyListeners();
  }

  void selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime.now(),
    );
    if (pickedDate == null) {
      // print('null');
      // // selectedDate == null;
      // print(selectedDate);
      return;
    } else {
      String selectedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      dobController.text = selectedDate.toString();
      notifyListeners();
      //print(selectedDate);
    }
  }
}