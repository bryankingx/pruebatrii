import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:trii_examen_ep/src/models/rickmorty.dart';

final _URL = 'https://rickandmortyapi.com/api/character';

class mortyService with ChangeNotifier {
  List<Result> headlines = [];

  mortyService() {
    getTopHeadLines();
  }

  getTopHeadLines() async {
    final resp = await http.get(Uri.parse(_URL));
    final newsResponse = rickandmortyFromJson(resp.body);

    headlines.addAll(newsResponse.results);

    debugPrint(newsResponse.results.toString());
    notifyListeners();
  }
}
