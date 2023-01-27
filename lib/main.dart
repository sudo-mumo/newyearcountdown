import 'package:flutter/material.dart';
import 'package:new_year_countdown/screens/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'New Year CountDown',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Layouts(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Layouts extends StatefulWidget {
  const Layouts({super.key});

  @override
  LayoutsState createState() => LayoutsState();
}

class LayoutsState extends State<Layouts> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return const DesktopLayout();
        } else if (constraints.maxWidth > 600) {
          return const TabletLayout();
        } else {
          return const MobileLayout();
        }
      },
    );
  }
}

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage(title: "New Year Countdown");
  }
}

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage(title: "New Year Countdown");
  }
}

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage(title: "New Year Countdown");
  }
}
