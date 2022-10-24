import 'package:event_mobile_app/colors/colors.dart';
import 'package:event_mobile_app/controller/registerController.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key, required this.title}) : super(key: key);

  final String title;

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
      return 'Ce champ est requis pass.';
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
                const Center(
                  child: Text(
                    "Inscription",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: registerController.firstNameController,
                  onChanged: (text) => setState(() => textUsername),
                  decoration: InputDecoration(
                    errorText: _submitted ? _errorText : null,
                    hintText: "Votre nom",
                    prefix: const Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: registerController.lastNameController,
                  onChanged: (text) => setState(() => textUsername),
                  decoration: InputDecoration(
                    errorText: _submitted ? _errorText : null,
                    hintText: "Votre prénom",
                    prefix: const Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 15,
                ),

                TextField(
                  controller: registerController.emailController,
                  onChanged: (text) => setState(() => textUsername),
                  decoration: InputDecoration(
                    errorText: _submitted ? _errorText : null,
                    hintText: "Entrez votre email",
                    prefix: const Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  obscureText: _isSecret,
                  controller: registerController.passController,
                  onChanged: (textPass) => setState(() => textConfirmPassword),
                  decoration: InputDecoration(
                    errorText: _submitted ? _errorConfirmPassword : null,
                    hintText: 'Entrez votre mot de passe',
                    prefix: const Icon(Icons.vpn_key),
                    suffixIcon: InkWell(
                      onTap: () => setState(() => _isSecret = !_isSecret),
                      child: Icon(
                          !_isSecret ? Icons.visibility : Icons.visibility_off),
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
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: dGreen,
                    padding: const EdgeInsets.all(12),
                  ),
                  child: isLoading
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(color: Colors.white),
                            SizedBox(width: 14),
                            Text(
                              'Veuillez patienter...',
                              style: TextStyle(fontSize: 16,color: dGreen),
                            )
                          ],
                        )
                      : const Text(
                          "Créer un compte",
                          style: TextStyle(fontSize: 20),
                        ),
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
                        Navigator.of(context).pop();
                      },
                      child: const Text('Connexion'),
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
