import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies/model/firebase/auth_service.dart';
import 'package:movies/my_theme.dart';
import 'package:movies/model/firebase/firebase_collection.dart';
import 'package:movies/ui/login_signup_screen/register_screen.dart';
import 'package:movies/ui/login_signup_screen/switch_remeberMe.dart';
import 'package:movies/ui/shared/page_route.dart';
import 'package:movies/ui/shared/text_utils.dart';

import '../../controllers/remember_me_ctrl.dart';
import '../main_screen.dart';
import '../profile_screen/change_password_screen.dart';
import '../shared/dialogs.dart';
import 'my_password_form.dart';
import 'my_text_form.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "Register-screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPassword = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Icon icon = const Icon(
    Icons.visibility_off_outlined,
    color: Colors.grey,
  );
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      // "assets/images/moviecoo-logo.png",
                      "assets/images/logo_no_background.png",
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                  ),
                  const SizedBox(height: 10),
                  MyTextForm(
                    validator: (email) {
                      return TextUtils.checkEmail(email!);
                    },
                    icon: Icons.email_rounded,
                    hintName: 'Email',
                    controller: emailController,
                  ),
                  MyPasswordForm(
                    validator: (password) {
                      return TextUtils.checkPassword(password!);
                    },
                    controller: passwordController,
                  ),
                  Row(
                    children: [
                      SwitchRememberMe(),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.all(16),
                        child: TextButton(
                            onPressed: () {
                              DialogUtils.showBottomSheet(
                                  context, ChangePasswordScreen());
                            },
                            child: Text(
                              "Forget Password?",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.7)),
                            )),
                      ),
                    ],
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      width: MediaQuery.of(context).size.width / 2,
                      child: ElevatedButton(
                        onPressed: () {
                          clickOnSignIn();
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                //<-- SEE HERE
                                return Theme.of(context)
                                    .primaryColor; // Defer to the widget's default.
                              },
                            ),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: BorderSide.none))),
                        child: const Text("LOGIN"),
                      )),
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: const Divider(
                              height: 1,
                              color: Colors.white,
                              thickness: 1,
                            ),
                          ),
                        ),
                        const Text(
                          "OR",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: const Divider(
                              height: 1,
                              color: Colors.white,
                              thickness: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Spacer(),
                        Theme(
                          data: ThemeData(
                            splashColor: Colors.transparent,
                          ),
                          child: InkWell(
                            onTap: () => clickOnSignInWithGoogle(),
                            child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    color: MyTheme.secondColor,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Image.asset(
                                  "assets/images/google.png",
                                  height: 40,
                                )),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            clickOnSignInWithFacebook();
                          },
                          child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: MyTheme.secondColor,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Image.asset(
                                "assets/images/facebook.png",
                                height: 40,
                              )),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don’t have an account? ",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      TextButton(
                          onPressed: () {
                            clickOnRegisterScreen();
                          },
                          child: Text(
                            "Register now",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  clickOnRegisterScreen() {
    Navigator.pushReplacement(
        context, PageRouteUtils.createRoute(RegisterScreen(), 1.0, 0.0));
  }

  clickOnSignIn() async {
    DialogUtils.showLoadingDialog(context);

    if (formKey.currentState?.validate() == false) {
      Navigator.pop(context);
      return;
    }
    var check = await AuthService.signInWithEmailAndPassword(
        emailController.text, passwordController.text);

    // ignore: use_build_context_synchronously
    // ignore: use_build_context_synchronously
    Navigator.pop(context);

    if (check == 0) {
      // ignore: use_build_context_synchronously
      // Navigator.pushReplacement(
      //     context, PageRouteUtils.createRoute(const MainScreen(), 1.0, 0.0));
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          context,
          PageRouteUtils.createRoute(const MainScreen(), 1.0, 0.0),
          (route) => false);
    } else if (check == 1) {
      // ignore: use_build_context_synchronously
      var alert = DialogUtils.getShowMessage("User Not Found", context, () {
        Navigator.pop(context);
      }, () {});
      // ignore: use_build_context_synchronously
      showDialog(context: context, builder: (context) => alert);
    } else if (check == 2) {
      // ignore: use_build_context_synchronously
      var alert = DialogUtils.getShowMessage("Wrong Password", context, () {
        Navigator.pop(context);
      }, () {});
      // ignore: use_build_context_synchronously
      showDialog(context: context, builder: (context) => alert);
    }
  }

  clickOnSignInWithGoogle() async {
    var check = await AuthService.signInWithGoogle();
    if (check) {
      await RememberMeCtrl.setRememberMeState(true);
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          context,
          PageRouteUtils.createRoute(const MainScreen(), 1.0, 0.0),
              (route) => false);
    } else {
      Fluttertoast.showToast(
          msg: "Some thing went wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  clickOnSignInWithFacebook() async {
    var check = await AuthService.signInWithFacebook();
    if (check == 0) {
      await RememberMeCtrl.setRememberMeState(true);
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          context,
          PageRouteUtils.createRoute(const MainScreen(), 1.0, 0.0),
              (route) => false);
    } else {
      Fluttertoast.showToast(
          msg: "This email already Existing with different method",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
