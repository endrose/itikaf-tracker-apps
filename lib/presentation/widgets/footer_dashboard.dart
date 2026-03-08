import 'package:flutter/material.dart';
import 'package:itikaf_tracker/core/configs/configs.dart';

class FooterDashboard extends StatelessWidget {
  const FooterDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.black12)),
      ),
      child: Column(
        children: [
          Text(
            "© ${DateTime.now().year} ${Configs.appName}",
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          //icon love
          const Text(
            Configs.footerName,
            style: TextStyle(fontSize: 11, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
