import 'package:flutter/material.dart';
import 'package:itti_prueba/utils/responsive.dart';

class ClienteActivoScreen extends StatelessWidget {
  const ClienteActivoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    dynamic args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF7677C1),
        title: Text(
          'Activo',
          style: TextStyle(
            fontSize: responsive.dp(2.2)
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(responsive.dp(2.5)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'El usuario esta activo por que el numero generado es menor a 20',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: responsive.dp(1.8)
                  ),
                ),
          
                SizedBox(height: responsive.dp(2)),
          
                Text(
                  args.toString(),
                  style: TextStyle(
                    fontSize: responsive.dp(3)
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}