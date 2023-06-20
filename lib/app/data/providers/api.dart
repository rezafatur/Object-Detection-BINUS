import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class ApiService {
  // URL API Object Detection
  final baseUrl = 'https://api-objectdetection.qweersq.my.id';

  // Sistem Login atau Masuk
  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    // URL Login Investor
    var url = '$baseUrl/api/mobile/login';

    // Permintaan HTTP POST ke URL
    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        {
          'email': email,
          'password': password,
        },
      ),
    );

    // ignore: unnecessary_null_comparison
    if (response != null) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['token'] != null) {
        // Jika Berhasil Login, Maka Simpan Token di GetStorage
        var token = jsonResponse['token'];
        GetStorage storage = GetStorage();
        await storage.write('token', token);
      }
      return jsonResponse;
    } else {
      return {'message': 'Server error'};
    }
  }
}
