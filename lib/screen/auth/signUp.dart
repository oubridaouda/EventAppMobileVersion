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
  bool isPersonSign = false;
  bool isCompanySign = false;

  //Person form error message section

  String? get _errorEmailText {
    final text = registerController.emailController.value.text;
    if (text.isEmpty) {
      return 'Ce champ est requis.';
    }
    // return null if the text is valid
    return null;
  }
  String? get _errorNameText {
    final text = registerController.firstNameController.value.text;
    if (text.isEmpty) {
      return 'Ce champ est requis.';
    }
    // return null if the text is valid
    return null;
  }
  String? get _errorLastNameText {
    final text = registerController.lastNameController.value.text;
    if (text.isEmpty) {
      return 'Ce champ est requis.';
    }
    // return null if the text is valid
    return null;
  }



  String? get _errorPersonPassword {
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


  //Company form error message section

  String? get _errorTextCompanyName {
    final text = registerController.companyNameController.value.text;
    if (text.isEmpty) {
      return 'Ce champ est requis.';
    }
    // return null if the text is valid
    return null;
  }
  String? get _errorTextCompanyEmail {
    final text = registerController.companyEmailController.value.text;
    if (text.isEmpty) {
      return 'Ce champ est requis.';
    }
    // return null if the text is valid
    return null;
  }

  String? get _errorPasswordCompany {
    final textPass = registerController.companyPasswordController.value.text;
    if (textPass.isEmpty) {
      return 'Ce champ est requis.';
    }
    if (textPass.length < 8) {
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
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 50.0,),
                SvgPicture.asset(
                  height: 50,
                  "assets/images/logo.svg",
                  semanticsLabel: "DuckEvent",
                ),
                SizedBox(height: 30.0,),
                Text("Sign up to Barren as ...",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 24.0),textAlign:TextAlign.center,),
                SizedBox(height: 30.0,),
                //Person account select box
                isPersonSign == false && isCompanySign == false ? Container(
                  color: lightColor.dWhite,
                  width: 390,
                  height: 230,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 60.0,
                        height: 60.0,
                        child: CircleAvatar(
                        backgroundColor: lightColor.btnColor,

                        child: const FaIcon(FontAwesomeIcons.userPlus,color: Colors.black),

                      ),),
                      const Text("Personal account",style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),),
                      SizedBox(
                        width: 300.0,
                        child:
                        ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              isPersonSign = true;
                              isCompanySign = false;
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
                                "Create account",
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
                ) : Container(),
                SizedBox(height: 30.0,),

                //Company account select box
                isCompanySign == false && isPersonSign == false ? Container(
                  color: lightColor.dWhite,
                  width: 390,
                  height: 230,
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox( width: 60.0,height: 60.0,child:
                    CircleAvatar(
                      backgroundColor: lightColor.btnColor,

                      child: FaIcon(FontAwesomeIcons.solidBuilding,color: Colors.black),

                    ),),
                    const Text("Company account",style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),),
                    SizedBox(
                      width: 300.0,
                      child:
                      ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isCompanySign = true;
                            isPersonSign = false;
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
                            "Create account",
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
                ) : Container(),
                const SizedBox(
                  height: 15,
                ),

               //Person account form
               isPersonSign ? Column(
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
                    errorText: _submitted ? _errorNameText : null,
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
                    errorText: _submitted ? _errorLastNameText : null,
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
                    errorText: _submitted ? _errorEmailText : null,
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
                    errorText: _submitted ? _errorPersonPassword : null,
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
                          "Create account",
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

                //Company account form
                isCompanySign ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Campany name*",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    TextField(
                      controller: registerController.companyNameController,
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
                        errorText: _submitted ? _errorTextCompanyName : null,
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Your Email*",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    TextField(
                      controller: registerController.companyEmailController,
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
                        errorText: _submitted ? _errorTextCompanyEmail : null,
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
                      controller: registerController.companyPasswordController,
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
                        errorText: _submitted ? _errorPasswordCompany : null,
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
                            .companyNameController.value.text.isNotEmpty && registerController
                            .companyEmailController.value.text.isNotEmpty &&
                            registerController.companyPasswordController.text.length >= 8) {
                          setState(() => isLoading = true);
                          await registerController.createCompany(context, widget);
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
                        "Create account",
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