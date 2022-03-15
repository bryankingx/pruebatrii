import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:trii_examen_ep/src/services/auth_service.dart';
import 'package:trii_examen_ep/src/services/morty_service.dart';
import 'package:trii_examen_ep/src/widgets/lista_morty.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<mortyService>(context).headlines;
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 255, 255, 255)),
          onPressed: () {
            authService.deleteAll();

            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
        title: const Text("Items"),
        backgroundColor: const Color(0x44000000),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.login_outlined),
            onPressed: () {
              authService.deleteAll();

              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: ListaMorty(headlines),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
