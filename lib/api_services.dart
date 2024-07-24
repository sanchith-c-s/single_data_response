
import 'package:single_data/model/single.dart';
import 'package:http/http.dart' as http;

class ApiServices {
 static Future<Single?> getSingle() async {
    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        Single model = Single.fromJson(response.body);
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
