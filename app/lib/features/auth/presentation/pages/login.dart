import 'package:app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:app/features/auth/presentation/bloc/auth_event.dart';
import 'package:app/features/auth/presentation/bloc/auth_state.dart';
import 'package:app/features/auth/presentation/widgets/auth_button.dart';
import 'package:app/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:app/features/auth/presentation/widgets/auth_password_field.dart';
import 'package:app/features/auth/presentation/widgets/login_prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onLogin() {
    BlocProvider.of<AuthBloc>(context).add(
      LoginEvent(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF5F3FF), Color(0xFFEFF1FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              
              // -----------------------------
              // HEADER
              // -----------------------------
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'lib/assets/logo.png',
                      height: 45,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Sign in to continue your learning journey",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // -----------------------------
              // EMAIL FIELD
              // -----------------------------
              _label("Email Address"),
              AuthInputField(
                hint: "you@example.com",
                icon: Icons.email,
                controller: _emailController,
              ),
              const SizedBox(height: 18),

              // -----------------------------
              // PASSWORD FIELD
              // -----------------------------
              _label("Password"),
              AuthPasswordField(
                hint: "Enter your password",
                controller: _passwordController,
                isVisible: showPassword,
                onToggle: () => setState(() => showPassword = !showPassword),
              ),

              const SizedBox(height: 22),

              // -----------------------------
              // LOGIN BUTTON + BLOC
              // -----------------------------
              BlocConsumer<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return AuthButton(text: "Login", onPressed: _onLogin);
                },
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    // Clear all previous routes and go to app shell
                    // This prevents back navigation to login/signup pages
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/arche',
                      (route) => false,
                    );
                  } else if (state is AuthFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error)),
                    );
                  }
                },
              ),

              const SizedBox(height: 5),

              // -----------------------------
              // SIGN UP PROMPT
              // -----------------------------
              LoginPrompt(
                text: "Don't have an account? Create account",
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // LABEL
  Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
    );
  }
}
