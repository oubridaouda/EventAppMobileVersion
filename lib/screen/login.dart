import 'package:event_mobile_app/colors/colors.dart';
import 'package:event_mobile_app/controller/loginController.dart';
import 'package:event_mobile_app/screen/signUp.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                    "Login",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (text) => setState(() => textUsername),
                  controller: authController.emailController,
                  decoration: InputDecoration(
                    errorText: _submitted ? _errorText : null,
                    hintText: "Nom d'utilisateur",
                    prefix: const Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  obscureText: _isSecret,
                  controller: authController.passController,
                  onChanged: (textPass) => setState(() => textPassword),
                  decoration: InputDecoration(
                    errorText: _submitted ? _errorPassword : null,
                    hintText: 'Mot de passe',
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

                    if(authController.emailController.value.text.isNotEmpty && authController.passController.text.length>=8){
                      setState(()=>isLoading = true);
                      await authController.loginUser(context);
                      setState(()=>isLoading = false);
                    }else{

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
                              'Veuillez  patienter...',
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        )
                      : const Text(
                          "Connexion",
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUp(title: "Inscription")));
                      },
                      child: const Text('Inscription'),
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
