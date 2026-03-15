import 'package:flutter/material.dart';
import 'package:itikaf_tracker/presentation/pages/absen.dart';
import 'package:itikaf_tracker/presentation/pages/itikaf.dart';
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
    ItikafPage(),
    AbsenPage(),
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
          AppDrawer(onSelect: selectMenu),

          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              color: Colors.grey[100],
              child: pages[selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}
