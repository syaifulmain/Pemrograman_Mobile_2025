## Praktikum 1: Mengunduh Data dari Web Service (API)
### Langkah 1: Buat Project Baru
create new project
```bash
flutter create books
```
http
```bash
flutter pub add http
```
### Langkah 2: Cek file `pubspec.yaml`
```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0
```
### Langkah 3: Buka file `main.dart`
>  **Soal 1**
> 
>Tambahkan **nama panggilan Anda** pada `title` app sebagai identitas hasil pekerjaan Anda.

```dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syaiful',
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Back from the Future')),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(onPressed: () {}, child: const Text('GO!')),
            const Spacer(),
            Text(result),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
```
### Langkah 4: Tambah method `getData()`
```dart
  Future<Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/qBFhEAAAQBAJ';
    Uri url = Uri.https(authority, path);
    return await http.get(url);
  }
```
> **Soal 2**
>
> - Carilah judul buku favorit Anda di Google Books, lalu ganti ID buku pada variabel `path` di kode tersebut. Caranya ambil di URL browser Anda seperti gambar berikut ini.
> - https://www.googleapis.com/books/v1/volumes/qBFhEAAAQBAJ
### Langkah 5: Tambah kode di `ElevatedButton`
```dart
ElevatedButton(
  onPressed: () {
    setState(() {});
    getData()
        .then((value) {
          result = value.body.toString().substring(0, 450);
          setState(() {});
        })
        .catchError((_) {
          result = 'An error occurred';
          setState(() {});
        });
  },
  child: const Text('GO!'),
),
```
> **Soal 3**
> 
> - Jelaskan maksud kode langkah 5 tersebut terkait `substring` dan `catchError`!
>   - Hanya mengambil data dari 0 sampai 450.
>   - Menangkap error jika terjadi.
> - Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "**W11: Soal 3**".

![p1m11.gif](./images/p1m11.gif)

## Praktikum 2: Menggunakan await/async untuk menghindari callbacks
### Langkah 1: Buka file `main.dart`
```dart
Future<int> returnOneAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 1;
}

Future<int> returnTwoAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 2;
}

Future<int> returnThreeAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 3;
}
```
### Langkah 2: Tambah method `count()`
```dart
Future count() async {
  int total = 0;
  total = await returnOneAsync();
  total += await returnTwoAsync();
  total += await returnThreeAsync();
  setState(() {
    result = total.toString();
  });
}
```
### Langkah 3: Panggil `count()`
```dart
ElevatedButton(
  onPressed: () {
    count();
  },
  child: const Text('GO!'),
),
```
### Langkah 4: Run
>**Soal 4**
>
> - Jelaskan maksud kode langkah 1 dan 2 tersebut!
>   - Mendemonstrasikan penggunaan await/async yang mana akan menghasilkan nilai 6.
> - Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "**W11: Soal 4**".

![p2m11.gif](./images/p2m11.gif)

## Praktikum 3: Menggunakan Completer di Future
### Langkah 1: Buka `main.dart`
```dart
import 'package:async/async.dart';
```
### Langkah 2: Tambahkan variabel dan method
```dart
late Completer completer;

Future getNumber() {
  completer = Completer<int>();
  calculate();
  return completer.future;
}

Future calculate() async {
  await Future.delayed(const Duration(seconds: 5));
  completer.complete(42);
}
```
### Langkah 3: Ganti isi kode `onPressed()`
```dart
ElevatedButton(
  onPressed: () {
    getNumber().then((value) {
      setState(() {
        result = value.toString();
      });
    });
  },
  child: const Text('GO!'),
),
```
### Langkah 4:
> **Soal 5**
>
> - Jelaskan maksud kode langkah 2 tersebut!
>   - Kode tersebut mendemonstrasikan penggunaan Completer untuk mengontrol completion (penyelesaian) sebuah Future secara manual.
> - Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 5".

![p3m11.gif](./images/p3m11.gif)

### Langkah 5: Ganti method `calculate()`
```dart
Future calculate() async {
  try {
    await Future.delayed(const Duration(seconds: 5));
    completer.complete(42);
  } catch (_) {
    completer.completeError({});
  }
}
```

### Langkah 6: Pindah ke `onPressed()`
```dart
ElevatedButton(
  onPressed: () {
    getNumber()
        .then((value) {
          setState(() {
            result = value.toString();
          });
        })
        .catchError((e) {
          result = 'An error occurred';
        });
  },
  child: const Text('GO!'),
),
```
> Soal 6
>
> - Jelaskan maksud perbedaan kode langkah 2 dengan langkah 5-6 tersebut!
>    - Penggunaan try catch jika terjadi error
> - Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 6".

![p32m11.gif](./images/p32m11.gif)


## Praktikum 4: Memanggil Future secara paralel
### Langkah 1: Buka file `main.dart`
```dart
void returnFG(){
  FutureGroup<int> futureGroup = FutureGroup<int>();
  futureGroup.add(returnOneAsync());
  futureGroup.add(returnTwoAsync());
  futureGroup.add(returnThreeAsync());
  futureGroup.close();
  futureGroup.future.then((List<int> value) {
    int total = 0;
    for (var element in value){
      total += element;
    }
    setState(() {
      result = total.toString();
    });
  });
}
```

### Langkah 2: Edit `onPressed()`
```dart
onPressed: () {
    returnFG();
}
```

### Langkah 3: Run
> **Soal 7**
>
> - Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 7".

![alt text](./images/p4m11.gif)

### Langkah 4: Ganti variabel `futureGroup`
```dart
final futures = Future.wait<int>([
  returnOneAsync(),
  returnTwoAsync(),
  returnThreeAsync(),
]);
futures.then((List<int> value) {
  int total = 0;
  for (var element in value) {
    total += element;
  }
  setState(() {
    result = total.toString();
  });
});
```
> Soal 8
>
> - Jelaskan maksud perbedaan kode langkah 1 dan 4!
>   - implementasi future secara pararel untuk menghemat waktu

## Praktikum 5: Menangani Respon Error pada Async Code
### Langkah 1: Buka file `main.dart`
```dart
Future returnError() async {
  await Future.delayed(const Duration(seconds: 2));
  throw Exception('Something terrible happened!');
}
```

### Langkah 2: ElevatedButton
```dart
returnError()
  .then((value) {
    setState(() {
      result = 'Success';
    });
  })
  .catchError((e) {
    setState(() {
      result = e.toString();
    });
  }).whenComplete(() => print('Operation finished'));
```

### Langkah 3: Run
> **Soal 9**
>
> - Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 9".

![alt text](./images/p5m11.gif)

### Langkah 4: Tambah method `handleError()`
```dart
Future handleError() async {
  try {
    await returnError();
  } catch (e) {
    setState(() {
      result = e.toString();
    });
  } finally {
    print('Operation finished');
  }
}
```
> Soal 10
>
> - Panggil method handleError() tersebut di ElevatedButton, lalu run. Apa hasilnya? Jelaskan perbedaan kode langkah 1 dan 4!

![alt text](./images/p52m11.gif)

## Praktikum 6: Menggunakan Future dengan StatefulWidget
### Langkah 1: install plugin geolocator
```bash
flutter pub add geolocator
```

### Langkah 2: Tambah permission GPS
```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>

```
### Langkah 3: Buat file `geolocation.dart`
```file
geolocation.dart
```

### Langkah 4: Buat StatefulWidget
`class LocationScreen`

### Langkah 5: Isi kode `geolocation.dart`
```dart
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = 'Unknown';

  Future<Position> getPosition() async {
    await Geolocator.requestPermission();
    await Geolocator.isLocationServiceEnabled();
    Position? position = await Geolocator.getCurrentPosition();
    return position;
  }

  @override
  void initState() {
    super.initState();
    getPosition().then((position) {
      setState(() {
        myPosition =
            'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Syaiful Geolocation Example')),
      body: Center(child: Text(myPosition)),
    );
  }
}
```
> Soal 11
>
> - Tambahkan nama panggilan Anda pada tiap properti title sebagai identitas pekerjaan Anda.
>   - appBar: AppBar(title: const Text('Syaiful Geolocation Example')),


### Langkah 6: Edit main.dart
```dart
home: const LocationScreen()
```

### Langkah 7: Run
![alt text](./images/p6m11.png)

### Langkah 8: Tambahkan animasi loading
```dart
@override
Widget build(BuildContext context) {
  final myWidget = myPosition == 'Unknown'
        ? const CircularProgressIndicator()
        : Text(myPosition);

  return Scaffold(
    appBar: AppBar(title: const Text('Syaiful Geolocation Example')),
    body: Center(child: myWidget),
  );
}
```
> Soal 12
>
> - Jika Anda tidak melihat animasi loading tampil, kemungkinan itu berjalan sangat cepat. Tambahkan delay pada method getPosition() dengan kode await Future.delayed(const Duration(seconds: 3));
> - Apakah Anda mendapatkan koordinat GPS ketika run di browser? Mengapa demikian?
> - Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 12".

![alt text](./images/p62m11.gif)


## Praktikum 7: Manajemen Future dengan FutureBuilder
### Langkah 1: Modifikasi method `getPosition()`
```dart
Future<Position> getPosition() async {
  await Geolocator.requestPermission();
  await Geolocator.isLocationServiceEnabled();
  await Future.delayed(const Duration(seconds: 3));
  Position? position = await Geolocator.getCurrentPosition();
  return position;
}
```

### Langkah 2: Tambah variabel
```dart
Future<Position>? position;
```

### Langkah 3: Tambah `initState()`
```dart
@override
void initState() {
  super.initState();
  position = getPosition();
}
```
### Langkah 4: Edit method `build()`
```dart
return Scaffold(
  appBar: AppBar(title: const Text('Syaiful Geolocation Example')),
  body: Center(
    child: FutureBuilder(
      future: position,
      builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Text(snapshot.data.toString());
        } else {
          return const Text('');
        }
      },
    ),
  ),
);
```
> Soal 13
>
> - Apakah ada perbedaan UI dengan praktikum sebelumnya? Mengapa demikian?
>   - Tidak ada, karena hanya merubah cara menerima data.
> - Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 13".
> - Seperti yang Anda lihat, menggunakan FutureBuilder lebih efisien, clean, dan reactive dengan Future bersama UI.

![alt text](./images/p7m11.png)

### Langkah 5: Tambah handling error
```dart
else if (snapshot.connectionState == ConnectionState.done) {
  if (snapshot.hasError) {
    return Text('Something terrible happened!');
  }
  return Text(snapshot.data.toString());
}
```
> Soal 14
>
> - Apakah ada perbedaan UI dengan langkah sebelumnya? Mengapa demikian?
>   - menambahkan handle jika terjadi error
> - Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 14".


## Praktikum 8: Navigation route dengan Future Function
### Langkah 1: Buat file baru `navigation_first.dart`
```file
navigation_first.dart
```

### Langkah 2: Isi kode `navigation_first.dart`
```dart
import 'package:flutter/material.dart';

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  Color color = Colors.blue.shade700;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(title: const Text('Syaiful Navigation First Screen')),
      body: Center(
        child: ElevatedButton(onPressed: () {
          _navigateAndGetColor(context);
        }, child: const Text('Change Color')),
      )
    );
  }
}
```

### Langkah 3: Tambah method di `class _NavigationFirstState`
```dart
Future _navigateAndGetColor(BuildContext context) async {
  color = await Navigator.push(context,
      MaterialPageRoute(builder: (context) => const NavigationSecond()),) ?? Colors.blue;
  setState(() {});
  });
}
```

### Langkah 4: Buat file baru `navigation_second.dart`

### Langkah 5: Buat class NavigationSecond dengan StatefulWidget
```dart
import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color color;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Second Page')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, Colors.red);
              },
              child: const Text('Red Color'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, Colors.green);
              },
              child: const Text('Green Color'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, Colors.blue);
              },
              child: const Text('Blue Color'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Langkah 6: Edit `main.dart`
```dart
home: const NavigationFirst()
```

### Langkah 8: Run
> Soal 16
>
> - Cobalah klik setiap button, apa yang terjadi ? Mengapa demikian ?
>   - background halaman pertama berubah.
> - Gantilah 3 warna pada langkah 5 dengan warna favorit Anda!
> - Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 16".

![alt text](./images/p8m11.gif)

## Praktikum 9: Memanfaatkan async/await dengan Widget Dialog
### Langkah 1: Buat file baru `navigation_dialog.dart`

### Langkah 2: Isi kode `navigation_dialog.dart`
``` dart
import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Syaifullah Navigation Dialog Screen'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {}, child: const Text('Change Color')),
      ),
    );
  }
}
```

### Langkah 3: Tambah method async
```dart
_showColorDialog(BuildContext context) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Very important question'),
          content: const Text('Please choose a color'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                color = Colors.red;
                Navigator.pop(context, color);
              },
              child: const Text('Red'),
            ),
            TextButton(
              onPressed: () {
                color = Colors.green;
                Navigator.pop(context, color);
              },
              child: const Text('Green'),
            ),
            TextButton(
              onPressed: () {
                color = Colors.blue;
                Navigator.pop(context, color);
              },
              child: const Text('Blue'),
            ),
          ],
        );
      },
    );
    setState(() {});
  }
```

### Langkah 4: Panggil method di `ElevatedButton`
```dart
body: Center(
  child: ElevatedButton(
    onPressed: () {
      _showColorDialog(context);
    },
    child: const Text('Change Color'),
  ),
),
```

### Langkah 5: Edit `main.dart`
```dart
home: const NavigationDialogScreen()
```

### Langkah 6: Run
>Soal 17
>
> - Cobalah klik setiap button, apa yang terjadi ? Mengapa demikian ?
>   - warna background berubah
> - Gantilah 3 warna pada langkah 3 dengan warna favorit Anda!
> - Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 17".

![alt text](./images/p9m11.gif)