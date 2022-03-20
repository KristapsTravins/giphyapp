import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiCall {
  getGiffs(searchWord) async {
    final response = await http.get(Uri.parse(
        'http://api.giphy.com/v1/gifs/search?q=$searchWord&api_key=cRND84WPH72u6frFp7S311svhgMpM4BD'));
    List<String> links = [];
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (var data in jsonData["data"]) {
        var index = data["images"]["original"]["url"].indexOf('?');
        links.add(data["images"]["original"]["url"].substring(0, index));
      }
      return links;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
