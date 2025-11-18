/// YAOMI-FOOD-AI Service
/// System Prompt Integration Layer
/// 
/// This service acts as the interface between the Flutter app
/// and the AI backend powered by the YAOMI-FOOD-AI system prompt.

import 'dart:convert';
import 'package:http/http.dart' as http;

/// AI Task Types (matching system prompt)
enum AITaskType {
  productScan,
  mealAnalysis,
  expiryDetection,
  recipeSuggestion,
  ingredientReplacement,
  nutritionCalculation,
  inventoryOptimization,
  barcodeScan,
  smartNotification,
}

/// AI Service Result
class AIResult {
  final String taskType;
  final DateTime timestamp;
  final String userId;
  final AIResultData result;

  AIResult({
    required this.taskType,
    required this.timestamp,
    required this.userId,
    required this.result,
  });

  factory AIResult.fromJson(Map<String, dynamic> json) {
    return AIResult(
      taskType: json['task_type'],
      timestamp: DateTime.parse(json['timestamp']),
      userId: json['user_id'],
      result: AIResultData.fromJson(json['result']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'task_type': taskType,
      'timestamp': timestamp.toIso8601String(),
      'user_id': userId,
      'result': result.toJson(),
    };
  }
}

/// AI Result Data
class AIResultData {
  final String status; // success, error, warning
  final double? confidence;
  final Map<String, dynamic> data;
  final List<String>? suggestions;
  final List<String>? warnings;
  final String? premiumUpgradeHint;

  AIResultData({
    required this.status,
    this.confidence,
    required this.data,
    this.suggestions,
    this.warnings,
    this.premiumUpgradeHint,
  });

  factory AIResultData.fromJson(Map<String, dynamic> json) {
    return AIResultData(
      status: json['status'],
      confidence: json['confidence']?.toDouble(),
      data: json['data'] ?? {},
      suggestions: json['suggestions'] != null
          ? List<String>.from(json['suggestions'])
          : null,
      warnings:
          json['warnings'] != null ? List<String>.from(json['warnings']) : null,
      premiumUpgradeHint: json['premium_upgrade_hint'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'confidence': confidence,
      'data': data,
      'suggestions': suggestions,
      'warnings': warnings,
      'premium_upgrade_hint': premiumUpgradeHint,
    };
  }

  bool get isSuccess => status == 'success';
  bool get isError => status == 'error';
  bool get isWarning => status == 'warning';
}

/// Main AI Service
class YaomiAIService {
  final String baseUrl;
  final String apiKey;

  YaomiAIService({
    required this.baseUrl,
    required this.apiKey,
  });

  /// Generic AI call method
  Future<AIResult> executeAITask({
    required AITaskType taskType,
    required String userId,
    required Map<String, dynamic> input,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/ai/execute'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'task_type': _taskTypeToString(taskType),
          'user_id': userId,
          'timestamp': DateTime.now().toIso8601String(),
          'input': input,
        }),
      );

      if (response.statusCode == 200) {
        return AIResult.fromJson(jsonDecode(response.body));
      } else {
        throw AIException('AI request failed: ${response.statusCode}');
      }
    } catch (e) {
      throw AIException('AI service error: $e');
    }
  }

  /// Product Scan (Task 1)
  Future<AIResult> scanProduct({
    required String userId,
    required String imageBase64,
    String? barcode,
  }) async {
    return executeAITask(
      taskType: AITaskType.productScan,
      userId: userId,
      input: {
        'image': imageBase64,
        'barcode': barcode,
      },
    );
  }

  /// Meal Analysis (Task 7)
  Future<AIResult> analyzeMeal({
    required String userId,
    required String imageBase64,
  }) async {
    return executeAITask(
      taskType: AITaskType.mealAnalysis,
      userId: userId,
      input: {
        'image': imageBase64,
      },
    );
  }

  /// Expiry Detection (Task 3)
  Future<AIResult> detectExpiry({
    required String userId,
    required String imageBase64,
    required String productType,
  }) async {
    return executeAITask(
      taskType: AITaskType.expiryDetection,
      userId: userId,
      input: {
        'image': imageBase64,
        'product_type': productType,
      },
    );
  }

  /// Recipe Suggestion (Task 4)
  Future<AIResult> suggestRecipes({
    required String userId,
    List<String>? dietaryPreferences,
    int? maxCalories,
  }) async {
    return executeAITask(
      taskType: AITaskType.recipeSuggestion,
      userId: userId,
      input: {
        'dietary_preferences': dietaryPreferences,
        'max_calories': maxCalories,
      },
    );
  }

  /// Ingredient Replacement (Task 5)
  Future<AIResult> findIngredientAlternative({
    required String userId,
    required String ingredient,
    required String reason, // 'available', 'healthy', 'cheaper'
  }) async {
    return executeAITask(
      taskType: AITaskType.ingredientReplacement,
      userId: userId,
      input: {
        'ingredient': ingredient,
        'reason': reason,
      },
    );
  }

  /// Nutrition Calculation (Task 6)
  Future<AIResult> calculateNutrition({
    required String userId,
    required String recipeId,
  }) async {
    return executeAITask(
      taskType: AITaskType.nutritionCalculation,
      userId: userId,
      input: {
        'recipe_id': recipeId,
      },
    );
  }

  /// Inventory Optimization (Task 8)
  Future<AIResult> optimizeInventory({
    required String userId,
    int daysBeforeExpiry = 7,
  }) async {
    return executeAITask(
      taskType: AITaskType.inventoryOptimization,
      userId: userId,
      input: {
        'days_before_expiry': daysBeforeExpiry,
      },
    );
  }

  /// Barcode Scan (Task 8)
  Future<AIResult> scanBarcode({
    required String userId,
    required String barcode,
  }) async {
    return executeAITask(
      taskType: AITaskType.barcodeScan,
      userId: userId,
      input: {
        'barcode': barcode,
      },
    );
  }

  /// Helper: Task type to string
  String _taskTypeToString(AITaskType type) {
    switch (type) {
      case AITaskType.productScan:
        return 'product_scan';
      case AITaskType.mealAnalysis:
        return 'meal_analysis';
      case AITaskType.expiryDetection:
        return 'expiry_detection';
      case AITaskType.recipeSuggestion:
        return 'recipe_suggestion';
      case AITaskType.ingredientReplacement:
        return 'ingredient_replacement';
      case AITaskType.nutritionCalculation:
        return 'nutrition_calculation';
      case AITaskType.inventoryOptimization:
        return 'inventory_optimization';
      case AITaskType.barcodeScan:
        return 'barcode_scan';
      case AITaskType.smartNotification:
        return 'smart_notification';
    }
  }
}

/// AI Exception
class AIException implements Exception {
  final String message;
  AIException(this.message);

  @override
  String toString() => 'AIException: $message';
}
