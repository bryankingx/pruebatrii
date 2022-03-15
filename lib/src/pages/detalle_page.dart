import 'package:flutter/material.dart';
import 'package:trii_examen_ep/src/services/auth_service.dart';
import 'package:trii_examen_ep/src/widgets/detalle_morty.dart';
import 'package:provider/provider.dart';

class DetailsItem extends StatelessWidget {
  final String? nombre;
  final String? image;
  final String? status;
  final String? gender;
  final String? species;
  const DetailsItem(
      this.nombre, this.image, this.status, this.gender, this.species,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detalle Item"),
          backgroundColor: Color(0x44000000),
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
        //backgroundColor: Colors.transparent,

        body: Container(
          color: Color(0x44000000),
          child: CardDetails(
              image: image,
              nombre: nombre,
              status: status,
              gender: gender,
              species: species),
        ));
  }
}
