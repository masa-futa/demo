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
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text('Demo'),
          ),
          body: const DemoPage()),
    );
  }
}

class DemoPage extends HookConsumerWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(futureProvider).when(
          data: (data) => ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Card(
                color: Colors.grey.shade800,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index].name,
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          data[index].text,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(height: 15),
                        Row(children: [
                          const Icon(
                            Icons.star,
                            size: 12,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${data[index].count}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ])
                      ]),
                ),
              ),
            ),
            itemCount: data.length,
          ),
          error: (error, status) => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
