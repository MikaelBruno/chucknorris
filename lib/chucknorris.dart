

import "package:chucknorris/models/ChuckNorris.dart";
import "package:http/http.dart" as http;
import "dart:convert";
import 'dart:io';
String urlString = "https://api.chucknorris.io/jokes";
final url = Uri.parse(urlString);


Future<ChuckNorris> getJokeAsync()async{

  final Uri urlRandomJoke = Uri.parse('${url.toString()}/random');
  final res = await http.get(urlRandomJoke);

  //final Map<String, dynamic> data = json.decode(res.body);
  ChuckNorris chuck = ChuckNorris.fromJson(res.body);
  //saveChuckToFS(chuck);
  return chuck;
}

Future<ChuckNorris> getJokeFromCategoryAsync( String? category)async{

  final Uri urlRandomJoke = Uri.parse('${url.toString()}/random');

  final urlRandomJokeWithCategory = urlRandomJoke.replace(queryParameters:{"category":category});
  final res = await http.get(urlRandomJokeWithCategory);

  //final Map<String, dynamic> data = json.decode(res.body);
  ChuckNorris chuck = ChuckNorris.fromJson(res.body);

  //saveChuckToFS(chuck);
  return chuck;
}

Future<List<ChuckNorris>> getJokeFromSearchAsync( String? paramOfQuery)async{

  String urlString = "https://api.chucknorris.io/jokes/search";
  final url = Uri.parse(urlString);
  final uriWitchQuery = url.replace(queryParameters:{"query":paramOfQuery});
  final res = await http.get(uriWitchQuery);
  final data = json.decode(res.body);
  final list = data["result"] as List;
  final cfs = list
    .map((e) => ChuckNorris.fromMap(e as Map<String,dynamic>));
  final cfsList = cfs.toList();
  //saveChuckToFS(chuck);
  return cfsList;
}

void saveChuckToFS ( ChuckNorris chuck) {
  final jsonString = json.encode(chuck.toJson());
  final filePath = 'C:/projects/flutterpj/chucknorris/chuck.json';
  try{
    File(filePath).writeAsString(jsonString);
  } catch (ex) {
    print("errore nel salvataggio del file: $ex");
  }
}

void saveChuckListToFS ( List<ChuckNorris> chuck) async{
  final chuckJsonList = <Map<String,dynamic>>[];
  for (var i = 0; i < chuck.length; i++) {
    chuckJsonList.add(chuck[i].toJson());
  }
  final filePath = 'C:/projects/flutterpj/chucknorris/chuck.json';
  try{;
    await File(filePath).writeAsString(jsonEncode(chuckJsonList));
  } catch (ex) {
    print("errore nel salvataggio del file: $ex");
  }
}


Future<String> readFileAsync() async {
  String filePath = 'C:/projects/flutterpj/chucknorris/bin/categories.txt';
  File file = File(filePath);
  
  try {
    String contents = await file.readAsString();
    return contents;
  } catch (e) {
    print("Errore durante la lettura del file: $e");
    return "error";
  }
}


