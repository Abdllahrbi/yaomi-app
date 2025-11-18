import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaomi_app/features/scan/scan_repository.dart';

// This provider creates an instance of ScanRepository
final scanRepositoryProvider = Provider<ScanRepository>((ref) {
  return ScanRepository();
});
