
import 'dart:ffi';
import 'dart:io';
import 'package:chucknorris/models/ChuckNorris.dart';
import 'package:dotenv/dotenv.dart';
import 'package:chucknorris/chucknorris.dart' as chucknorris;
import "package:chucknorris/services/category_service.dart" as categoryServices;

void main(List<String> arguments) async{
  //prima parte senza categoria
  //print(await chucknorris.getJokeAsync());

  //prima parte con categoria scelta 
  /*
  final categories = "history";
  print(await chucknorris.getJokeFromCategoryAsync(categories));
  */

  //seconda parte con la categoria scelta da un file env
  /*
  var env = DotEnv()..load();
  print(await chucknorris.getJokeFromCategoryAsync(env["category"]));
  */

  //terza parte
  //chiede la categoria da console e poi salva la citazione come json sul file system
  /*
  final categories = await categoryServices.requestCategoriesAsync();
  for (var i = 0; i < categories.length/2; i++) {
    if(categories[i].length >=5 ){
      print("${i})${categories[i]} \t ${i+9}) ${categories[i+8]}");
    } else {
      print("${i})${categories[i]} \t\t ${i+9}) ${categories[i+8]}");
    }
  }
  print("seleziona l'indice di una categoria");
  final indexCategory = stdin.readLineSync()!;
  final ChuckNorris joke = await chucknorris.getJokeFromCategoryAsync(categories[int.parse(indexCategory)]);
  chucknorris.saveChuckToFS(joke);
  print(joke);
  */

  //chiede un parametro di ricerca da console, li stampa su console e poi li salva come json sul file system
  print("scrivi il parametro di ricerca");
  String? parametro = stdin.readLineSync();
  final chucklist = (await chucknorris.getJokeFromSearchAsync(parametro));
  chucklist.forEach((element) {print(element);});
  if (chucklist.length > 0) {
     chucknorris.saveChuckListToFS(chucklist);
  } else {
    print("la ricerca non ha ottenuto dei risultati");
  }
 

  /*
  int numCategories = categories.length;
  double numHalfCategories = numCategories/2;
  for (var i = 0; i < numHalfCategories; i++) {
    if(categories[i].length >=5 ){
      print("${i+1})${categories[i]} \t ${i+9}) ${categories[i+8]}");
    } else {
      print("${i+1})${categories[i]} \t\t ${i+9}) ${categories[i+8]}");
    }
  }
  print("scrivi una delle categorie");
  String? chosenCategory = stdin.readLineSync();
  //final chosenCategory = await chucknorris.readFile();
  //var env = DotEnv()..load();
  //print(await chucknorris.getJokeAsync());
  //print(await chucknorris.getJokeFromCategoryAsync(env["category"]));
  //print(await chucknorris.getJokeFromCategoryAsync(chosenCategory));
   
  print("scrivi il parametro di ricerca");
  String? parametro = stdin.readLineSync();
  final chucklist = (await chucknorris.getJokeFromSearchAsync(parametro));
  chucklist.map((e) => print(e));
  chucknorris.saveChuckListToFS(chucklist);
  */
  /*
  final categories = await categoryServices.requestCategoriesAsync();
    for (var i = 0; i < categories.length; i++) {
      print("$i ${categories[i]}");
    }
    print("scegli l'indice di una categoria");
    final index = int.parse(stdin.readLineSync()!);
    final quote = await chucknorris.getJokeFromCategoryAsync(categories[index]);
    print(quote);
    */
  }




