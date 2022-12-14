import 'package:cool_alert/cool_alert.dart';
import 'package:event_mobile_app/allChangeNotifer/AllChangeNotifer.dart';
import 'package:event_mobile_app/colors/colors.dart';
import 'package:event_mobile_app/controller/auth/loginController.dart';
import 'package:event_mobile_app/controller/userProfile/UserProfileController.dart';
import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/auth/resetPassword.dart';
import 'package:event_mobile_app/screen/auth/signUp.dart';
import 'package:event_mobile_app/screen/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppColors appColor = AppColors();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthController authController = AuthController();
  bool _isSecret = true;
  var isLoading = false;
  var textUsername = "";
  var textPassword = "";
  var _submitted = false;

  String? get _errorText {
    final text = authController.emailController.value.text;
    if (text.isEmpty) {
      return 'Ce champ est requis.';
    }
    // return null if the text is valid
    return null;
  }

  String? get _errorPassword {
    final textPass = authController.passController.value.text;
    if (textPass.isEmpty) {
      return 'Ce champ est requis.';
    }
    if (textPass.length < 7) {
      return 'Veillez saisir 8 au minimum.';
    }
    // return null if the text is valid
    return null;
  }

  void _submit() {
    setState(() => _submitted = true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          darkMode ? darkColor.firstBackground : lightColor.firstBackground,
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 50,
                ),
                SvgPicture.asset(
                  height: 50,
                  "assets/images/logo.svg",
                  semanticsLabel: "DuckEvent",
                ),
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  "Email*",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  onChanged: (text) => setState(() => textUsername),
                  controller: authController.emailController,
                  decoration: InputDecoration(
                    errorText: _submitted ? _errorText : null,
                    hintText: "Entrez votre email",
                    filled: true,
                    fillColor:
                        darkMode ? darkColor.InputColor : lightColor.InputColor,
                    enabledBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: darkMode
                            ? darkColor.InputColor
                            : lightColor.InputBorderColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: appColor.InputBorderColor,
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                      color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Mot de passe*",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {
                        Provider.of<AllChangeNotifier>(context, listen: false)
                            .changePage(DrawerSection.resetPasswordPage);
                      },
                      child: Text(
                        "Mot de passe oubli???",
                        style: TextStyle(
                            color: appColor.dGreen,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  obscureText: _isSecret,
                  controller: authController.passController,
                  onChanged: (textPass) => setState(() => textPassword),
                  style: TextStyle(
                      color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:
                        darkMode ? darkColor.InputColor : lightColor.InputColor,
                    errorText: _submitted ? _errorPassword : null,
                    hintText: 'Entrez votre mot de passe',
                    enabledBorder: OutlineInputBorder(
                        //Outline border type for TextFeild
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                        borderSide: BorderSide(
                          color: darkMode
                              ? darkColor.InputColor
                              : lightColor.InputBorderColor,
                        )),
                    focusedBorder: OutlineInputBorder(
                        //Outline border type for TextFeild
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                        borderSide: BorderSide(
                          color: appColor.InputBorderColor,
                        )),
                    errorBorder: const OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.red,
                      ),
                    ),
                    suffixIcon: InkWell(
                      onTap: () => setState(() => _isSecret = !_isSecret),
                      child: Icon(
                        !_isSecret ? Icons.visibility : Icons.visibility_off,
                        color: appColor.dGrey,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                  onPressed: () async {
                    _submit();

                    if (authController.emailController.value.text.isNotEmpty &&
                        authController.passController.text.length >= 8) {
                      setState(() => isLoading = true);
                      await authController.loginUser(context);
                      setState(() => isLoading = false);

                      authController.openModal
                          ? CoolAlert.show(
                              title: authController.modalTitle,
                              backgroundColor: Colors.white,
                              context: context,
                              type: authController.modalStatus
                                  ? CoolAlertType.success
                                  : CoolAlertType.error,
                              text: authController.modalMessage,
                              confirmBtnColor: appColor.dGreen,
                            )
                          : 0;
                    } else {}
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColor.dGreen,
                    padding: const EdgeInsets.all(20),
                    elevation: 1.0,
                  ),
                  child: isLoading
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(color: Colors.white),
                            SizedBox(width: 14),
                            Text(
                              'Veuillez  patienter...',
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Text(
                                "Connexion",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: darkMode
                                        ? darkColor.dWhite
                                        : lightColor.dWhite),
                              ),
                              Icon(
                                Icons.login,
                                size: 20,
                                color: darkMode
                                    ? darkColor.dWhite
                                    : lightColor.dWhite,
                              )
                            ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await authController.googleSignIn(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        darkMode ? darkColor.InputColor : lightColor.dWhite,
                    elevation: 1.0,
                    padding: const EdgeInsets.all(20),
                  ),
                  child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              SvgPicture.asset(
                                  height: 20, 'assets/images/google.svg'),
                              const SizedBox(width: 5),
                              Text(
                                "Connectez vous avec Google",
                                style: TextStyle(
                                    color: darkMode
                                        ? lightColor.dWhite
                                        : darkColor.dWhite,
                                    fontSize: 16),
                              )
                            ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await authController.loginFacebook(context);
                    setState(() => isLoading = false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        darkMode ? darkColor.InputColor : lightColor.dWhite,
                    elevation: 1.0,
                    padding: const EdgeInsets.all(20),
                  ),
                  child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              const FaIcon(
                                FontAwesomeIcons.facebook,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Connectez vous avec Facebook",
                                style: TextStyle(
                                    color: darkMode
                                        ? lightColor.dWhite
                                        : darkColor.dWhite,
                                    fontSize: 16),
                              )
                            ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Avez-vous un compte ?"),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        Provider.of<AllChangeNotifier>(context, listen: false)
                            .changePage(DrawerSection.singUpPage);
                        print("change page");
                      },
                      child: Text('Inscription',
                          style: TextStyle(color: appColor.dGreen)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
