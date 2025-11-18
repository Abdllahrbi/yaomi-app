import 'dart:convert';
import 'package:http/http.dart' as http;

class RecipesRepository {
  final String _baseUrl = 'http://localhost:3000/api/recipes'; // TODO: Use environment variable

  /// Get recipe suggestions based on inventory
  Future<List<dynamic>> getSuggestions({
    String? userId,
    String? token,
    String? dietary,
    String? cuisine,
    int? maxTime,
  }) async {
    try {
      final queryParams = {
        if (userId != null) 'userId': userId,
        if (dietary != null) 'dietary': dietary,
        if (cuisine != null) 'cuisine': cuisine,
        if (maxTime != null) 'maxTime': maxTime.toString(),
      };

      final uri = Uri.parse('$_baseUrl/suggest').replace(queryParameters: queryParams);
      final headers = <String, String>{};
      
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['recipes'] as List<dynamic>;
      } else {
        throw Exception('Failed to get recipe suggestions');
      }
    } catch (e) {
      throw Exception('Recipe suggestions error: $e');
    }
  }

  /// Get recipes for expiring items
  Future<List<dynamic>> getExpiringRecipes({
    String? userId,
    String? token,
    int? days,
  }) async {
    try {
      final queryParams = {
        if (userId != null) 'userId': userId,
        if (days != null) 'days': days.toString(),
      };

      final uri = Uri.parse('$_baseUrl/expiring').replace(queryParameters: queryParams);
      final headers = <String, String>{};
      
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['recipes'] as List<dynamic>;
      } else {
        throw Exception('Failed to get expiring recipes');
      }
    } catch (e) {
      throw Exception('Expiring recipes error: $e');
    }
  }

  /// Get ingredient substitutes
  Future<List<dynamic>> getSubstitutes({
    required String ingredient,
    String? reason,
    String? token,
  }) async {
    try {
      final headers = <String, String>{'Content-Type': 'application/json'};
      
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      final response = await http.post(
        Uri.parse('$_baseUrl/substitute'),
        headers: headers,
        body: jsonEncode({
          'ingredient': ingredient,
          if (reason != null) 'reason': reason,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['substitutes'] as List<dynamic>;
      } else {
        throw Exception('Failed to get substitutes');
      }
    } catch (e) {
      throw Exception('Substitutes error: $e');
    }
  }

  /// Calculate recipe calories
  Future<Map<String, dynamic>> calculateCalories({
    required String name,
    required List<String> ingredients,
    int? servings,
    String? token,
  }) async {
    try {
      final headers = <String, String>{'Content-Type': 'application/json'};
      
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      final response = await http.post(
        Uri.parse('$_baseUrl/calories'),
        headers: headers,
        body: jsonEncode({
          'recipe': {
            'name': name,
            'ingredients': ingredients,
            if (servings != null) 'servings': servings,
          },
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['nutrition'] as Map<String, dynamic>;
      } else {
        throw Exception('Failed to calculate calories');
      }
    } catch (e) {
      throw Exception('Calorie calculation error: $e');
    }
  }
}
