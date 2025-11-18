import 'dart:convert';
import 'package:http/http.dart' as http;

class InventoryRepository {
  final String _baseUrl = 'http://localhost:3000/api/inventory'; // TODO: Use environment variable

  Future<List<dynamic>> getInventory() async {
    // TODO: Add JWT token to headers for authentication
    final response = await http.get(
      Uri.parse(_baseUrl),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['inventory'];
    } else {
      throw Exception('Failed to load inventory');
    }
  }
  
  // TODO: Implement addItem, updateItem, deleteItem methods
}
