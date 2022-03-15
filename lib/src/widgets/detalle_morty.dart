import 'package:flutter/material.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({
    Key? key,
    required this.image,
    required this.nombre,
    required this.status,
    required this.gender,
    required this.species,
  }) : super(key: key);

  final String? image;
  final String? nombre;
  final String? status;
  final String? gender;
  final String? species;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Card(
          elevation: 20,
          clipBehavior: Clip.hardEdge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.network(image!),
              Center(
                child: Text(
                  nombre!,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    gender!,
                    style: const TextStyle(fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  )),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    status!,
                    style: const TextStyle(fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  )),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    species!,
                    style: const TextStyle(fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
