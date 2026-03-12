import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:itikaf_tracker/common/helper/layouts/responsive.dart';
import 'package:itikaf_tracker/presentation/widgets/custom_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// TITLE
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Masukkan username dan password untuk login',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
              SizedBox(height: 24.0),

              /// EMAIL
              CustomTextField(label: 'Username', controller: emailController),

              const SizedBox(height: 24.0),

              /// PASSWORD
              CustomTextField(
                label: 'Password',
                controller: passwordController,
                isObscure: true,
              ),

              const SizedBox(height: 24.0),

              /// LOGIN BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Masuk',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20.0),

              //klo dia versi mobile saja muncul ini
              if (Responsive.isMobile(context))
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      hoverColor: Colors.transparent,
                      onTap: () {
                        Navigator.pushNamed(context, "/dashboard");
                      },
                      child: const Text(
                        "Go to Dashboard Itikaf",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ),
                  ],
                ),

              // const SizedBox(height: 20.0),
            ],
          ),
        
    );
  }
}
