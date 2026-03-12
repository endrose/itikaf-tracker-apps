import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final Function(int) onSelect;

  const AppDrawer({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: Center(
              child: Text(
                "Itikaf Tracker",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () => onSelect(0),
          ),

          ListTile(
            leading: const Icon(Icons.mosque),
            title: const Text("Input Itikaf"),
            onTap: () => onSelect(1),
          ),

          ListTile(
            leading: const Icon(Icons.fact_check),
            title: const Text("Absensi"),
            onTap: () => onSelect(2),
          ),

          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text("Dashboard"),
            onTap: () => onSelect(3),
          ),
        ],
      ),
    );
  }
}
