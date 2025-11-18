import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ScanRepository {
  final String _baseUrl = 'http://localhost:3000/api/scan'; // TODO: Use environment variable

  /// Scan a product image with AI
  Future<Map<String, dynamic>> scanImage(
    File imageFile, {
    String? userId,
    String? token,
    bool autoAdd = true,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse('$_baseUrl/image'));

      // Add JWT token if available
      if (token != null) {
        request.headers['Authorization'] = 'Bearer $token';
      }

      // Add image file
      var multipartFile = await http.MultipartFile.fromPath(
        'image',
        imageFile.path,
        contentType: MediaType('image', 'jpeg'),
      );
      request.files.add(multipartFile);

      // Add fields
      if (userId != null) {
        request.fields['userId'] = userId;
      }
      request.fields['autoAdd'] = autoAdd.toString();

      // Send request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to scan image: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Scan error: $e');
    }
  }

  /// Scan a restaurant meal
  Future<Map<String, dynamic>> scanMeal(
    File imageFile, {
    String? token,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse('$_baseUrl/meal'));

      if (token != null) {
        request.headers['Authorization'] = 'Bearer $token';
      }

      var multipartFile = await http.MultipartFile.fromPath(
        'image',
        imageFile.path,
        contentType: MediaType('image', 'jpeg'),
      );
      request.files.add(multipartFile);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to scan meal: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Meal scan error: $e');
    }
  }

  /// Check if product is Halal and safe
  Future<Map<String, dynamic>> scanHalal(
    File imageFile, {
    String? token,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse('$_baseUrl/halal'));

      if (token != null) {
        request.headers['Authorization'] = 'Bearer $token';
      }

      var multipartFile = await http.MultipartFile.fromPath(
        'image',
        imageFile.path,
        contentType: MediaType('image', 'jpeg'),
      );
      request.files.add(multipartFile);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to check halal: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Halal check error: $e');
    }
  }
}
