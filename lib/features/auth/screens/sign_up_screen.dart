import 'package:firetestproject/features/auth/logic/register_logic.dart';
import 'package:firetestproject/features/auth/screens/login_screen.dart';
import 'package:firetestproject/features/auth/screens/widgets/custom_material_button.dart';
import 'package:firetestproject/features/auth/screens/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 100,
                bottom: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               const   Text(
                    'Create an \n account',
                    style: TextStyle(fontSize: 36 ,fontWeight: FontWeight.bold,),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                   CustomTextField(
                    controller: _emailController,
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Username or Email',
                     validator: (value) {
                    bool isValid = RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                        .hasMatch(value!);
                    if (!isValid) {
                      return "Not valid email";
                    }
                    return null;
                  },
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                   CustomTextField(
                     controller: _passwordController,
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                
                 
                  const SizedBox(
                    height: 40,
                  ),
                  CustomMaterialButton(
                    color: const Color.fromARGB(255, 255, 60, 46),
                    text: 'Create Account',
                     onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        signup(
                          context,
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                      }
                    },
                  ),
                  const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text("Login"),
                    )
                  ],
                )
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
