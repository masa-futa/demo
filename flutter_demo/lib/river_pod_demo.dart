import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Provider
final provider = Provider<List<SampleModel>>((ref) => []);

/// StateProvider
final stateProvider = StateProvider<int>((ref) => 0);

/// FutureProvider
final futureProvider = FutureProvider<List<SampleModel>>((ref) async {
  await Future.delayed(const Duration(seconds: 3));
  return const [
    SampleModel(
        name: 'open-source-ios-apps',
        text: ':iphone: Collaborative List of Open-Source iOS Apps',
        count: 32602),
    SampleModel(
        name: 'CodeEdit',
        text:
            'CodeEdit App for macOS-Elevate your code editing experience. Open Source, free forever.',
        count: 15558),
    SampleModel(
        name: 'eul',
        text: 'macOS status monitoring app written in SwiftUI.',
        count: 8161),
    SampleModel(
        name: 'swift-composable-architecture',
        text:
            'xxxxxxxxxxxxx.xxxxxxxxxxxxx.xxxxxxxxxxxxx.xxxxxxxxxxxx.xxxxxxxxx.',
        count: 5012),
    SampleModel(
        name: 'sampel.sampel.sampel',
        text:
            'xxxxxxxxxxxxx.xxxxxxxxxxxxx.xxxxxxxxxxxxx.xxxxxxxxxxxx.xxxxxxxxx.',
        count: 4401),
  ];
});

/// StateNotifierProvider
final stateNotifierProvider =
    StateNotifierProvider<RiverPodDemo, Demo>((ref) => RiverPodDemo());

class RiverPodDemo extends StateNotifier<Demo> {
  RiverPodDemo() : super(const Demo());

  void add(String name, int age) {
    state = Demo(name: name, age: age);
  }

  void reset() {
    state = const Demo();
  }
}

/// デモ用のクラス
class Demo {
  const Demo({this.name = '', this.age = 0});

  final String name;
  final int age;
}

class SampleModel {
  const SampleModel({
    required this.name,
    required this.text,
    required this.count,
  });

  final String name;
  final String text;
  final int count;
}
