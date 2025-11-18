import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaomi_app/features/subscription/subscription_repository.dart';

/// Provider for SubscriptionRepository
final subscriptionRepositoryProvider = Provider<SubscriptionRepository>((ref) {
  return SubscriptionRepository();
});

/// Provider to check if user has active premium subscription
final hasPremiumProvider = FutureProvider<bool>((ref) async {
  final subscriptionRepo = ref.read(subscriptionRepositoryProvider);
  // TODO: Get actual userId from auth
  final subscription = await subscriptionRepo.getUserSubscription('dummy-user-123');
  
  if (subscription == null) {
    return false; // Free plan
  }
  
  // Check if subscription is active and not expired
  final status = subscription['status'] as String?;
  final expiresAt = subscription['expires_at'] as String?;
  
  if (status == 'active' && expiresAt != null) {
    final expiryDate = DateTime.parse(expiresAt);
    return DateTime.now().isBefore(expiryDate);
  }
  
  return false;
});
