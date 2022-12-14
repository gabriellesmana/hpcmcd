import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mc_delivery/controllers/login_controller.dart';
import 'package:mc_delivery/views/home.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.red,
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: size.width,
                      height: size.height / 2.6,
                      color: Colors.red,
                    ),
                    Positioned(
                      bottom: 20,
                      child: Image.asset(
                        'assets/images/mclogo.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: 505,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(100),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Center(
                            child: Text(
                              'Login Now!',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'E-Mail',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: loginController.email,
                            focusNode: loginController.focusEmail.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'E-Mail',
                              filled: true,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Password',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: loginController.passwod,
                            focusNode: loginController.focusPassword.value,
                            obscureText: !loginController.isVisible.value,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  loginController.isVisible.value =
                                      !loginController.isVisible.value;
                                },
                                icon: Icon(loginController.isVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Password',
                              filled: true,
                            ),
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: size.width,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.all(15),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              onPressed: (() {
                                loginController.login();
                              }),
                              child: Text(
                                'Login',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: size.width,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.all(15),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              onPressed: (() {}),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/googlelogo.png',
                                    width: 25,
                                    height: 25,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Login With Google',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don`t Have Account?'),
                              SizedBox(width: 5),
                              Text(
                                'Register Now!',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
