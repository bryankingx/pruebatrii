import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _crearFondo(context),
          child,
        ],
      ),
    );
  }
}

Widget _crearFondo(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final fondoMorado = Container(
    height: size.height * 1,
    width: double.infinity,
    decoration: BoxDecoration(
      color: const Color(0xFFB9B9B9),
      image: DecorationImage(
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
        image: const AssetImage("assets/img/trii.png"),
      ),
    ),
  );

  return Stack(
    children: <Widget>[
      fondoMorado,
    ],
  );
}
