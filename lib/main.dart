import 'package:flutter/material.dart';
import 'package:new_year_countdown/screens/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'New Year CountDown',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: "New Year Countdown"),
      debugShowCheckedModeBanner: false,
    ),
  );
}
