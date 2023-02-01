import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:pswdforget/button.dart';
import 'package:pswdforget/constants.dart';
import 'package:pswdforget/screens/new_pswd_screen.dart';
import 'package:pswdforget/screens/reset_pswd_screen.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({Key? key}) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(.15),
                ),
                child: Icon(
                  Icons.mark_email_read,
                  color: mainClr,
                  size: 65,
                ),
                //! child : SvgPciture.asset('assets/email.svg'),
              ),
              const SizedBox(height: 25),
              const Text(
                'Check your email',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'We have sent you a password recover\n instructions to your email',
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 35),
              Button(
                onPressed: () async {
                  // await OpenMailApp.openMailApp();
                  await LaunchApp.isAppInstalled(
                    androidPackageName: 'com.google.android.gm',
                    iosUrlScheme: 'gmail://',
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewPswdScreen(),
                    ),
                  );
                },
                label: 'Open Email App',
              ),
              const SizedBox(height: 25),
              const Text(
                'Skip, I will confirm later',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              const Text(
                'Did not recieve the email? Check your spam filter',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(' Or, '),
                  InkWell(
                    onTap: () {
                      while (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResetPswdScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Try another email address',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: mainClr,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
