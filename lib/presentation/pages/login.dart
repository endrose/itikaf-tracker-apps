import 'package:flutter/material.dart';
import 'package:itikaf_tracker/common/helper/layouts/responsive.dart';
import 'package:itikaf_tracker/core/configs/configs.dart';
import 'package:itikaf_tracker/presentation/pages/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _buildMobile(),
      tablet: _buildTablet(),
      desktop: _buildDesktop(),
    );
  }

  /// ✅ Mobile Layout
  Widget _buildMobile() {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: _loginCard(width: double.infinity),
        ),
      ),
    );
  }

  /// ✅ Tablet Layout
  Widget _buildTablet() {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
          child: _loginCard(width: 500),
        ),
      ),
    );
  }

  /// ✅ Desktop Layout (Split Screen)
  Widget _buildDesktop() {
    return Scaffold(
      body: Row(
        children: [
          /// Left section - Banner / Illustration
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade400, Colors.blue.shade900],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.mosque_outlined,
                          color: Colors.white,
                          size: 48,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          Configs.appName,
                          style: const TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    /// 🔗 Link ke Dashboard new page
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/dashboard");
                      },
                      child: const Text(
                        "Go to Dashboard Itikaf",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Right section - Login Form
          Expanded(
            flex: 2,
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(48),
                child: _loginCard(width: 400),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ✅ Reusable Login Card
  Widget _loginCard({required double width}) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: const LoginForm(), // Form login terpisah
    );
  }
}
