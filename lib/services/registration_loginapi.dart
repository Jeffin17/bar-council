
//API -- Registration/SignUp Page

import 'dart:convert';
import 'package:http/http.dart' as http;


class RegistrationApi {
  static const String apiUrl =  'baseUrl';

  static Future<Map<String, dynamic>> registerUser({
    required String regNo,
    required String phoneNumber,

    required String password,
    required String confirmpassword,
    // required File image,



  }) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'regNo': regNo,
          'phoneNumber': phoneNumber,
          'password': password,
          'confirmpassword': confirmpassword,

        },
      );

      if (response.statusCode == 200) {
        // Successful registration
        final Map<String, dynamic> data = json.decode(response.body);
        return data;
      } else {
        // Registration failed
        final Map<String, dynamic> error = json.decode(response.body);
        return error;
      }
    } catch (error) {
      // Handle errors during the API call
      print('Error during registration: $error');
      throw Exception('Failed to register user');
    }
  }
}







