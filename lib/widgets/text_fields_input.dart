import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({
    Key? key,
    required this.isPass,
    required this.textEditingController,
    required this.hintText,
    required this.textInputType,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String hintText;
  final bool isPass;
  final TextInputType textInputType;
  
  @override
  Widget build(BuildContext context) {
     final inputBorder = OutlineInputBorder(
    borderSide: Divider.createBorderSide(context),
    borderRadius: BorderRadius.circular(30.0)
  );
    return TextField(
      textAlign:TextAlign.center ,
      controller:textEditingController ,
      decoration: InputDecoration(
      
      hintText: hintText,
      border: inputBorder,
      focusedBorder:inputBorder,
      enabledBorder: inputBorder,
      filled: true,
      contentPadding: const EdgeInsets.all(8),      
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
