import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

/// Notifications Screen - displays user notifications
class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Use real notifications provider
    final notifications = _getDummyNotifications();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.green[700],
        actions: [
          if (notifications.any((n) => n['is_read'] == false))
            TextButton(
              onPressed: () {
                // TODO: Mark all as read
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('All marked as read')),
                );
              },
              child: const Text(
                'Mark all read',
                style: TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
      body: notifications.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notifications_none, size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No notifications',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.separated(
              itemCount: notifications.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return _buildNotificationTile(context, notification);
              },
            ),
    );
  }

  Widget _buildNotificationTile(
    BuildContext context,
    Map<String, dynamic> notification,
  ) {
    final isRead = notification['is_read'] as bool;
    final type = notification['type'] as String;
    final title = notification['title'] as String;
    final body = notification['body'] as String;
    final createdAt = DateTime.parse(notification['created_at'] as String);

    return Dismissible(
      key: Key(notification['id'] as String),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        // TODO: Delete notification
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Deleted: $title')),
        );
      },
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: _getTypeColor(type).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            _getTypeIcon(type),
            color: _getTypeColor(type),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              body,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              _formatTime(createdAt),
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        isThreeLine: true,
        tileColor: isRead ? null : Colors.green[50],
        onTap: () {
          _showNotificationDetails(context, notification);
        },
      ),
    );
  }

  IconData _getTypeIcon(String type) {
    switch (type.toLowerCase()) {
      case 'expiry':
        return Icons.warning_amber;
      case 'low_stock':
        return Icons.inventory_2;
      case 'recipe':
        return Icons.restaurant_menu;
      case 'payment':
        return Icons.payment;
      case 'success':
        return Icons.check_circle;
      case 'error':
        return Icons.error;
      default:
        return Icons.notifications;
    }
  }

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'expiry':
        return Colors.orange;
      case 'low_stock':
        return Colors.red;
      case 'recipe':
        return Colors.purple;
      case 'payment':
        return Colors.blue;
      case 'success':
        return Colors.green;
      case 'error':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return DateFormat('MMM d, y').format(dateTime);
    }
  }

  void _showNotificationDetails(
    BuildContext context,
    Map<String, dynamic> notification,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              _getTypeIcon(notification['type'] as String),
              color: _getTypeColor(notification['type'] as String),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(notification['title'] as String),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification['body'] as String),
            const SizedBox(height: 16),
            Text(
              _formatTime(DateTime.parse(notification['created_at'] as String)),
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: Mark as read
            },
            child: const Text('Mark as read'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getDummyNotifications() {
    return [
      {
        'id': '1',
        'title': 'Items Expiring Soon',
        'body': 'You have 3 items expiring in the next 3 days. Check your inventory!',
        'type': 'expiry',
        'is_read': false,
        'created_at': DateTime.now().subtract(const Duration(hours: 2)).toIso8601String(),
      },
      {
        'id': '2',
        'title': 'New Recipe Suggestions',
        'body': 'We found 5 new recipes you can make with your current inventory.',
        'type': 'recipe',
        'is_read': false,
        'created_at': DateTime.now().subtract(const Duration(hours: 5)).toIso8601String(),
      },
      {
        'id': '3',
        'title': 'Low Stock Alert',
        'body': 'Milk is running low. Time to add it to your shopping list!',
        'type': 'low_stock',
        'is_read': true,
        'created_at': DateTime.now().subtract(const Duration(days: 1)).toIso8601String(),
      },
      {
        'id': '4',
        'title': 'Premium Subscription Active',
        'body': 'Your Premium subscription is now active. Enjoy unlimited scans!',
        'type': 'success',
        'is_read': true,
        'created_at': DateTime.now().subtract(const Duration(days: 2)).toIso8601String(),
      },
    ];
  }
}
