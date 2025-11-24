import 'dart:convert';
import 'package:app/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource {
  final String baseUrl = 'http://localhost:5000/api';

  Future<UserModel> login({required String email, required String password}) async{
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      body: jsonEncode({'email':email, 'password':password}),
      headers: {'Content-Type': 'application/json'}
    );

    return UserModel.fromJson(jsonDecode(response.body));
  }

Future<UserModel> register({required String fullname, required String email, required String password}) async{
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      body: jsonEncode({'fullname':fullname, 'email':email, 'password':password}),
      headers: {'Content-Type': 'application/json'}
    );
    
    print('Response Status: ${response.statusCode}');
    
    if (response.statusCode == 200 || response.statusCode == 201) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Registration failed: ${response.body}');
    }
  }
}