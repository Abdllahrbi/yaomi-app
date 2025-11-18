import 'dart:convert';
import 'package:http/http.dart' as http;

class SubscriptionRepository {
  final String _baseUrl = 'http://localhost:3000/api/payment'; // TODO: Use environment variable

  /// Create a payment for subscription
  Future<Map<String, dynamic>> createPayment({
    required String userId,
    required String email,
    required String name,
    required double amount,
    required String currency,
    required String plan,
    String? phone,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/create'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'userId': userId,
          'email': email,
          'name': name,
          'amount': amount,
          'currency': currency,
          'plan': plan,
          'phone': phone,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create payment: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Payment creation error: $e');
    }
  }

  /// Verify transaction status
  Future<Map<String, dynamic>> verifyTransaction(String transactionRef) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/verify/$transactionRef'),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to verify transaction');
      }
    } catch (e) {
      throw Exception('Verification error: $e');
    }
  }

  /// Get user's active subscription
  Future<Map<String, dynamic>?> getUserSubscription(String userId) async {
    // TODO: Implement actual API call to get subscription from Supabase
    // For now, return null (free plan)
    return null;
  }
}
