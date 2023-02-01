import 'package:flutter/material.dart';
import 'package:pswdforget/button.dart';
import 'package:pswdforget/constants.dart';

class NewPswdScreen extends StatefulWidget {
  const NewPswdScreen({Key? key}) : super(key: key);

  @override
  State<NewPswdScreen> createState() => _NewPswdScreenState();
}

class _NewPswdScreenState extends State<NewPswdScreen> {
  bool hiddenPswd = true;
  String _pswd = '', _confPswd = '';

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
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.arrow_back),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Back'),
                      ],
                    ),
                  ),
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
                'Create new password',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Your new password must be different\nfrom previous used passwords.',
              ),
              const SizedBox(height: 20.0),
              const Text('Password'),
              const SizedBox(height: 10.0),
              TextField(
                obscureText: hiddenPswd,
                onChanged: (value) {
                  _pswd = value;
                },
                cursorColor: mainClr,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        hiddenPswd = !hiddenPswd;
                      });
                    },
                    child: Icon(
                      hiddenPswd ? Icons.visibility_off : Icons.visibility,
                      color: mainClr,
                    ),
                  ),
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
              const SizedBox(height: 5.0),
              Text(
                'Must be at least 8 characters',
                style: TextStyle(
                  color: mainClr,
                  fontSize: 11.0,
                ),
              ),
              const SizedBox(height: 15.0),
              const Text('Confirm password'),
              const SizedBox(height: 10.0),
              TextField(
                onChanged: (value) {
                  _confPswd = value;
                },
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: mainClr,
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
              const SizedBox(height: 5.0),
              Text(
                'Both password must match',
                style: TextStyle(
                  color: mainClr,
                  fontSize: 11.0,
                ),
              ),
              const SizedBox(height: 25.0),
              Center(
                child: Button(
                  onPressed: () {
                    if (validatePswd(_pswd, _confPswd)) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text(
                            'Password has been changed successfully',
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const SizedBox(
                                  width: 150.0,
                                  height: 40.0,
                                  child: Center(
                                    child: Text('OK'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text(
                            'Your password is wrong',
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const SizedBox(
                                  width: 150.0,
                                  height: 40.0,
                                  child: Center(
                                    child: Text(
                                      'Try again',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  label: 'Reset Password',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validatePswd(String pswd, String confPswd) =>
      pswd.length >= 8 && pswd == confPswd;
}
