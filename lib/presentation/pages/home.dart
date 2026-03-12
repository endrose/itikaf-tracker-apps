import 'package:flutter/material.dart';
import 'package:itikaf_tracker/common/helper/layouts/responsive.dart';
import 'package:itikaf_tracker/presentation/widgets/desktop_home.dart';
import 'package:itikaf_tracker/presentation/widgets/mobile_home.dart';
import 'package:itikaf_tracker/presentation/widgets/tablet_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileHome(),
      tablet: TabletHome(),
      desktop: DesktopHome(),
    );
  }
}
