import 'package:flutter/material.dart';

typedef Validator = String? Function(String? text);

class AppTextFormField extends StatefulWidget {
  String hintText;
  bool isPassword;
  Validator? validator;
  TextEditingController? controller;
  AppTextFormField({
    super.key,
    required this.hintText,
    required this.isPassword,
    required bool isObscure,
    this.validator,
    this.controller,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        obscureText: widget.isPassword ? !isObscure : isObscure,
        validator: widget.validator,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon:
              widget.isPassword
                  ? IconButton(
                    onPressed: () {
                      isObscure = !isObscure;
                      setState(() {});
                    },
                    icon:
                        isObscure
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                  )
                  : null,
          fillColor: Colors.white,
          filled: true,
          hintText: widget.hintText,
          hintStyle: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(color: Colors.black),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
