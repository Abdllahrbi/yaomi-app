import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaomi_app/features/inventory/inventory_providers.dart';

class InventoryScreen extends ConsumerWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventoryAsyncValue = ref.watch(inventoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('My Inventory')),
      body: inventoryAsyncValue.when(
        data: (inventory) => ListView.builder(
          itemCount: inventory.length,
          itemBuilder: (context, index) {
            final item = inventory[index];
            return ListTile(
              title: Text(item['name'].toString()),
              subtitle: Text('${item['quantity']} ${item['unit']}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  // TODO: Implement delete functionality
                },
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to a screen to add a new item
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
