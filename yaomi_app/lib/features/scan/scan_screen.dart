import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaomi_app/features/scan/scan_providers.dart';

class ScanScreen extends ConsumerWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Product')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              child: const Center(
                child: Text(
                  'Camera Preview Here',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.flash_on, size: 30),
                  onPressed: () { /* TODO: Toggle flash */ },
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      final scanRepo = ref.read(scanRepositoryProvider);
                      final result = await scanRepo.scanImage();
                      print('Scan successful: $result');
                      // TODO: Show results to the user
                    } catch (e) {
                      print('Scan failed: $e');
                      // TODO: Show an error message
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Icon(Icons.camera, size: 40),
                ),
                IconButton(
                  icon: const Icon(Icons.image, size: 30),
                  onPressed: () { /* TODO: Pick from gallery */ },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
