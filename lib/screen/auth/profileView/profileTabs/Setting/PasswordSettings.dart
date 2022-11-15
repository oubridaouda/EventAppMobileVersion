import 'package:cool_alert/cool_alert.dart';
import 'package:event_mobile_app/controller/auth/changeUserPassword.dart';
import 'package:event_mobile_app/controller/auth/logOutController.dart';
import 'package:event_mobile_app/screen/auth/resetPassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:event_mobile_app/main.dart';

class PasswordSettings extends StatefulWidget {
  const PasswordSettings({Key? key}) : super(key: key);

  @override
  State<PasswordSettings> createState() => _PasswordSettingsState();
}

class _PasswordSettingsState extends State<PasswordSettings> {
  var passwordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var passwordConfirmController = TextEditingController();

  bool _isSecret = true;
  bool _isSecretPass = true;
  bool _isSecretNewPass = true;
  var isLoading = false;
  var textUsername = "";
  var textPassword = "";
  var textConfirmPassword = "";
  var _submitted = false;

  String? get _errorNewPassword {
    final text = newPasswordController.value.text;
    if (text.isEmpty) {
      return 'Ce champ est requis.';
    }

    if (text.length < 8) {
      return 'Veillez saisir 8 au minimum.';
    }
    // return null if the text is valid
    return null;
  }

  String? get _errorPassword {
    final textPass = passwordController.value.text;
    if (textPass.isEmpty) {
      return 'Ce champ est requis.';
    }
    if (textPass.length < 8) {
      return 'Veillez saisir 8 au minimum.';
    }
    // return null if the text is valid
    return null;
  }

  String? get _errorConfirmPassword {
    final textConfirm = passwordConfirmController.value.text;
    if (textConfirm.isEmpty) {
      return 'Ce champ est requis.';
    }
    if (textConfirm.length < 8) {
      return 'Veillez saisir 8 au minimum.';
    }
    if (passwordConfirmController.value.text !=
        newPasswordController.value.text) {
      return 'Mot de passe non similaire.';
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
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: darkMode ? darkColor.dWhite : lightColor.dWhite,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            "Password Settings",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Divider(
            thickness: 2,
            color: lightColor.dBackgroud,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Column(
            children: const [
              Text(
                "Change password",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
              )
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            "You can update your password from here. Ifyou can't remember your current password, just log out and click on Forgot password.",
            style: TextStyle(
              color: lightColor.dGrey,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            "Current password*",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextField(
            obscureText: _isSecret,
            controller: passwordController,
            onChanged: (textPass) => setState(() {}),
            style: TextStyle(
                color: darkMode ? lightColor.dWhite : darkColor.dWhite),
            decoration: InputDecoration(
              filled: true,
              fillColor:
                  darkMode ? darkColor.InputColor : lightColor.InputColor,
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
                    color: lightColor.InputBorderColor,
                  )),
              errorBorder: const OutlineInputBorder(
                //Outline border type for TextFeild
                borderRadius: BorderRadius.all(Radius.circular(2)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.red,
                ),
              ),

              errorText: _submitted ? _errorPassword : null,
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
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ResetPassword()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Text(
                    "Mot de passe oublié?",
                    style: TextStyle(
                        color: lightColor.dGreen, fontWeight: FontWeight.w500),
                  ),
                  onTap: (){
                    // Google logout
                    LogOutController().googleLogOut(context);

                    //Classic log out
                    LogOutController().logOutClassic(context);

                    //Facebook logout
                    LogOutController().facebookLogOut(context);
                    Navigator.of(context).pushReplacementNamed("/reset-password");
                  },
                ),

              ],
            ),
          ),
          const Text(
            "Current password*",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextField(
            obscureText: _isSecretPass,
            controller: newPasswordController,
            onChanged: (textPass) => setState(() {}),
            style: TextStyle(
                color: darkMode ? lightColor.dWhite : darkColor.dWhite),
            decoration: InputDecoration(
              filled: true,
              fillColor:
                  darkMode ? darkColor.InputColor : lightColor.InputColor,
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
                    color: lightColor.InputBorderColor,
                  )),
              errorBorder: const OutlineInputBorder(
                //Outline border type for TextFeild
                borderRadius: BorderRadius.all(Radius.circular(2)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.red,
                ),
              ),

              errorText: _submitted ? _errorNewPassword : null,
              suffixIcon: InkWell(
                onTap: () => setState(() => _isSecretPass = !_isSecretPass),
                child: Icon(
                  !_isSecretPass ? Icons.visibility : Icons.visibility_off,
                  color: appColor.dGrey,
                ),
              ),
            ),
            keyboardType: TextInputType.visiblePassword,
          ),

          const SizedBox(
            height: 10.0,
          ),
          const Text(
            "Current password*",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextField(
            obscureText: _isSecretNewPass,
            controller: passwordConfirmController,
            onChanged: (textPass) => setState(() {}),
            style: TextStyle(
                color: darkMode ? lightColor.dWhite : darkColor.dWhite),
            decoration: InputDecoration(
              filled: true,
              fillColor:
                  darkMode ? darkColor.InputColor : lightColor.InputColor,
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
                    color: lightColor.InputBorderColor,
                  )),
              errorBorder: const OutlineInputBorder(
                //Outline border type for TextFeild
                borderRadius: BorderRadius.all(Radius.circular(2)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.red,
                ),
              ),
              errorText: _submitted ? _errorConfirmPassword : null,
              suffixIcon: InkWell(
                onTap: () => setState(() => _isSecretNewPass = !_isSecretNewPass),
                child: Icon(
                  !_isSecretNewPass ? Icons.visibility : Icons.visibility_off,
                  color: appColor.dGrey,
                ),
              ),
            ),
            keyboardType: TextInputType.visiblePassword,
          ),
          const SizedBox(
            height: 5.0,
          ),
          ElevatedButton(
            onPressed: () async {
              _submit();
              if (passwordController.value.text.isNotEmpty && newPasswordController.value.text == passwordConfirmController.value.text) {
                setState(() => isLoading = true);
                await ChangeUserPassword().createNewUserPassword(
                    context,
                    passwordController.text,
                    newPasswordController.text,
                    passwordConfirmController.text);
                setState(() => isLoading = false);

                ChangeUserPassword().openModal
                    ? CoolAlert.show(
                        title: ChangeUserPassword().modalTitle,
                        backgroundColor: Colors.white,
                        context: context,
                        type: ChangeUserPassword().modalStatus
                            ? CoolAlertType.success
                            : CoolAlertType.error,
                        text: ChangeUserPassword().modalMessage,
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
                : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Update Password",
                style: TextStyle(
                    fontSize: 16,
                    color: darkMode ? darkColor.dWhite : lightColor.dWhite),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
