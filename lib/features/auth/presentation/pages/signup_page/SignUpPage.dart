import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  // Constants
  static const double _horizontalPadding = 16.0;
  static const double _inputFieldSpacing = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildSignUpForm(context),
          _buildBackButton(),
        ],
      ),
    );
  }

  // Back Button Widget
  Widget _buildBackButton() {
    return Positioned(
      top: 40,
      left: 16, 
      child: BackButton(
        color: Colors.white,
      ),
    );
  }

  // SignUp Form Widget
  Widget _buildSignUpForm(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const _CreateYourAccountText(),
              const SizedBox(height: 16),
              _buildTextInputField(
                emailController, 
                'Email', 
                TextInputType.emailAddress,
              ),
              const SizedBox(height: _inputFieldSpacing),
              _buildPasswordInputField(),
              const SizedBox(height: _inputFieldSpacing),
              _buildSignUpButton(context),
            ],
          ),
        ),
      ),
    );
  }

  // Background Image Widget
  Widget _buildBackgroundImage() {
    return Positioned.fill(
      child: Image.asset(
        'lib/assets/background.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  // Text Input Field Widget
  Widget _buildTextInputField(
    TextEditingController controller, 
    String hintText, 
    TextInputType inputType
  ) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.black.withOpacity(0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  // Password Input Field Widget
  Widget _buildPasswordInputField() {
    return TextField(
      controller: passwordController,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Password',
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.black.withOpacity(0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.white,
          ),
          onPressed: () => setState(() => obscureText = !obscureText),
        ),
      ),
    );
  }

  // Sign Up Button Widget
  Widget _buildSignUpButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Handle sign-up logic here
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text('Sign Up'),
      ),
    );
  }
}

// Welcome Text Widget
class _CreateYourAccountText extends StatelessWidget {
  const _CreateYourAccountText();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Subaru Nation',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Create your account',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
