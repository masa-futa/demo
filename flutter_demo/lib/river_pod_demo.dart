import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Provider
final provider = Provider<String>((ref) => throw UnimplementedError());

/// StateProvider
final stateProvider = StateProvider<int>((ref) => 0);

/// FutureProvider
final futureProvider = FutureProvider.autoDispose<String>((ref) async {
  await Future.delayed(const Duration(milliseconds: 300));
  return "hello";
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
