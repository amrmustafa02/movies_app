import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies/ui/login_signup_screen/my_text_form.dart';
import 'package:movies/ui/shared/text_utils.dart';

class ChangePasswordScreen extends StatelessWidget {
  TextEditingController emailText = TextEditingController();
  var formKey = GlobalKey<FormState>();

  ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 5,
            margin: const EdgeInsets.symmetric(horizontal: 100),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: formKey,
                  child: MyTextForm(
                    validator: (email) {
                      return TextUtils.checkEmail(email!);
                    },
                    controller: emailText,
                    icon: Icons.email_rounded,
                    hintName: 'Enter your email',
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                              //<-- SEE HERE
                              return Theme.of(context)
                                  .primaryColor; // Defer to the widget's default.
                            },
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide.none))),
                      onPressed: () {
                        // ignore: unrelated_type_equality_checks
                        if (formKey.currentState!.validate() == false) {
                          return;
                        }
                        FirebaseAuth.instance
                            .sendPasswordResetEmail(email: emailText.text);
                        Navigator.of(context).pop();
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text("Send Email"),
                        ],
                      )),
                )
              ],),
            ),
          )
        ],
      ),
    );
  }
}
