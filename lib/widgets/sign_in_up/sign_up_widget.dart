import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:usound/assets/colors.dart';
import 'package:usound/assets/fonts.dart';

final _firebase = FirebaseAuth.instance;

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({required this.isSignIn, super.key});

  final void Function() isSignIn;

  @override
  State<SignUpWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignUpWidget> {
  var _passwordVisible = false;
  var _repasswordVisible = false;
  var _checkRePassword = '';

  var _enteredEmail = '';
  var _enteredPassword = '';
  var _enteredRePassword = '';

  final _formKey = GlobalKey<FormState>();

  void _submit() async {
    var isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();
    try {
      final userCredential = await _firebase.createUserWithEmailAndPassword(
        email: _enteredEmail,
        password: _enteredRePassword,
      );
      print(userCredential);
    } on FirebaseAuthException catch (e) {
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
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Create your account',
            style: textLargeStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          TextFormField(
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
              _enteredEmail = value!;
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
              label: const Text('New Password'),
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
              _checkRePassword = value;
              return null;
            },
            onSaved: (value) {
              _enteredPassword = value!;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            obscureText: !_repasswordVisible,
            decoration: InputDecoration(
              hintText: 'Re-enter your password',
              hintStyle: const TextStyle(
                color: hintTextColor,
              ),
              label: const Text('Confirm Password'),
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
                    _repasswordVisible = !_repasswordVisible;
                  });
                },
                icon: _repasswordVisible
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  value.trim().length < 6 ||
                  _checkRePassword != value) {
                return 'Password must be at least 6 charaters long or Password does not match!';
              }
              return null;
            },
            onSaved: (value) {
              _enteredRePassword = value!;
            },
          ),
          //Căn chỉnh trong column
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(0),
                animationDuration: Duration.zero,
              ),
              onPressed: widget.isSignIn,
              child: Text(
                'Have an account? Sign In',
                style: textSmallStyle.copyWith(
                  color: subtitleColor,
                ),
                textAlign: TextAlign.end,
              ),
            ),
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
              'Sign up',
              style: textNormalStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
