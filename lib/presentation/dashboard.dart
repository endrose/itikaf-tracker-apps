import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text(
          'Dashboard',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
