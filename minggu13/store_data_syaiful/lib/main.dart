import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:store_data_syaiful/model/pizza.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSON - Syaiful',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String pizzaString = '';

  // Future readJsonFile() async {
  //   String myString = await DefaultAssetBundle.of(
  //     context,
  //   ).loadString('assets/pizzalist.json');

  //   setState(() {
  //     pizzaString = myString;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   readJsonFile();
  // }

  // List<Pizza> myPizzas = [];

  // @override
  // void initState() {
  //   super.initState();
  //   readJsonFile().then((value) {
  //     setState(() {
  //       myPizzas = value;
  //     });
  //   });
  // }

  // Future<List<Pizza>> readJsonFile() async {
  //   String myString = await DefaultAssetBundle.of(
  //     context,
  //   ).loadString('assets/pizzalist_broken.json');
  //   List pizzaMapList = jsonDecode(myString);

  //   List<Pizza> myPizzas = [];
  //   for (var pizza in pizzaMapList) {
  //     Pizza myPizza = Pizza.fromJson(pizza);
  //     myPizzas.add(myPizza);
  //   }

  //   String json = convertToJSON(myPizzas);
  //   print(json);
  //   return myPizzas;
  // }

  // String convertToJSON(List<Pizza> pizzas) {
  //   return jsonEncode(pizzas.map((pizza) => pizza.toJson()).toList());
  // }

  int appCounter = 0;

  Future<void> readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appCounter = prefs.getInt('appCounter') ?? 0;
    appCounter++;
    await prefs.setInt('appCounter', appCounter);

    setState(() {
      appCounter = appCounter;
    });
  }

  Future<void> deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      appCounter = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    readAndWritePreference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON - Syaiful')),
      // body: ListView.builder(
      //   itemCount: myPizzas.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(myPizzas[index].pizzaName),
      //       subtitle: Text(
      //         myPizzas[index].description +
      //             ' - ' +
      //             myPizzas[index].price.toString(),
      //       ),
      //     );
      //   },
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('You have opened the app $appCounter times.'),
            ElevatedButton(
              onPressed: () {
                deletePreference();
              },
              child: const Text('Reset Counter'),
            ),
          ],
        ),
      ),
    );
  }
}
