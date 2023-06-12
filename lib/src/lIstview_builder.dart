import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'anotherlistview_builder.dart';
import 'list_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NumbersListProvider>(create: (_) => NumbersListProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print("rebuild again");
    return Consumer<NumbersListProvider>(builder: (context, providervalue, child) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
           providervalue.add();
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(parent: null),
                itemCount: providervalue.numbers.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.orange,
                    child: ListTile(
                      title: Text(providervalue.numbers[index].toString()),
                      trailing: const Icon(Icons.device_hub),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Ms()),
                );
              },
              child: const Text("next"),
            ),
          ],
        ),
      );
    });
  }
}
