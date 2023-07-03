import 'package:flutter/material.dart';
import 'package:itti_prueba/src/widgets/widgets.dart';
import 'package:itti_prueba/utils/responsive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool mostrarErrorUsuario = false;
  bool bottonActivo = false;

  void validarCampos() {
    final user = _userController.text;

    if (user.contains(RegExp(r'[0-9]')) || user.isEmpty) {
      setState(() {
        mostrarErrorUsuario = user.isNotEmpty;
        bottonActivo = false;
      });
    } else {
      setState(() {
        mostrarErrorUsuario = false;
        bottonActivo = true;
        Navigator.pushReplacementNamed(context, 'home');
      });
    }
  }

  void userInput(String value) {
    if (mostrarErrorUsuario) {
      final user = value.trim();
      if (!user.contains(RegExp(r'[0-9]')) && user.isNotEmpty) {
        setState(() {
          mostrarErrorUsuario = false;
        });
      }
    }
    _actualizarBoton();
  }

  void _actualizarBoton() {
    final user = _userController.text;
    final password = _passwordController.text;

    setState(() {
      bottonActivo = user.isNotEmpty && password.isNotEmpty && !mostrarErrorUsuario;
    });
  }

  @override
  void initState() {
    super.initState();
    _userController.addListener(_actualizarBoton);
    _passwordController.addListener(_actualizarBoton);
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Scaffold(
      backgroundColor: Color(0xFF7677C1),
      body: Container(
        padding: EdgeInsets.all(responsive.dp(3)),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: responsive.dp(2.5), vertical: responsive.dp(4)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(responsive.dp(2)))
              ),
              child: Column(
                children: [
                  Text(
                    'Iniciar Sesión',
                    style: TextStyle(
                      fontSize: responsive.dp(3),
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  
                  SizedBox(height: responsive.dp(3)),

                  InputWidget(
                    placeholder: 'Usuario',
                    tipoTeclado: TextInputType.text,
                    icon: Icons.person,
                    controller: _userController,
                    onChanged: userInput,
                  ),
                
                    // ERROR CARACTER NUMERICO
                  mostrarErrorUsuario ? Container(
                    width: responsive.dp(100),
                    margin: EdgeInsets.only(top: responsive.dp(1)),
                    padding: EdgeInsets.all(responsive.dp(1)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(responsive.dp(0.5))),
                      color: Color(0xFF7677C1)
                    ),
                    child: Text(
                      'No se permite caracteres numéricos',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: responsive.dp(1.4)
                      ),
                    ),
                  ) : SizedBox(),
                
                  InputWidget(
                    placeholder: 'Contraseña',
                    tipoTeclado: TextInputType.number,
                    maxLength: 5,
                    icon: Icons.lock_rounded,
                    controller: _passwordController,
                  ),
              
                  SizedBox(height: responsive.dp(2)),
                
                  ButtonWidget(
                    texto: 'Ingresar',
                    event: bottonActivo ? validarCampos : null,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
