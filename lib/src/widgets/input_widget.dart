import 'package:flutter/material.dart';
import 'package:itti_prueba/utils/responsive.dart';

class InputWidget extends StatelessWidget {
  final String placeholder;
  final TextInputType tipoTeclado;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final controller;
  final IconData icon;
  final int? maxLength;

  const InputWidget({
    Key? key,
    required this.placeholder,
    required this.tipoTeclado,
    this.validator,
    this.onChanged,
    this.controller,
    required this.icon,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: TextFormField(
        validator: validator,
        maxLength: maxLength,
        onChanged: onChanged,
        keyboardType: tipoTeclado,
        cursorColor: const Color(0xFF6E71FF),
        style: TextStyle(fontSize: responsive.dp(1.8)),
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: responsive.dp(1.8), bottom: responsive.dp(1.8)),
          counterText: "",
          prefixIcon: Icon(
            icon,
            size: responsive.dp(2.3),
            color: const Color(0xFF6E71FF),
          ),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(responsive.dp(1)),
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: const Color(0xFF6E71FF), width: responsive.dp(0.1))),
          hintText: placeholder,
        ),
      ),
    );
  }
}
