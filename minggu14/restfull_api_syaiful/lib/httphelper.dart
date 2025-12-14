import 'dart:io'; 
import 'package:http/http.dart' as http; 
import 'dart:convert'; 
import 'model/pizza.dart'; 

class HttpHelper {
  final String authority = 'goj7e.wiremockapi.cloud';
  final String path = 'pizzalists';
  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.https(authority, path);
    final http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      //provide a type argument to the map method to avoid type 
      //error
      List<Pizza> pizzas =
          jsonResponse.map<Pizza>((i) => 
            Pizza.fromJson(i)).toList();
      return pizzas;
    } else {
      return [];
    }
  }
}