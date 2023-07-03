import 'package:flutter/material.dart';
import 'package:itti_prueba/utils/responsive.dart';

class ButtonWidget extends StatelessWidget {
  final String texto;
  final Function()? event;

  const ButtonWidget({
    Key? key,
    required this.texto,
    this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return ElevatedButton(
      onPressed: event,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), 
        backgroundColor: const Color(0xFF6E71FF),
        padding: EdgeInsets.symmetric(vertical: responsive.dp(1.8)),
        minimumSize: Size.fromHeight(responsive.dp(0)),
      ),
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: responsive.dp(1.8),
        ),
      )
    );
  }
}
