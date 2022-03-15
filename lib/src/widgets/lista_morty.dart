import 'package:flutter/material.dart';
import 'package:trii_examen_ep/src/models/rickmorty.dart';
import 'package:trii_examen_ep/src/pages/detalle_page.dart';

class ListaMorty extends StatelessWidget {
  final List<Result> articulos;

  const ListaMorty(this.articulos);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articulos.length,
      itemBuilder: (BuildContext context, int index) {
        return _Articulos(articulos: articulos[index], index: index);
      },
    );
  }
}

class _Articulos extends StatelessWidget {
  final Result articulos;
  final int index;

  const _Articulos({required this.articulos, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0x44000000),
      child: Card(
        elevation: 20,
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: <Widget>[
            _TarjetaTopBar(articulos, index),
            _TarjetaTitulo(articulos),
            _TarjetaImagen(articulos),
            const SizedBox(height: 10),
            const Divider()
          ],
        ),
      ),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Result articulos;
  final int index;

  const _TarjetaTopBar(this.articulos, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(bottom: 10),
        child: Row());
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Result articulos;

  const _TarjetaTitulo(this.articulos);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(articulos.name,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black)),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Result articulos;

  const _TarjetaImagen(this.articulos);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsItem(
                  articulos.name,
                  articulos.image,
                  articulos.status,
                  articulos.gender,
                  articulos.species,
                ),
              ),
            ),
            child: FadeInImage(
                placeholder: const AssetImage("assets/img/giphy.gif"),
                image: NetworkImage(articulos.image)),
          ),
        ),
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Result articulos;

  const _TarjetaBody(this.articulos);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(articulos.name != null ? articulos.name : '',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
    );
  }
}
