import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Subscription Service - Manages Premium Features
class SubscriptionService extends ChangeNotifier {
  static final SubscriptionService _instance = SubscriptionService._internal();
  factory SubscriptionService() => _instance;
  SubscriptionService._internal();

  bool _isPremium = false;
  DateTime? _subscriptionEndDate;

  bool get isPremium => _isPremium;
  DateTime? get subscriptionEndDate => _subscriptionEndDate;

  /// Premium Features
  static const List<String> premiumFeatures = [
    'AI Product Scanner',
    'Automatic Expiry Detection',
    'Calorie & Macro Calculator',
    'AI Meal Suggestions',
    'Restaurant Meal Scanner',
    'Unlimited Inventory Items',
    'Advanced Analytics',
    'Priority Support',
  ];

  /// Free Features
  static const List<String> freeFeatures = [
    'Manual Product Entry',
    'Basic Inventory Management',
    'Recipe Search',
    'Expiry Notifications (Manual)',
    'Up to 50 Items',
  ];

  /// Initialize subscription status
  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    _isPremium = prefs.getBool('is_premium') ?? false;
    
    final endDateString = prefs.getString('subscription_end_date');
    if (endDateString != null) {
      _subscriptionEndDate = DateTime.parse(endDateString);
      
      // Check if subscription expired
      if (_subscriptionEndDate!.isBefore(DateTime.now())) {
        _isPremium = false;
        await prefs.setBool('is_premium', false);
      }
    }
    
    notifyListeners();
  }

  /// Activate premium subscription
  Future<void> activatePremium({required Duration duration}) async {
    final prefs = await SharedPreferences.getInstance();
    _isPremium = true;
    _subscriptionEndDate = DateTime.now().add(duration);
    
    await prefs.setBool('is_premium', true);
    await prefs.setString('subscription_end_date', _subscriptionEndDate!.toIso8601String());
    
    notifyListeners();
  }

  /// Deactivate premium subscription
  Future<void> deactivatePremium() async {
    final prefs = await SharedPreferences.getInstance();
    _isPremium = false;
    _subscriptionEndDate = null;
    
    await prefs.setBool('is_premium', false);
    await prefs.remove('subscription_end_date');
    
    notifyListeners();
  }

  /// Check if a feature is available
  bool hasFeature(String feature) {
    if (_isPremium) return true;
    return freeFeatures.contains(feature);
  }

  /// Show premium required dialog
  static void showPremiumRequired(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('⭐ Premium Feature'),
        content: const Text(
          'This feature requires a Premium subscription.\n\n'
          'Upgrade now to unlock AI-powered features!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigate to subscription screen
              Navigator.pushNamed(context, '/subscription');
            },
            child: const Text('Upgrade'),
          ),
        ],
      ),
    );
  }

  /// Get subscription price
  static String getSubscriptionPrice(String plan) {
    switch (plan) {
      case 'monthly':
        return '\$4.99/month';
      case 'yearly':
        return '\$49.99/year';
      default:
        return '';
    }
  }

  /// Get days remaining
  int? get daysRemaining {
    if (_subscriptionEndDate == null) return null;
    return _subscriptionEndDate!.difference(DateTime.now()).inDays;
  }
}
