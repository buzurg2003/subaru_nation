import 'package:flutter/material.dart';

import 'package:subaru_nation/features/auth/presentation/components/my_text_field.dart';
import 'package:subaru_nation/features/auth/presentation/components/my_button.dart';
import 'package:subaru_nation/features/auth/presentation/pages/home_page/HomePage.dart';

// ! Login Page Widget
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  // ! Constants
  static const double _horizontalPadding = 16.0;
  static const double _inputFieldSpacing = 16.0;
  static const double _socialIconSize = 70.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildLoginForm(context),
        ],
      ),
    );
  }

  // ! Login Form Widget
  Widget _buildLoginForm(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: _horizontalPadding
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              const _Logo(),
              const SizedBox(height: 16),
              const _WelcomeText(),
              const SizedBox(height: 16),
              _buildTextInputField(
                emailController, 
                'Email', 
                TextInputType.emailAddress
              ),
              const SizedBox(height: _inputFieldSpacing),
              _buildPasswordInputField(
                passwordController,
                'Password',
                TextInputType.visiblePassword
              ),
              const SizedBox(height: _inputFieldSpacing),
              _buildLoginButton(context),
              const SizedBox(height: _inputFieldSpacing),
              _buildForgotPasswordButton(),
              const SizedBox(height: 1),
              _buildSignUpButton(),
              const SizedBox(height: 1),
              const _OrSignInWithText(),
              const SizedBox(height: _inputFieldSpacing),
              const _SocialLoginRow(),
            ],
          ),
        ),
      ),
    );
  }

  // ! Background Image Widget
  Widget _buildBackgroundImage() {
    return Positioned.fill(
      child: Image.asset(
        'lib/assets/background.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  // ! Text Input Field Widget
  Widget _buildTextInputField(
    TextEditingController controller, 
    String hintText, 
    TextInputType inputType
  ) {
    return MyTextField(
      controller: controller, 
      hintText: hintText, 
      obscureText: false  
    );
  }

  // ! Password Input Field Widget
  Widget _buildPasswordInputField(
    TextEditingController controller,
    String hintText,
    TextInputType inputType
  ) {
    return MyTextField(
      controller: controller, 
      hintText: hintText,
      obscureText: true,
    );
  }

  // ! Login Button Widget
  Widget _buildLoginButton(BuildContext context) {
    return MyButton(
      text: 'Login',
      onTap: () => _handleLogin(context),
    );
  }

  // ! Handle Login Logic
  void _handleLogin(BuildContext context) {
    final email = emailController.text;
    final password = passwordController.text;
    if (email == "test@gmail.com" && password == "test") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else if(email == "" && password == "") {
      _showEmptyLoginAndPasswordDialog(context);
    } else {
      _showLoginErrorDialog(context);
    }
  }

  // ! Show Error Dialog
  void _showLoginErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Incorrect Login or Password'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  // ! Show Empty Login and/or Password Dialog
  void _showEmptyLoginAndPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Fields are empty'),
          content: const Text('Please enter Login and Password'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  // ! Forgot Password Button Widget
  Widget _buildForgotPasswordButton() {
    return TextButton(
      onPressed: () {
        _showForgotPasswordDialog(context);
      },
      child: const Text(
        'Forgot Password?',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  // ! Show Forgot Password Dialog
  void _showForgotPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Email'),
          content: TextField(
            decoration: const InputDecoration(
              hintText: 'Enter your email'
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Send'),
            ),
          ],
        );
      },
    );
  }

  // ! Sign Up Button Widget
  Widget _buildSignUpButton() {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/signup_page');
      },
      child: const Text(
        'Don\'t have an account? Sign Up',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

// ! Logo Widget
class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        'lib/assets/logo.png',
        width: 150,
        height: 150,
      ),
    );
  }
}

// ! Welcome Text Widget
class _WelcomeText extends StatelessWidget {
  const _WelcomeText();

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
          'Login to your account',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

// ! Or Sign In With Text Widget
class _OrSignInWithText extends StatelessWidget {
  const _OrSignInWithText();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Or sign in with',
      style: TextStyle(color: Colors.white),
    );
  }
}

// ! Social Login Row Widget
class _SocialLoginRow extends StatelessWidget {
  const _SocialLoginRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialIcon('lib/assets/facebook.png'),
        _buildSocialIcon('lib/assets/google.png'),
        _buildSocialIcon('lib/assets/threads.png'),
      ],
    );
  }

  static Widget _buildSocialIcon(String assetPath) {
    return SizedBox(
      width: _LoginPageState._socialIconSize,
      height: _LoginPageState._socialIconSize,
      child: IconButton(
        icon: Image.asset(assetPath),
        onPressed: () {
          // Add social login logic
        },
      ),
    );
  }
}
