// otp_service.dart

import 'package:http/http.dart' as http;
import '../utils/constant.dart';

Future<void> sendOtp(String phoneNumber) async {
  try {
    final response = await http.post(
      Uri.parse("$baseUrl/api/user/sendOTP"),
      body: {"phone": phoneNumber},
    );

    if (response.statusCode == 200) {
    } else {
      // Handle error cases
      print("Response Body: ${response.body}");
      throw Exception("Failed to send OTP");
    }
  } catch (e) {
    // Handle exceptions, such as network errors
    print("Exception: $e");
    throw Exception("Failed to send OTP. Check your network connection.");
  }
}
