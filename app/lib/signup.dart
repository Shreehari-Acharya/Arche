import 'package:flutter/material.dart';
import 'onboarding.dart';  // 🔥 Navigate here after Create Account

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool agreeTerms = false;
  bool showPassword = false;
  bool showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF7F4FF),
              Color(0xFFEFF4FF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                // BACK TO HOME
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text(
                    "← Back to Home",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // LOGO + CREATE ACCOUNT
                Center(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [Color(0xFF6A5AE0), Color(0xFF9C4BFF)],
                          ),
                        ),
                        child: const Icon(Icons.auto_graph,
                            size: 40, color: Colors.white),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "Join Arche and start your learning journey",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                // GOOGLE BUTTON
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 22,
                          height: 22,
                          child: Image.network(
                            // stable PNG thumbnail from Wikimedia
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/512px-Google_%22G%22_Logo.svg.png",
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.g_mobiledata, size: 20, color: Colors.red),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Flexible(
                          child: Text(
                            "Continue with Google",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                // DIVIDER
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Or sign up with email",
                          style: TextStyle(color: Colors.black54)),
                    ),
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                  ],
                ),

                const SizedBox(height: 22),

                // FULL NAME
                _label("Full Name"),
                _textField(hint: "Enter your name", icon: Icons.person),

                const SizedBox(height: 18),

                // EMAIL
                _label("Email Address"),
                _textField(hint: "you@example.com", icon: Icons.email),

                const SizedBox(height: 18),

                // PASSWORD
                _label("Password"),
                _passwordField(
                  hint: "Create a strong password",
                  isVisible: showPassword,
                  onToggle: () => setState(() => showPassword = !showPassword),
                ),

                const SizedBox(height: 18),

                // CONFIRM PASSWORD
                _label("Confirm Password"),
                _passwordField(
                  hint: "Confirm your password",
                  isVisible: showConfirmPassword,
                  onToggle: () => setState(() =>
                      showConfirmPassword = !showConfirmPassword),
                ),

                const SizedBox(height: 18),

                // TERMS — use Wrap to avoid horizontal overflow on small screens
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 4,
                  children: [
                    Checkbox(
                      value: agreeTerms,
                      activeColor: const Color(0xFF6A5AE0),
                      onChanged: (v) => setState(() => agreeTerms = v!),
                    ),
                    const Text("I agree to the "),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Terms and Conditions",
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                    const Text(" and "),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Privacy Policy",
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 22),

                // CREATE ACCOUNT → ONBOARDING
                GestureDetector(
                  onTap: () {
                    if (!agreeTerms) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please agree to the terms first."),
                        ),
                      );
                      return;
                    }

                    // 🔥 Navigate to Onboarding
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF4A8CFF), Color(0xFF9B4CFF)],
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // LABEL WIDGET
  Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 15,
      ),
    );
  }

  // TEXT FIELD
  Widget _textField({required String hint, required IconData icon}) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          prefixIcon: Icon(icon, color: Colors.grey),
        ),
      ),
    );
  }

  // PASSWORD FIELD
  Widget _passwordField({
    required String hint,
    required bool isVisible,
    required VoidCallback onToggle,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextField(
        obscureText: !isVisible,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          prefixIcon: const Icon(Icons.lock, color: Colors.grey),
          suffixIcon: GestureDetector(
            onTap: onToggle,
            child: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
