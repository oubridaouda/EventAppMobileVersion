import 'package:cool_alert/cool_alert.dart';
import 'package:event_mobile_app/colors/colors.dart';
import 'package:event_mobile_app/controller/auth/registerController.dart';
import 'package:event_mobile_app/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppColors appColor = AppColors();

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  RegisterController registerController = RegisterController();

  bool _isSecret = true;
  var isLoading = false;
  var textUsername = "";
  var textPassword = "";
  var textConfirmPassword = "";
  var _submitted = false;

  String? get _errorText {
    final text = registerController.emailController.value.text;
    if (text.isEmpty) {
      return 'Ce champ est requis.';
    }
    // return null if the text is valid
    return null;
  }

  String? get _errorPassword {
    final textPass = registerController.passController.value.text;
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
    final textConfirm = registerController.confirmPassController.value.text;
    if (textConfirm.isEmpty) {
      return 'Ce champ est requis.';
    }
    if (registerController.confirmPassController.value.text !=
        registerController.passController.value.text) {
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
                  "Nom*",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                TextField(
                  controller: registerController.firstNameController,
                  onChanged: (text) => setState(() => textUsername),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:appColor.InputColor,
                    enabledBorder:  OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color:appColor.InputBorderColor,
                      ),
                    ),
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
                    errorText: _submitted ? _errorText : null,
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Prénom*",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                TextField(
                  controller: registerController.lastNameController,
                  onChanged: (text) => setState(() => textUsername),
                  decoration: InputDecoration(
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
                        )),
                    errorBorder: const OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.red,
                      ),
                    ),
                    errorText: _submitted ? _errorText : null,
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Email*",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                TextField(
                  controller: registerController.emailController,
                  onChanged: (text) => setState(() => textUsername),
                  decoration: InputDecoration(
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
                        )),
                    errorBorder: const OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.red,
                      ),
                    ),
                    errorText: _submitted ? _errorText : null,
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Mot de passe*",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                TextField(
                  obscureText: _isSecret,
                  controller: registerController.passController,
                  onChanged: (textPass) => setState(() => textConfirmPassword),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: appColor.InputColor,
                    enabledBorder: OutlineInputBorder(
                        //Outline border type for TextFeild
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                        borderSide: BorderSide(
                          color: appColor.InputBorderColor,
                        )),
                    focusedBorder:  OutlineInputBorder(
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
                    errorText: _submitted ? _errorConfirmPassword : null,
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
                    if (registerController
                            .emailController.value.text.isNotEmpty &&
                        registerController.passController.text.length >= 8) {
                      setState(() => isLoading = true);
                      await registerController.createUser(context, widget);
                      setState(() => isLoading = false);

                      registerController.openModal
                          ? CoolAlert.show(
                        title: registerController.modalTitle,
                        backgroundColor: Colors.white,
                        context: context,
                        type: registerController.modalStatus
                            ? CoolAlertType.success
                            : CoolAlertType.error,
                        text: registerController.modalMessage,
                        confirmBtnColor:appColor.dGreen,
                      )
                          : 0;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary:appColor.dGreen,
                    padding: const EdgeInsets.all(20),
                  ),
                  child: isLoading
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(color: Colors.white),
                            SizedBox(width: 14),
                            Text(
                              'Veuillez patienter...',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                            )
                          ],
                        )
                      : const Text(
                          "Créer un compte",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                ),
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  "By clicking \"Sign up\", you agree to Barren Terms & Conditions and have read the Privacy Policy.",
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 35,
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
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      child:  Text(
                        'Connexion',
                        style: TextStyle(color:appColor.dGreen),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
