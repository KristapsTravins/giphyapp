import 'dart:convert';
import 'package:http/http.dart' as http;

class Gif {
  String links;
  String Width;
  String Height;
  Gif(this.links, this.Width, this.Height);
}

class ApiCall {
  getGiffs(searchWord) async {
    var urlEndpoint = searchWord.isEmpty
        ? "http://api.giphy.com/v1/gifs/search?q=random&api_key=cRND84WPH72u6frFp7S311svhgMpM4BD"
        : "http://api.giphy.com/v1/gifs/search?q=$searchWord&api_key=cRND84WPH72u6frFp7S311svhgMpM4BD";
    final response = await http.get(Uri.parse(urlEndpoint));
    List<Gif> links = [];
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var data in jsonData["data"]) {
        var index = data["images"]["original"]["url"].indexOf('?');
        var gifObject = Gif(
            data["images"]["original"]["url"].substring(0, index),
            data["images"]["original"]["width"],
            data["images"]["original"]["height"]);

        links.add(gifObject);
      }

      return links;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
