import 'dart:ui';
import 'package:flutter/material.dart';

class RamadhanFeatureSection extends StatelessWidget {
  final VoidCallback onInputItikaf;
  final VoidCallback onInputAbsen;
  final VoidCallback onDashboard;

  const RamadhanFeatureSection({
    super.key,
    required this.onInputItikaf,
    required this.onInputAbsen,
    required this.onDashboard,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Fitur Ramadhan",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 20),

        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            _featureCard(
              icon: Icons.mosque,
              title: "Input Itikaf",
              desc: "Input peserta yang mengikuti i'tikaf",
              onTap: onInputItikaf,
            ),

            _featureCard(
              icon: Icons.fact_check,
              title: "Input Absen",
              desc: "Absensi peserta i'tikaf",
              onTap: onInputAbsen,
            ),

            _featureCard(
              icon: Icons.dashboard,
              title: "Dashboard",
              desc: "Monitoring kegiatan Ramadhan",
              onTap: onDashboard,
            ),
          ],
        ),
      ],
    );
  }

  Widget _featureCard({
    required IconData icon,
    required String title,
    required String desc,
    required VoidCallback onTap,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: 260,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.3)),
            ),
            child: Column(
              children: [
                Icon(icon, size: 50, color: Colors.greenAccent),

                const SizedBox(height: 12),

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  desc,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
