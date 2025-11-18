import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaomi_app/features/auth/auth_repository.dart';

// This provider creates an instance of AuthRepository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});
