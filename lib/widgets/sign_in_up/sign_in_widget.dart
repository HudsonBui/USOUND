import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:usound/assets/colors.dart';
import 'package:usound/assets/fonts.dart';

final FirebaseAuth _firebase = FirebaseAuth.instance;

class SignInWidget extends StatefulWidget {
  const SignInWidget({required this.isSignIn, super.key});
  final void Function() isSignIn;

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final _formKey = GlobalKey<FormState>();

  var _passwordVisible = false;
  var _enterEmail = '';
  var _enterPassword = '';

  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    try {
      //final userCredential =
      await _firebase.signInWithEmailAndPassword(
        email: _enterEmail,
        password: _enterPassword,
      );
      //print(userCredential);
      print('Sign-in successful');
      setState(() {});
    } on FirebaseAuthException catch (e) {
      print('Sign-in failed: ${e.message}');
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'Authentication Failed.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, //Sử dụng formkey để có thể truy cập được vào form
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Login to your account',
            style: textLargeStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          TextFormField(
            autocorrect: false,
            decoration: InputDecoration(
              hintText: 'hudson0123@gmail.com',
              hintStyle: const TextStyle(color: hintTextColor),
              label: const Text('Email'),
              labelStyle: const TextStyle(
                color: hintTextColor,
              ),
              contentPadding: const EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.white,
              filled: true,
            ),
            validator: (value) {
              if (value == null ||
                  value.trim().isEmpty ||
                  !value.contains('@')) {
                return 'Please enter a valid email address!';
              }
              return null;
            },
            onSaved: (value) {
              _enterEmail = value!;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              hintText: 'Enter your password',
              hintStyle: const TextStyle(
                color: hintTextColor,
              ),
              label: const Text('Password'),
              labelStyle: const TextStyle(
                color: hintTextColor,
              ),
              contentPadding: const EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.white,
              filled: true,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
                icon: _passwordVisible
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().length < 6) {
                return 'Password must be at least 6 charaters long!';
              }

              return null;
            },
            onSaved: (value) {
              _enterPassword = value!;
            },
          ),
          //Căn chỉnh trong column
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: widget.isSignIn,
                child: Text(
                  'Create an account',
                  style: textSmallLightStyle.copyWith(color: subtitleColor),
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  animationDuration: Duration.zero,
                ),
                onPressed: () {},
                child: Text(
                  'Forget password?',
                  style: textSmallLightStyle.copyWith(
                    color: subtitleColor,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _submit,
            style: ElevatedButton.styleFrom(
              backgroundColor: subtitleColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Sign in',
              style: textNormalStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
