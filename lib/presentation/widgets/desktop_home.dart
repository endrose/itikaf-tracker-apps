import 'package:flutter/material.dart';
import 'app_drawer.dart';

class DesktopHome extends StatefulWidget {
  const DesktopHome({super.key});

  @override
  State<DesktopHome> createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          /// SIDEBAR
          AppDrawer(onSelect: selectMenu),

          /// CONTENT
          Expanded(child: pages[selectedIndex]),
        ],
      ),
    );
  }
}
