import 'package:flutter/material.dart';
import 'package:my_grocery/view/account/auth/sign_in_screen.dart';

import '../../../component/input_outline_button.dart';
import '../../../component/input_text_button.dart';
import '../../../component/input_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text("Create Account,",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  )),
              const Text(
                "Sign up to started!",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.2),
              ),
              const Spacer(
                flex: 3,
              ),
              const InputTextField(
                title: 'Full Name',
                onsecureText: true,
              ),
              const InputTextField(
                title: 'Email',
                onsecureText: true,
              ),
              const SizedBox(height: 10),
              const InputTextField(
                title: 'Password',
                onsecureText: true,
              ),
              const SizedBox(height: 10),
              const InputTextField(
                title: 'Confirm Password',
                onsecureText: true,
              ),
              const SizedBox(height: 10),
              const Spacer(),
              InputTextButton(
                title: "Sign Up",
                onClick: () {},
              ),
              const SizedBox(height: 10),
              InputOutlineButton(
                  title: "Back",
                  onClick: () {
                    Navigator.of(context).pop();
                  }),
              const Spacer(
                flex: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("I'm already a member,"),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()));
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
