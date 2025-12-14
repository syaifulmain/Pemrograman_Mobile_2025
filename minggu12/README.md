# Praktikum 1: Dart Streams
### **Langkah 1: Buat Project Baru**

### Langkah 2: Buka file **`main.dart`**
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syaifullah',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

>Soal 1
>
> - Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.
> - Gantilah warna tema aplikasi sesuai kesukaan Anda.
> - Lakukan commit hasil jawaban Soal 1 dengan pesan "W12: Jawaban Soal 1"


### Langkah 3: Buat file baru **`stream.dart`**
```dart
import 'package:flutter/material.dart';

class ColorStream {

}
```

### Langkah 4: Tambah variabel **`colors`**
```dart
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
  ];
```
>Soal 2
>
> - Tambahkan 5 warna lainnya sesuai keinginan Anda pada variabel colors tersebut.
> - Lakukan commit hasil jawaban Soal 2 dengan pesan "W12: Jawaban Soal 2"


### Langkah 5: Tambah method **`getColors()`**
```dart
Stream<Color> getColors() async* {}
```

### Langkah 6: Tambah perintah **`yield*`**
```dart
yield* Stream.periodic(const Duration(seconds: 1), (int t) {
    int index = t % colors.length;
    return colors[index];
});
```
>Soal 3
>
> - Jelaskan fungsi keyword yield* pada kode tersebut!
>   - Berfungsi untuk meneruskan seluruh elemen dari stream lain ke dalam stream yang sedang dibangun. 
> - Apa maksud isi perintah kode tersebut?
>   - membuat sebuah stream yang mengirimkan data setiap detik.
> - Lakukan commit hasil jawaban Soal 3 dengan pesan "W12: Jawaban Soal 3"


### Langkah 7: Buka **`main.dart`**
```dart
import 'stream.dart';
```

### **Langkah 8: Tambah variabel**
```dart
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;
```

### Langkah 9: Tambah method **`changeColor()`**
```dart
  void changeColor() async {
    await for (var eventColor in colorStream.getColors()) {
      setState(() {
        bgColor = eventColor;
      });
    }
  }
```

### **Langkah** 10: Lakukan override **`initState()`**
```dart
  @override
  void initState() {
    super.initState();
    colorStream = ColorStream();
    changeColor();
  }
```

### **Langkah** 11: Ubah isi **`Scaffold()`**
```dart
return Scaffold(
    appBar: AppBar(title: const Text('Stream Syaifullah')),
    body: Container(decoration: BoxDecoration(color: bgColor)),
);
```

### **Langkah 12: Run**
>Soal 4
>
> - Capture hasil praktikum Anda berupa GIF dan lampirkan di README.
> - Lakukan commit hasil jawaban Soal 4 dengan pesan "W12: Jawaban Soal 4"

![alt text](./images/m12p1.gif)

### Langkah 13: Ganti isi method `changeColor()`
>Soal 5
>
> - Jelaskan perbedaan menggunakan listen dan await for (langkah 9) !
>   - 
> - Lakukan commit hasil jawaban Soal 5 dengan pesan "W12: Jawaban Soal 5"


# Praktikum 2: Stream controllers dan sinks
### Langkah 1: Buka file **`stream.dart`**

### Langkah 2: Tambah **`class NumberStream`**

### Langkah 3: Tambah **`StreamController`**

### Langkah 4: Tambah method **`addNumberToSink`**

### Langkah 5: Tambah method **`close()`**

### **Langkah** 6: Buka **`main.dart`**

### **Langkah** **7: Tambah variabel**

### Langkah 8: Edit **`initState()`**

### **Langkah 9: Edit dispose()**

### Langkah 10: Tambah method **`addRandomNumber()`**

### Langkah 11: Edit method **`build()`**

### **Langkah 12: Run**

### Langkah 13: Buka **`stream.dart`**

### **Langkah 14: Buka main.dart**

### **Langkah** 15: Edit method **`addRandomNumber()`**


# Praktikum 3: Injeksi data ke streams
### Langkah 1: Buka **`main.dart`**

### Langkah 2: Tambahkan kode ini di **`initState`**

### Langkah 3: Tetap di **`initState`**

### **Langkah 4: Run**


# Praktikum 4: Subscribe ke stream events
### Langkah 1: Tambah variabel

### Langkah 2: Edit **`initState()`**

### Langkah 3: Tetap di **`initState()`**

### Langkah 4: Tambah properti onDone()

### **Langkah 5: Tambah method baru**

### Langkah 6: Pindah ke method **`dispose()`**

### Langkah 7: Pindah ke method **`build()`**

### Langkah 8: Edit method **`addRandomNumber()`**

### **Langkah 9: Run**

### Langkah 10: Tekan button ‘Stop Subscription'


# Praktikum 5: Multiple stream subscriptions
### Langkah 1: Buka file **`main.dart`**

### Langkah 2: Edit **`initState()`**

### **Langkah 3: Run**

### Langkah 4: Set broadcast stream

### Langkah 5: Edit method **`build()`**

### **Langkah 6: Run**


# Praktikum 6: StreamBuilder
### **Langkah 1: Buat Project Baru**

### Langkah 2: Buat file baru **`stream.dart`**

### Langkah 3: Tetap di file **`stream.dart`**

### **Langkah 4: Edit main.dart**

### Langkah 5: Tambah variabel

### Langkah 6: Edit **`initState()`**

### Langkah 7: Edit method **`build()`**

### **Langkah 8: Run**


# Praktikum 7: BLoC Pattern
### Langkah 1: Buat Project baru

### Langkah 2: Isi kode **`random_bloc.dart`**

### Langkah 3: Buat **`class RandomNumberBloc()`**

### Langkah 4: Buat variabel **`StreamController`**

### **Langkah 5: Buat constructor**

### Langkah 6: Buat method **`dispose()`**

### Langkah 7: Edit **`main.dart`**

### Langkah 8: Buat file baru **`random_screen.dart`**

### Langkah 9: Lakukan impor material dan **`random_bloc.dart`**

### **Langkah 10: Buat StatefulWidget RandomScreen**

### **Langkah 11: Buat variabel**

### Langkah 12: Buat method **`dispose()`**

### Langkah 13: Edit method **`build()`**
