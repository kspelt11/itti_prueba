import 'package:flutter/material.dart';
import 'package:itti_prueba/router/app_routers.dart';
import 'package:itti_prueba/src/screens/screens.dart';
import 'package:provider/provider.dart';

import 'services/list_users_service.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ListarUsuariosService(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      initialRoute: AppRoutes.initialRouter,
      routes: AppRoutes.routes,
    );
  }
}