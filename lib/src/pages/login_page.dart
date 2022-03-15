// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:trii_examen_ep/src/services/auth_service.dart';

import 'package:trii_examen_ep/src/services/login_form_provider.dart';
import 'package:trii_examen_ep/src/widgets/login_widget/auth_background.dart';
import 'package:trii_examen_ep/src/widgets/login_widget/card_container.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 260),
          CardContainer(
              child: Column(
            children: [
              const SizedBox(height: 20),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: const <Widget>[
                  Text('TRII',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(), child: _LoginForm())
            ],
          )),
          const SizedBox(height: 15),
        ],
      ),
    )));
  }
}

class _LoginForm extends StatelessWidget {
  String valor = "";
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
        child: Column(children: <Widget>[
      const SizedBox(height: 20),
      SizedBox(
        width: size.width * 0.95,
        child: Form(
          key: loginForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                controller: TextEditingController(text: valor),
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Usuario',
                  labelText: 'Usuario',
                ),
                onChanged: (value) => loginForm.email = value,
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: TextEditingController(text: valor),
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Contraseña',
                  labelText: 'Contraseña',
                ),
                onChanged: (value) => loginForm.password = value,
                validator: (value) {
                  return (value != null && value.length >= 6)
                      ? null
                      : 'La contraseña debe de ser de 6 caracteres';
                },
              ),
              const SizedBox(height: 30),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: const Color.fromARGB(255, 7, 83, 14),
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 15),
                      child: Text(
                        loginForm.isLoading ? 'Verificando' : 'Iniciar Sesión',
                        style: const TextStyle(color: Colors.white),
                      )),
                  onPressed: loginForm.isLoading
                      ? null
                      : () async {
                          loginForm.isLoading = true;
                          final authService =
                              Provider.of<AuthService>(context, listen: false);

                          final bool confirmation = await authService.login(
                              loginForm.email, loginForm.password);

                          if (confirmation == true) {
                            Navigator.pushNamed(context, '/home');
                          } else {
                            loginForm.isLoading = false;
                            return showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                title: const Text('Error:'),
                                content: const Text(
                                    "Usuario o contraseña incorecta."),
                                actions: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor:
                                          const Color.fromARGB(255, 7, 83, 14),
                                      onSurface: Colors.grey,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'OK',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        })
            ],
          ),
        ),
      )
    ]));
  }
}
