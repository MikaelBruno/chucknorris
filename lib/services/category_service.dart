import "package:http/http.dart" as http;
import "dart:convert";

Future<List<dynamic>> requestCategoriesAsync () async {
  final url = "https://api.chucknorris.io/jokes/categories";
  final uri = Uri.parse(url);

  final res = await http.get(uri);
  final data = json.decode(res.body);

  return data as List<dynamic>;
}
