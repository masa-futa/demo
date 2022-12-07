import 'package:flutter/material.dart';
import 'package:flutter_demo/river_pod_demo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: DemoPage()),
    );
  }
}

class DemoPage extends HookConsumerWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(futureProvider).when(
        data: (data) => ProviderScope(
            overrides: [provider.overrideWithValue('Hello')],
            child: Center(
              child: Text(
                ref.watch(provider),
              ),
            )),
        error: (error, status) => const SizedBox.shrink(),
        loading: () => const CircularProgressIndicator());
  }
}
