import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String title;
  String hintTitle;
  TextEditingController controller;
  TextInputType? inputType;
  String? Function(String?)? validator;
  bool isObscure = false;

  CustomTextField(
      {super.key,
      required this.title,
      required this.hintTitle,
      required this.controller,
      required this.validator,
      this.inputType = TextInputType.text});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            widget.title,
            style: const TextStyle(color: MyColors.white, fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: widget.hintTitle,
                hintStyle: const TextStyle(color: MyColors.honeydew),
                suffixIcon: widget.title == 'Password'
                    ? IconButton(
                        icon: Icon(
                          widget.isObscure == true
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: MyColors.honeydew,
                        ),
                        onPressed: () {
                          widget.isObscure = !widget.isObscure;
                          setState(() {});
                        },
                      )
                    : null,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        const BorderSide(width: 2, color: MyColors.white)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        const BorderSide(width: 2, color: MyColors.salmon)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        const BorderSide(width: 2, color: MyColors.white))),
            style: const TextStyle(color: MyColors.honeydew),
            onTap: () {},
            controller: widget.controller,
            keyboardType: widget.inputType,
            validator: widget.validator,
            obscureText: widget.isObscure,
          ),
        ),
      ],
    );
  }
}
