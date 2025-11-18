import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaomi_app/features/subscription/subscription_repository.dart';
import 'package:yaomi_app/features/subscription/subscription_providers.dart';
import 'package:yaomi_app/features/subscription/payment_webview_screen.dart';

/// Subscription Screen - displays available plans and handles payment
class SubscriptionScreen extends ConsumerWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Premium Subscription'),
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Text(
              '🌟 Upgrade to Premium',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Unlock all features and get the most out of Yaomi!',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),

            // Free Plan (Current)
            _buildPlanCard(
              context: context,
              title: 'Free Plan',
              price: 'Free',
              period: 'Forever',
              features: [
                '5 scans per month',
                'Basic inventory management',
                'Expiry notifications',
              ],
              isCurrentPlan: true,
              onTap: null,
            ),

            const SizedBox(height: 16),

            // Premium Monthly Plan
            _buildPlanCard(
              context: context,
              title: 'Premium Monthly',
              price: '19.99 SAR',
              period: 'per month',
              badge: '🎁 3 Days Free Trial',
              features: [
                '✨ Unlimited AI scans',
                '🤖 Advanced AI recipe suggestions',
                '🍽️ Restaurant meal analysis (AI)',
                '✅ Halal & harmful ingredients checker (AI)',
                '🔄 Ingredient substitutions (AI)',
                '📊 Detailed nutrition breakdowns (AI)',
                '🎯 All AI-powered features',
              ],
              isCurrentPlan: false,
              isRecommended: true,
              onTap: () => _handleSubscription(context, ref, 'monthly', 19.99),
            ),

            const SizedBox(height: 16),

            // Premium Yearly Plan
            _buildPlanCard(
              context: context,
              title: 'Premium Yearly',
              price: '199 SAR',
              period: 'per year',
              badge: 'Save 40 SAR! 🎁 3 Days Free',
              features: [
                'All Premium Monthly features',
                '📈 Advanced nutrition reports (AI)',
                '🎯 Personalized meal plans (AI)',
                '💬 Priority support',
                '🎁 Exclusive features first',
                '💰 Best Value!',
              ],
              isCurrentPlan: false,
              onTap: () => _handleSubscription(context, ref, 'yearly', 199.0),
            ),

            const SizedBox(height: 16),

            // Free Trial Notice
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green[700]!, Colors.green[500]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.celebration, color: Colors.white, size: 40),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '🎁 Try Premium Free!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Get 3 days FREE trial\nCancel anytime, no commitment',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Benefits section
            const Text(
              'Why go Premium?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'All AI-powered features are Premium only',
              style: TextStyle(fontSize: 14, color: Colors.orange),
            ),
            const SizedBox(height: 16),
            _buildBenefitItem(
              icon: Icons.camera_alt,
              title: 'Unlimited Scanning',
              description: 'Scan as many products as you want, no limits!',
            ),
            _buildBenefitItem(
              icon: Icons.restaurant,
              title: 'Meal Analysis',
              description: 'Analyze restaurant meals and get instant nutrition info',
            ),
            _buildBenefitItem(
              icon: Icons.check_circle,
              title: 'Halal Checker',
              description: 'Ensure your food is halal and free from harmful ingredients',
            ),
            _buildBenefitItem(
              icon: Icons.lightbulb,
              title: 'Smart Recipes',
              description: 'Get AI-powered recipe suggestions based on your inventory',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required BuildContext context,
    required String title,
    required String price,
    required String period,
    required List<String> features,
    required bool isCurrentPlan,
    bool isRecommended = false,
    String? badge,
    VoidCallback? onTap,
  }) {
    return Card(
      elevation: isRecommended ? 8 : 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: isRecommended
            ? BorderSide(color: Colors.green[700]!, width: 2)
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with badge
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (badge != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        badge,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  if (isRecommended && badge == null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green[700],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Recommended',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),

              // Price
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      period,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Features
              ...features.map((feature) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green[700],
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            feature,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  )),

              const SizedBox(height: 16),

              // Action button
              if (isCurrentPlan)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Current Plan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                )
              else
                ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Colors.green[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Subscribe Now',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBenefitItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.green[700], size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleSubscription(
    BuildContext context,
    WidgetRef ref,
    String plan,
    double amount,
  ) async {
    try {
      // Show loading
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      // Call payment API
      final subscriptionRepo = ref.read(subscriptionRepositoryProvider);
      final result = await subscriptionRepo.createPayment(
        userId: 'dummy-user-123', // TODO: Get from auth
        email: 'user@example.com', // TODO: Get from auth
        name: 'Test User', // TODO: Get from auth
        amount: amount,
        currency: 'SAR',
        plan: 'Yaomi Premium - ${plan == 'monthly' ? 'Monthly' : 'Yearly'}',
      );

      // Hide loading
      if (context.mounted) {
        Navigator.pop(context);
      }

      if (result['success'] == true) {
        // Open payment URL in WebView
        final paymentUrl = result['paymentUrl'];
        final transactionRef = result['transactionRef'];

        if (context.mounted) {
          // Navigate to PaymentWebViewScreen
          final paymentResult = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaymentWebViewScreen(
                paymentUrl: paymentUrl,
                transactionRef: transactionRef,
              ),
            ),
          );

          // Handle payment result
          if (paymentResult != null && context.mounted) {
            if (paymentResult['success'] == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('🎉 Payment successful! Welcome to Premium!'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 3),
                ),
              );

              // Refresh subscription status
              // TODO: Refresh user subscription
            } else if (paymentResult['cancelled'] == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Payment cancelled'),
                  backgroundColor: Colors.orange,
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Payment failed. Please try again.'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          }
        }
      } else {
        throw Exception('Failed to create payment');
      }
    } catch (e) {
      // Hide loading if still showing
      if (context.mounted && Navigator.canPop(context)) {
        Navigator.pop(context);
      }

      // Show error
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
