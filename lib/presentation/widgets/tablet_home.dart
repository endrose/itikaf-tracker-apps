import 'package:flutter/material.dart';
import 'app_drawer.dart';

class TabletHome extends StatefulWidget {
  const TabletHome({super.key});

  @override
  State<TabletHome> createState() => _TabletHomeState();
}

class _TabletHomeState extends State<TabletHome> {
  int selectedIndex = 0;

  final pages = const [
    Center(child: Text("Home")),
    Center(child: Text("Input Itikaf")),
    Center(child: Text("Absensi")),
    Center(child: Text("Dashboard")),
  ];

  void selectMenu(int index) {
    setState(() {
      selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Itikaf Tracker")),
      drawer: AppDrawer(onSelect: selectMenu),
      body: pages[selectedIndex],
    );
  }
}
