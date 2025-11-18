import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaomi_app/features/recipes/recipes_repository.dart';

/// Provider for RecipesRepository
final recipesRepositoryProvider = Provider<RecipesRepository>((ref) {
  return RecipesRepository();
});

/// Provider to fetch recipe suggestions
final recipeSuggestionsProvider = FutureProvider<List<dynamic>>((ref) async {
  final recipesRepo = ref.read(recipesRepositoryProvider);
  // TODO: Get actual userId from auth
  return await recipesRepo.getSuggestions(userId: 'dummy-user-123');
});

/// Provider to fetch expiring item recipes
final expiringRecipesProvider = FutureProvider<List<dynamic>>((ref) async {
  final recipesRepo = ref.read(recipesRepositoryProvider);
  // TODO: Get actual userId from auth
  return await recipesRepo.getExpiringRecipes(userId: 'dummy-user-123', days: 7);
});
