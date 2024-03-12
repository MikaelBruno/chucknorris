import "dart:convert";
class ChuckNorris {
  String Value;
  String DateOfCreation ;
  String Id;

  ChuckNorris({
    required this.Value,
    required this.DateOfCreation,
    required this.Id
  });
  @override
  String toString() {
    return """
Date of creation: $DateOfCreation,
id: $Id
Joke: 
$Value
          """;
  }

  Map<String,dynamic> toJson() {
    return {
      'joke': Value,
      'date_of_creation': DateOfCreation,
      'id': Id
    };
  }
  
  factory ChuckNorris.fromJson(String jsonString) {
    final Map<String,dynamic> map = json.decode(jsonString);
    return ChuckNorris.fromMap(map);
  }

  factory ChuckNorris.fromMap(Map<String,dynamic> map) {
    final chuck = ChuckNorris(Value: map["value"], DateOfCreation: map["created_at"], Id: map["id"]);
    return chuck;
  }
  
}