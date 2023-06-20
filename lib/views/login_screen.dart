import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_task/views/registration.dart';
import 'package:provider/provider.dart';
import '../consts/consts.dart';
import '../model/user_view_model.dart';
import '../validation/validation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appprovider = Provider.of<UserViewModel>(context);

    return Container(
      decoration: boxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
       
        body: SafeArea(
            child: Form(
          key: context.read<UserViewModel>().loginFormkey,
          child: Consumer<UserViewModel>(
            builder: (context, provider, child) => Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/logo.png"),
                            fit: BoxFit.cover)),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Log In",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        validator: validateemail,
                        controller: provider.emailController,
                        decoration: formDecoration('Email')),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      obscureText: provider.isvisible ? true : false,
                      validator: validatepassword,
                      controller: provider.passwordController,
                      decoration: InputDecoration(
                          suffixIcon: provider.isvisible
                              ? IconButton(
                                  onPressed: () {
                                    provider.passwordvisibility();
                                  },
                                  icon: const Icon(
                                    Icons.visibility_off,
                                    color: Colors.white60,
                                  ))
                              : IconButton(
                                  onPressed: () {
                                    provider.passwordvisibility();
                                  },
                                  icon: const Icon(
                                    Icons.visibility,
                                    color: Colors.white60,
                                  )),
                          border: const OutlineInputBorder(),
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.white60),
                          // prefixIcon: Icon(
                          //   Icons.password,
                          //   color: Colors.indigo,
                          // ),
                          errorMaxLines: 3,
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white60)),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white60)),
                          errorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.red))),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  //   },
                  // ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).pop();
                      context.read<UserViewModel>().loginUser(
                            context,
                          );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 199, 21, 104)),
                    child: Text("Log In"),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an accout?  ",
                        style: TextStyle(color: Colors.white60),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.of(context)
                          //     .push(MaterialPageRoute(builder: (context) {
                          //   return RegistrationScreen();
                          // }));
                          Get.offAll(() => const RegistrationScreen());
                        },
                        child: const Text("Register Now",
                            style: TextStyle(color: Colors.white)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}

