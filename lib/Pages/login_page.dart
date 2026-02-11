import 'package:flutter/material.dart';
import 'package:next_offer/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSignUp = false;
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF020617), Color(0xFF0A0F2C), Color(0xFF121B3A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: 420,
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white10),
                gradient: const LinearGradient(
                  colors: [Color(0xFF0B1120), Color(0xFF0A0F2C)],
                ),
              ),
              child: Column(
                children: [
                  /// logo
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF22D3EE), Color(0xFF8B5CF6)],
                      ),
                    ),
                    child: const Icon(
                      Icons.school,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "PlaceTrack",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    isSignUp
                        ? "Create account to continue"
                        : "Welcome back! Sign in to continue.",
                    style: const TextStyle(color: Colors.white60),
                  ),

                  const SizedBox(height: 25),

                  /// TOGGLE
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.black26,
                    ),
                    child: Row(
                      children: [
                        /// SIGN IN
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() => isSignUp = false);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: isSignUp
                                    ? Colors.transparent
                                    : Colors.black,
                              ),
                              child: Center(
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: isSignUp
                                        ? Colors.white60
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        /// SIGN UP
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() => isSignUp = true);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: isSignUp
                                    ? Colors.black
                                    : Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: isSignUp
                                        ? Colors.white
                                        : Colors.white60,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// SLIDE ANIMATION FORM
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder: (child, animation) {
                      final offsetAnimation = Tween<Offset>(
                        begin: const Offset(0.2, 0),
                        end: Offset.zero,
                      ).animate(animation);
                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                    child: isSignUp ? buildSignUpForm() : buildSignInForm(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// SIGN IN FORM
  Widget buildSignInForm() {
    return Column(
      key: const ValueKey("signin"),
      children: [
        fieldTitle("Email"),
        textField("you@college.edu", Icons.mail),
        const SizedBox(height: 18),

        fieldTitle("Password"),
        passwordField(),
        const SizedBox(height: 24),

        InkWell(
          child: mainButton("Sign In"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
      ],
    );
  }

  /// SIGN UP FORM
  Widget buildSignUpForm() {
    return Column(
      key: const ValueKey("signup"),
      children: [
        fieldTitle("Full Name"),
        textField("Your Name", Icons.person),
        const SizedBox(height: 18),

        fieldTitle("Email"),
        textField("you@college.edu", Icons.mail),
        const SizedBox(height: 18),

        fieldTitle("Password"),
        passwordField(),
        const SizedBox(height: 24),

        InkWell(
          child: mainButton("Create Account"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
      ],
    );
  }

  /// reusable widgets
  Widget fieldTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(title, style: const TextStyle(color: Colors.white70)),
    );
  }

  Widget textField(String hint, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white38),
          prefixIcon: Icon(icon, color: Colors.white54),
          filled: true,
          fillColor: const Color(0xFF020617),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget passwordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: TextField(
        obscureText: !showPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "••••••••",
          hintStyle: const TextStyle(color: Colors.white38),
          prefixIcon: const Icon(Icons.lock, color: Colors.white54),
          suffixIcon: IconButton(
            icon: Icon(
              showPassword ? Icons.visibility : Icons.visibility_off,
              color: Colors.white54,
            ),
            onPressed: () {
              setState(() => showPassword = !showPassword);
            },
          ),
          filled: true,
          fillColor: const Color(0xFF020617),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget mainButton(String text) {
    return Container(
      width: double.infinity,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          colors: [Color(0xFF2DD4BF), Color(0xFF3B82F6)],
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
