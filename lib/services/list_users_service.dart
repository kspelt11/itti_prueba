import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';


class ListarUsuariosService with ChangeNotifier {
  bool isLoading = false;

  Future<List<dynamic>> listarUsers() async {
    isLoading = true;
    final response = await http.get(Uri.parse('https://reqres.in/api/users'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final users = data['data'];
      return users;
    } else {
      isLoading = false;
      throw Exception('Failed to fetch users');
    }
  }
}

  