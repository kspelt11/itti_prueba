import 'package:flutter/material.dart';
import 'package:itti_prueba/utils/responsive.dart';

class ClienteInactivoScreen extends StatelessWidget {
  const ClienteInactivoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    dynamic args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF7677C1),
        title: Text(
          'Inactivo',
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
                  'El usuario esta inactivo por que el numero generado es multiplo de 20',
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