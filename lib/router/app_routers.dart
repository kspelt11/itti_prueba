import 'package:flutter/material.dart';
import 'package:itti_prueba/src/screens/home/home_screen.dart';
import 'package:itti_prueba/src/screens/screens.dart';



class AppRoutes {
  static const initialRouter = 'checkAuth';

  static Map<String, Widget Function(BuildContext)> routes = {
    
    'login': (_) => const LoginScreen(),

    'home': (_) => const HomeScreen(),

    'cliente-activo': (_) => const ClienteActivoScreen(),
    'cliente-inactivo': (_) => const ClienteInactivoScreen(),
    'cliente-bloqueado': (_) => const ClienteBloqueadoScreen(),

    

  };
}
