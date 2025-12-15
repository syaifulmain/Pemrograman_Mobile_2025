import 'package:flutter/material.dart';
import 'package:restfull_api_syaiful/httphelper.dart';
import 'package:restfull_api_syaiful/model/pizza.dart';
import 'package:restfull_api_syaiful/pizza_detail.dart';

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
  Future<List<Pizza>> callPizzas() async {
    HttpHelper helper = HttpHelper();
    List<Pizza> pizzas = await helper.getPizzaList();
    return pizzas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON - Syaiful')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PizzaDetailScreen(pizza: Pizza(), isNew: true),
            ),
          );
        },
      ),
      body: FutureBuilder(
        future: callPizzas(),
        builder: (BuildContext context, AsyncSnapshot<List<Pizza>> pizzas) {
          if (pizzas.hasError) {
            return const Text('Something went wrong');
          }
          if (!pizzas.hasData) {
            return const CircularProgressIndicator();
          }
          // ...existing code...
          return ListView.builder(
            itemCount: (pizzas.data == null) ? 0 : pizzas.data!.length,
            itemBuilder: (BuildContext context, int position) {
              final pizza = pizzas.data![position];
              return Dismissible(
                key: Key('pizza_${pizza.id ?? position}'),
                background: Container(color: Colors.redAccent),
                onDismissed: (direction) async {
                  final id = pizza.id;
                  setState(() {
                    pizzas.data!.removeWhere((element) => element.id == id);
                  });
                  if (id != null) {
                    HttpHelper helper = HttpHelper();
                    await helper.deletePizza(id);
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${pizza.pizzaName} deleted')),
                  );
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(pizza.imageUrl),
                  ),
                  title: Text(pizza.pizzaName),
                  subtitle: Text(pizza.description),
                  trailing: Text('\$${pizza.price.toStringAsFixed(2)}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PizzaDetailScreen(pizza: pizza, isNew: false),
                      ),
                    );
                  },
                ),
              );
            },
          );
          // ...existing code...
        },
      ),
    );
  }
}
