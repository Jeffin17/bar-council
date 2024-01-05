import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import '../utils/constant.dart';


Future<void> uploadImage(
    File image,
    String regno,
    String phone,
    String pass,

    ) async {
  try {
    var imageFile = File(image.path);

    // Original image size
    int originalSize = await imageFile.length();
    print('Original Image Size: ${originalSize / (1024 * 1024)} MB');

    // Compress and resize the image
    List<int> compressedBytes = await compressImage(imageFile);

    // Compressed image size
    int compressedSize = compressedBytes.length;
    print('Compressed Image Size: ${compressedSize / 1024} KB');

    // Get the file format
    String fileFormat = image.path.split('.').last.toLowerCase();
    print('File Format: $fileFormat');

    var stream = http.ByteStream.fromBytes(compressedBytes);
    stream.cast();
    var length = compressedSize;

    var uri = Uri.parse("${baseUrl}api/user/uploadImage");

    var request = http.MultipartRequest('POST', uri);

    request.fields['regNo'] = regno;
    request.fields['phone'] = phone;
    request.fields['password'] = pass;
    request.files.add(http.MultipartFile('image', stream, length, filename: image.path));

    var response = await request.send();

    if (response.statusCode == 201) {
      print('Image uploaded');
    } else {
      print('Upload failed');
      print('Response: ${await response.stream.bytesToString()}');
      print(image.path.toString());
    }
  } catch (error) {
    print('Error during image upload: $error');
    // Handle specific errors here.
  }
}

Future<List<int>> compressImage(File imageFile) async {
  try {
    // Load the image
    img.Image? image = img.decodeImage(await imageFile.readAsBytes());

    // Resize the image to your desired dimensions (e.g., width: 300 pixels)
    img.Image resizedImage = img.copyResize(image!, width: 300);

    // Encode the image to bytes with a specific quality (e.g., quality: 85)
    List<int> compressedBytes = img.encodeJpg(resizedImage, quality: 85);

    return compressedBytes;
  } catch (error) {
    print('Error during image compression: $error');
    // Handle specific errors here.
    return [];
  }
}


Future<void> sendPostRequest(
    File image,
    String regno,
    String phone,
    String pass,
    ) async {
  // Replace with your API endpoint
  var url = Uri.parse('${baseUrl}api/user/upload');

  // Replace these values with the data you want to send
  var data = {
    'regNo': '123',
    'phone': '27625',
    'password': '324',
    'image': image.path.toString(),
  };

  try {
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print('Values sent successfully');
    } else {
      print('Failed to send values. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
      print(image.path.toString());

    }
  } catch (error) {
    print('Error sending values: $error');
  }
}
