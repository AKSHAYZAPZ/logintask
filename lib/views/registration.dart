import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../consts/consts.dart';
import '../model/user_view_model.dart';
import '../validation/validation.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appprovider = Provider.of<UserViewModel>(context);

    return Container(
      
      decoration: boxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Form(
            key: context.read<UserViewModel>().registrationFormKey,
            child: Consumer<UserViewModel>(
              builder: (context, provider, child) => Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/logo.png"),
                              fit: BoxFit.cover)),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Registration",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          validator: validateName,
                          controller: provider.nameController,
                          decoration: formDecoration('Name')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          validator: validateemail,
                          controller: provider.emailController,
                          decoration: formDecoration('Email')),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        obscureText: provider.isvisible ? true : false,
                        validator: validatepassword,
                        controller: provider.passwordController,
                        decoration: InputDecoration(
                            suffixIcon: provider.isvisible
                                ? IconButton(
                                    onPressed: () {
                                      provider.passwordvisibility();
                                    },
                                    icon: Icon(
                                      Icons.visibility_off,
                                      color: Colors.white60,
                                    ))
                                : IconButton(
                                    onPressed: () {
                                      provider.passwordvisibility();
                                    },
                                    icon: Icon(
                                      Icons.visibility,
                                      color: Colors.white60,
                                    )),
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white60),
                            // prefixIcon: Icon(
                            //   Icons.password,
                            //   color: Colors.indigo,
                            // ),
                            errorMaxLines: 3,
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    width: 2, color: Colors.white60)),
                            focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    width: 2, color: Colors.white60)),
                            errorBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(width: 2, color: Colors.red))),
                      ),
                    ),

                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      validator: validateDate,
                      controller: provider.dobController,
                      decoration: formDecoration("Date of Birth"),
                      onTap: () {
                        provider.selectDate(context);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //   },
                    // ),
                    ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context).pop();
                          context.read<UserViewModel>().registerUser(
                                context,
                              );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 199, 21, 104)),
                        child: Text("Register")),
                    SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an accout?  ",
                          style: TextStyle(color: Colors.white60),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.of(context)
                            //     .push(MaterialPageRoute(builder: (context) {
                            //   return LoginScreen();
                            // }));
                            Get.offAll(() => const LoginScreen());
                          },
                          child: const Text("Log In",
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
      ),
    );
  }
}