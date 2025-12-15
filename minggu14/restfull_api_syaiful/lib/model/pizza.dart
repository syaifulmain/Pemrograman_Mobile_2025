const keyId = 'id';
const keyName = 'pizzaName';
const keyDescription = 'description';
const keyPrice = 'price';
const keyImageUrl = 'imageUrl';

class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      // id: int.tryParse(json['id'].toString()) ?? 0,
      // pizzaName: json['pizzaName'] != null ? json['pizzaName'].toString() : 'No name',
      // description: json['description'] != null ? json['description'].toString() : '',
      // price: double.tryParse(json['price'].toString()) ?? 0.0,
      // imageUrl: json['imageUrl'] != null ? json['imageUrl'].toString() : '',
      id: int.tryParse(json[keyId].toString()) ?? 0,
      pizzaName: json[keyName] != null ? json[keyName].toString() : 'No name',
      description: json[keyDescription] != null ? json[keyDescription].toString() : '',
      price: double.tryParse(json[keyPrice].toString()) ?? 0.0,
      imageUrl: json[keyImageUrl] != null ? json[keyImageUrl].toString() : '',
    );
  }
  Pizza({
    this.id = 0,
    this.pizzaName = '',
    this.description = '',
    this.price = 0.0,
    this.imageUrl = '',
  });

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      // 'pizzaName': pizzaName,
      // 'description': description,
      // 'price': price,
      // 'imageUrl': imageUrl,
      keyId: id,
      keyName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImageUrl: imageUrl,
    };
  }
}
