import 'package:flutter/material.dart';
import 'package:to_do/app_text_form_field.dart';
import 'package:to_do/pallet_colors.dart';
import 'package:to_do/register/register_screen.dart';
import 'package:to_do/utils.dart';
import 'package:to_do/validation_utile.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login";

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PalletColors.loginBackGround,
      body: Padding(
        padding: const EdgeInsets.only(top: 92, left: 16, right: 16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image.asset(
                  getImages("route.png"),
                  scale: 4,
                  // fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 48),
              Text(
                "Enter Your Email",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              AppTextFormField(
                hintText: "Enter Your Email",
                isPassword: false,
                isObscure: false,
                controller: email,
                validator: (text) {
                  if (text?.trim().isEmpty == true) {
                    return "please enter your Email";
                  } else if (!isValidEmail(text!)) {
                    return "please enter your Email";
                  } else {
                    return null;
                  }
                },
              ),

              Text(
                "Enter Your Password",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              AppTextFormField(
                hintText: "Enter Your Password",
                isPassword: true,
                isObscure: false,
                controller: password,
                validator: (text) {
                  if ((text?.length ?? 0) < 6) {
                    return "password at least 6 chars";
                  } else {
                    return null;
                  }
                },
              ),

              SizedBox(height: 10),
              SizedBox(
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    login();
                  },
                  child: Text(
                    "Login",
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: Colors.black),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RegisterScreen.routeName,
                      );
                    },
                    child: Text(
                      "Create Account",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    formKey.currentState?.validate();
  }
}
