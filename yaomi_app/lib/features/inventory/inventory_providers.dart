import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaomi_app/features/inventory/inventory_repository.dart';

// Provider for the repository itself
final inventoryRepositoryProvider = Provider<InventoryRepository>((ref) {
  return InventoryRepository();
});

// FutureProvider to fetch the inventory data
final inventoryProvider = FutureProvider<List<dynamic>>((ref) async {
  final repository = ref.watch(inventoryRepositoryProvider);
  return repository.getInventory();
});
