import 'package:flutter/material.dart';
import 'shopping_app.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 5,
          title: const Text(
            'My Bag',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
              ),
              onPressed: () {
                // Add your onPressed logic here
              },
              color: Colors.black,
              iconSize: 28,
            ),
          ],
        ),
        body: const ShoppingApp(),
      ),
    );
  }
}
