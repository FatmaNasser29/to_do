import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do/app_text_form_field.dart';
import 'package:to_do/firebase_codes.dart';
import 'package:to_do/lay_out/lay_out.dart';
import 'package:to_do/login/login_screen.dart';
import 'package:to_do/dialog_utils.dart';
import 'package:to_do/pallet_colors.dart';
import 'package:to_do/tasks_screen/tasks_screen.dart';
import 'package:to_do/utils.dart';
import 'package:to_do/validation_utile.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController email = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController passwordConfirmation = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PalletColors.loginBackGround,
      body: Padding(
        padding: const EdgeInsets.only(top: 92, left: 16, right: 16),
        child: Form(
          key: formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignme,
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
                "Enter Your Name",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              AppTextFormField(
                hintText: "Enter Your Your Name",
                isPassword: false,
                isObscure: false,
                controller: name,
              ),
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
              Text(
                "Password Confirmation",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              AppTextFormField(
                hintText: "Password Confirmation",
                isPassword: true,
                isObscure: false,
                controller: passwordConfirmation,
                validator: (text) {
                  if (passwordConfirmation.text != password.text) {
                    return "please enter correct password";
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
                    register();
                    // Navigator.pushReplacementNamed(context, LayOut.routeName);
                  },
                  child: Text(
                    "Register",
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
                    "have an account?",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        LoginScreen.routeName,
                      );
                    },
                    child: Text(
                      "sign in",
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

  void register() {
    if (formKey.currentState?.validate() == true) {
      createUserWithEmailAndPassword();
    }
  }

  void createUserWithEmailAndPassword() async {
    try {
      loadingMessageText(context, message: "Please Wait .........");
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email.text,
            password: password.text,
          );
      hideLoading(context);
      showMessageDialog(
        context,
        message: "User created successfully ",
        posButtonText: "OK",
        posButtonOnPressed: () {
          Navigator.pushNamed(context, LayOut.routeName);
        },
      );
      print(credential.user?.uid);
    } on FirebaseAuthException catch (e) {
      String message = "Something went wrong";
      if (e.code == FirebaseCodes.weakPassword) {
        message = 'The password provided is too weak.';
      } else if (e.code == FirebaseCodes.emailAlreadyInUse) {
        message = 'The account already exists for that email.';
      }
      hideLoading(context);
      showMessageDialog(context, message: message, posButtonText: "OK");
    } catch (e) {
      String message = "Something went wrong";
      hideLoading(context);
      showMessageDialog(
        context,
        message: message,
        posButtonText: "Try again",
        posButtonOnPressed: () {
          register();
        },
      );
    }
  }
}
