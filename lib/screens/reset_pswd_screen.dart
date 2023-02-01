import 'package:flutter/material.dart';
import 'package:pswdforget/button.dart';
import 'package:pswdforget/constants.dart';
import 'package:pswdforget/screens/check_email_screen.dart';

class ResetPswdScreen extends StatelessWidget {
  ResetPswdScreen({Key? key}) : super(key: key);
  String email = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 15.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.arrow_back),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('Back'),
                  const Spacer(),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                        color: mainClr,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.question_mark_rounded,
                        color: mainClr,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25.0),
              const Text(
                'Reset password',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Enter the email associated with your account and we will send you an email with instructions to reset your password.',
              ),
              const SizedBox(height: 20.0),
              const Text('Email address'),
              const SizedBox(height: 10.0),
              TextField(
                cursorColor: mainClr,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white24,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: mainClr,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.0,
                      color: mainClr,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  hintStyle: TextStyle(
                    color: mainClr,
                    fontSize: 15.0,
                    letterSpacing: 1,
                  ),
                  hintTextDirection: TextDirection.rtl,
                  contentPadding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                ),
              ),
              const SizedBox(height: 15.0),
              Center(
                child: Button(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CheckEmailScreen(),
                      ),
                    );
                  },
                  label: 'Send Instructions',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
