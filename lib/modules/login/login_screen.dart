import 'package:bmi_calculater/shared/components/components.dart';
import 'package:flutter/material.dart';

// reusable component

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool showPass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue.shade50,
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  formField(
                    controller: emailController,
                    label: 'Email Address',
                    type: TextInputType.emailAddress,
                    onChanged: (String value) {
                      print(value);
                    },
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    prefixIcon: Icon(Icons.email),
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email Address can not be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  formField(
                    controller: passwordController,
                    label: 'Password',
                    type: TextInputType.visiblePassword,
                    isPassword: showPass ? false : true,
                    onChanged: (String value) {
                      print(value);
                    },
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    sufixIcon: IconButton(onPressed: () {
                      setState(() {
                        showPass = !showPass;
                      });
                    }, icon: !showPass ? Icon(Icons.remove_red_eye): Icon(Icons.remove_red_eye_outlined)),
                    prefixIcon: Icon(Icons.lock),
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password can not be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                      text: 'Login',
                      function: () {
                        if (_formKey.currentState!.validate()) {
                          print(emailController.text);
                          print(passwordController.text);
                        }
                      }),
                  SizedBox(
                    height: 10.0,
                  ),
                  // defaultButton(text: 'Register', function: () {}, background: Colors.red, isUpperCase: false),
                  // SizedBox(
                  //   height: 10.0,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Register Now',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

