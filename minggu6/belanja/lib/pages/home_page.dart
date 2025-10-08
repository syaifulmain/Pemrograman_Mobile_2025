import 'package:belanja/models/item.dart';
import 'package:belanja/pages/item_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
      name: 'Sugar',
      price: 5000,
      images: 'images/sugar.png',
      stock: 10,
      rate: 4.5,
    ),
    Item(
      name: 'Salt',
      price: 2000,
      images: 'images/salt.png',
      stock: 5,
      rate: 4.0,
    ),
    Item(
      name: 'Bread',
      price: 15000,
      images: 'images/bread.png',
      stock: 20,
      rate: 4.8,
    ),
    Item(
      name: 'coffee',
      price: 25000,
      images: 'images/coffee.png',
      stock: 15,
      rate: 4.7,
    ),
    Item(
      name: 'Tea',
      price: 10000,
      images: 'images/tea.png',
      stock: 8,
      rate: 4.3,
    ),
    Item(
      name: 'Milk',
      price: 12000,
      images: 'images/milk.png',
      stock: 12,
      rate: 4.6,
    ),
    Item(
      name: 'Snacks',
      price: 8000,
      images: 'images/snack.png',
      stock: 25,
      rate: 4.4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(8),
        child: GridView.builder(
          padding: EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            // make the card slightly taller so image can occupy most space
            childAspectRatio: 0.65,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return InkWell(
              onTap: () {
                // use direct push with MaterialPageRoute and pass the item
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemPage(item: item)),
                );
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // make the image expand to take available vertical space
                      Expanded(
                        child: Hero(
                          tag: item.images,
                          child: Image.asset(
                            item.images,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text('Harga: Rp${item.price}'),
                      Text('Stok: ${item.stock}'),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(item.rate.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: const Text(
          'Belanja App Muhamad Syaifullah 2341720013',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
