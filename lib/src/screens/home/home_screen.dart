import 'dart:math';

import 'package:flutter/material.dart';
import 'package:itti_prueba/services/services.dart';
import 'package:itti_prueba/utils/responsive.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final listarUsuariosService = Provider.of<ListarUsuariosService>(context, listen: false);
    final Responsive responsive = Responsive.of(context);

    navigateToScreen() {
      final nroRandom = Random().nextInt(100) + 1;

      // print(nroRandom);

      if (nroRandom < 20) {
        Navigator.pushNamed(context, 'cliente-activo', arguments: nroRandom);
      } else if (nroRandom % 20 == 0) {
        Navigator.pushNamed(context, 'cliente-inactivo', arguments: nroRandom);
      } else {
        Navigator.pushNamed(context, 'cliente-bloqueado', arguments: nroRandom);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF7677C1),
        title: Text(
          'Listado de Usuarios',
          style: TextStyle(
            fontSize: responsive.dp(2.2)
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(responsive.dp(3)),
          child: FutureBuilder<List<dynamic>>(
        future: listarUsuariosService.listarUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {

            // LOADER
            return const Center(child: CircularProgressIndicator());

          } else if (snapshot.hasData) {

            // LISTADO
            final listadoUsuarios = snapshot.data!;
            return ListView.separated(
              itemCount: listadoUsuarios.length,
              itemBuilder: (context, index) {
                final datosUsuario = listadoUsuarios[index];
                return GestureDetector(
                  onTap: navigateToScreen,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: responsive.dp(0)),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(datosUsuario['avatar']),
                    ),
                    title: Text(
                      datosUsuario['first_name'] + ' ' + datosUsuario['last_name'],
                      style: TextStyle(
                        fontSize: responsive.dp(1.8),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: responsive.dp(0.5)),
                        Text(
                          datosUsuario['email'],
                          style: TextStyle(
                            fontSize: responsive.dp(1.4),
                            color: Colors.grey
                          ),
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: responsive.dp(2),
                      color: Color(0xFF7677C1),
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => const Divider(
                height: 1,
                thickness: 1,
                color: Color(0xffdde3e1),
              ),
            );
            
          } else {
            // SI NO ENCUENTRA DATOS
            return Center(
              child: Text(
                'No se encontraron datos',
                style: TextStyle(
                  fontSize: responsive.dp(1.8)
                ),
              )
            );
          }
        },)
        ),
      ),
    );
  }
}
