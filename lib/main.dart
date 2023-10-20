import 'package:flutter/material.dart';
import 'package:flutter_testing_app/views/screens/homepage.dart';

void main() {
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context)=> const Home_page(),
      },
    ),
  );
}
