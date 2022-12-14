import 'package:cool_alert/cool_alert.dart';
import 'package:event_mobile_app/allChangeNotifer/AllChangeNotifer.dart';
import 'package:event_mobile_app/colors/colors.dart';
import 'package:event_mobile_app/controller/auth/loginController.dart';
import 'package:event_mobile_app/controller/auth/resetPasswordController.dart';
import 'package:event_mobile_app/screen/auth/login.dart';
import 'package:event_mobile_app/screen/auth/signUp.dart';
import 'package:event_mobile_app/screen/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppColors appColor = AppColors();

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  ResetPasswordController resetPasswordController = ResetPasswordController();
  bool _isSecret = true;
  var isLoading = false;
  var textUsername = "";
  var textPassword = "";
  var _submitted = false;

  String? get _errorText {
    final text = resetPasswordController.emailController.value.text;
    if (text.isEmpty) {
      return 'Ce champ est requis.';
    }
    // return null if the text is valid
    return null;
  }

  void _submit() {
    setState(() => _submitted = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                  controller: resetPasswordController.emailController,
                  decoration: InputDecoration(
                    errorText: _submitted ? _errorText : null,
                    hintText: "Entrez votre email",
                    filled: true,
                    fillColor:appColor.InputColor,
                    enabledBorder:  OutlineInputBorder(
                        //Outline border type for TextFeild
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                        borderSide: BorderSide(
                          color:appColor.InputBorderColor,
                        )),
                    focusedBorder:  OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color:appColor.InputBorderColor,
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
                ),
                const SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                  onPressed: () async {
                    _submit();

                    if (resetPasswordController
                        .emailController.value.text.isNotEmpty) {
                      setState(() => isLoading = true);
                      await resetPasswordController.resetUserPassword(context);
                      setState(() => isLoading = false);

                      resetPasswordController.openModal
                          ? CoolAlert.show(
                              title: resetPasswordController.modalTitle,
                              backgroundColor: Colors.white,
                              context: context,
                              type: resetPasswordController.modalStatus
                                  ? CoolAlertType.success
                                  : CoolAlertType.error,
                              text: resetPasswordController.modalMessage,
                              confirmBtnColor:appColor.dGreen,
                            )
                          : 0;
                    } else {}
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColor.dGreen,
                    padding: const EdgeInsets.all(20),
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
                          children: const [
                              Text(
                                "R??initialiser",
                                style: TextStyle(fontSize: 20),
                              ),
                              Icon(
                                Icons.login,
                                size: 20,
                              )
                            ]),
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                    onTap: () {
                      Provider.of<AllChangeNotifier>(context, listen: false)
                          .changePage(DrawerSection.loginPage);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Icon(
                          Icons.arrow_circle_left_outlined,
                          color:appColor.dGreen,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Revenir sur la page de connexion',
                            style: TextStyle(
                                color:appColor.dGreen, fontWeight: FontWeight.w600)),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
