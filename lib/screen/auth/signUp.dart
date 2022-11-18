import 'package:cool_alert/cool_alert.dart';
import 'package:event_mobile_app/allChangeNotifer/AllChangeNotifer.dart';
import 'package:event_mobile_app/colors/colors.dart';
import 'package:event_mobile_app/controller/auth/loginController.dart';
import 'package:event_mobile_app/controller/auth/registerController.dart';
import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/auth/login.dart';
import 'package:event_mobile_app/screen/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

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
  bool isSignType = false;

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
                SvgPicture.asset(
                  height: 50,
                  "assets/images/logo.svg",
                  semanticsLabel: "DuckEvent",
                ),
                SizedBox(height: 30.0,),
                Text("Sign up to Barren as ...",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 24.0),textAlign:TextAlign.center,),
                SizedBox(height: 30.0,),
                Container(
                  color: lightColor.dWhite,
                  width: 390,
                  height: 230,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    CircleAvatar(
                    backgroundColor: lightColor.btnColor,

                    child: FaIcon(FontAwesomeIcons.userPlus,color: Colors.black),

                  ),
                      Text("Personal account",style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),),
                      SizedBox(
                        width: 300.0,
                        child:
                        ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              isSignType = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: appColor.dGreen,
                            padding: const EdgeInsets.all(20),
                            elevation: 1.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const[
                              Text(
                                "Créer un compte",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(width: 10,),
                              FaIcon(FontAwesomeIcons.arrowRight,color: Colors.white,size: 15,)
                            ],),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30.0,),
                Container(
                  color: lightColor.dWhite,
                  width: 390,
                  height: 230,
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: lightColor.btnColor,

                      child: FaIcon(FontAwesomeIcons.solidBuilding,color: Colors.black),

                    ),
                    Text("Company account",style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),),
                    SizedBox(
                      width: 300.0,
                      child:
                      ElevatedButton(
                        onPressed: () async {
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appColor.dGreen,
                          padding: const EdgeInsets.all(20),
                          elevation: 1.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const[
                           Text(
                            "Créer un compte",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(width: 10,),
                          FaIcon(FontAwesomeIcons.arrowRight,color: Colors.white,size: 15,)
                        ],),
                      ),
                    )
                  ],
                ),
                ),
                const SizedBox(
                  height: 35,
                ),
               isSignType ? Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: [

                const Text(
                  "Nom*",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                TextField(
                  controller: registerController.firstNameController,
                  onChanged: (text) => setState(() => textUsername),
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: appColor.InputColor,
                    enabledBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: appColor.InputBorderColor,
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
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: appColor.InputColor,
                    enabledBorder: OutlineInputBorder(
                        //Outline border type for TextFeild
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                        borderSide: BorderSide(
                          color: appColor.InputBorderColor,
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
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: appColor.InputColor,
                    enabledBorder: OutlineInputBorder(
                        //Outline border type for TextFeild
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                        borderSide: BorderSide(
                          color: appColor.InputBorderColor,
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
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: appColor.InputColor,
                    enabledBorder: OutlineInputBorder(
                        //Outline border type for TextFeild
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                        borderSide: BorderSide(
                          color: appColor.InputBorderColor,
                        )),
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
                              confirmBtnColor: appColor.dGreen,
                            )
                          : 0;
                    }
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
                              'Veuillez patienter...',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            )
                          ],
                        )
                      : const Text(
                          "Créer un compte",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
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
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await AuthController().googleSignIn(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColor.dWhite,
                    padding: const EdgeInsets.all(20),
                    elevation: 1.0,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                            height: 20, 'assets/images/google.svg'),
                        const SizedBox(width: 5),
                        const Text(
                          "Connectez vous avec Google",
                          style: TextStyle(color: Colors.black),
                        )
                      ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await AuthController().loginFacebook(context);
                    setState(() => isLoading = false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColor.dWhite,
                    padding: const EdgeInsets.all(20),
                    elevation: 1.0,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.facebook,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Connectez vous avec Facebook",
                          style: TextStyle(color: Colors.black),
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
                            .changePage(DrawerSection.loginPage);
                      },
                      child: Text(
                        'Connexion',
                        style: TextStyle(color: appColor.dGreen),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),

                 ],
               ) : Container(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("© 2022, DuckEvent. All rights reserved."),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


enum SinUpType {
  person,
  company,
}