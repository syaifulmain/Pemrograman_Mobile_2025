# Tugas Praktikum 1

## 1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki.
### Langkah 1: Buat Project Baru
![](./image/Pasted%20image%2020251102135845.png)
### Langkah 2: Membuat model **`task.dart`**
```dart
class Task {
  final String description;
  final bool complete;

  const Task({this.complete = false, this.description = ''});
}
```
### Langkah 3: Buat file **`plan.dart`**
```dart
import './task.dart';

class Plan {
  final String name;
  final List<Task> tasks;

  const Plan({this.name = '', this.tasks = const []});
}
```
### Langkah 4: Buat file **`data_layer.dart`**
```dart
export 'plan.dart';  
export 'task.dart';
```
### Langkah 5: Pindah ke file **`main.dart`**
```dart
import 'package:flutter/material.dart';
import './views/plan_screen.dart';

void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: PlanScreen(),
    );
  }
}
```
### Langkah 6: buat **`plan_screen.dart`**
```dart
import '../models/data_layer.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  Plan plan = const Plan();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Master Plan Muhamad Syaifullah')),
      body: _buildList(),
      floatingActionButton: _buildAddTaskButton(),
    );
  }
}
```
### Langkah 7: buat method **`_buildAddTaskButton()`**
```dart
Widget _buildAddTaskButton() {  
  return FloatingActionButton(  
    child: const Icon(Icons.add),  
    onPressed: () {  
      setState(() {  
        plan = Plan(  
          name: plan.name,  
          tasks: List<Task>.from(plan.tasks)..add(const Task()),  
        );  
      });  
    },  
  );  
}
```
### Langkah 8: buat widget **`_buildList()`**
```dart
Widget _buildList() {  
  return ListView.builder(  
    itemCount: plan.tasks.length,  
    itemBuilder: (context, index) => _buildTaskTile(plan.tasks[index], index),  
  );  
}
```
### Langkah 9: buat widget **`_buildTaskTile`**
```dart
Widget _buildTaskTile(Task task, int index) {  
  return ListTile(  
    leading: Checkbox(  
      value: task.complete,  
      onChanged: (selected) {  
        setState(() {  
          plan = Plan(  
            name: plan.name,  
            tasks: List<Task>.from(plan.tasks)  
              ..[index] = Task(  
                description: task.description,  
                complete: selected ?? false,  
              ),  
          );  
        });  
      },  
    ),  
    title: TextFormField(  
      initialValue: task.description,  
      onChanged: (text) {  
        setState(() {  
          plan = Plan(  
            name: plan.name,  
            tasks: List<Task>.from(plan.tasks)  
              ..[index] = Task(description: text, complete: task.complete),  
          );  
        });  
      },  
    ),  
  );  
}
```
### **Langkah 10: Tambah Scroll Controller**
```dart
class _PlanScreenState extends State<PlanScreen> {  
  Plan plan = const Plan();  
  late ScrollController scrollController;
  ...
  }
```
### **Langkah 11: Tambah Scroll Listener**
```dart
@override  
void initState() {  
  super.initState();  
  scrollController = ScrollController()  
    ..addListener(() {  
      FocusScope.of(context).requestFocus(FocusNode());  
    });  
}
```
### **Langkah 12: Tambah controller dan keyboard behavior**
```dart
Widget _buildList() {  
  return ListView.builder(  
    controller: scrollController,  
    keyboardDismissBehavior: Theme.of(context).platform == TargetPlatform.iOS  
        ? ScrollViewKeyboardDismissBehavior.onDrag  
        : ScrollViewKeyboardDismissBehavior.manual,  
    itemCount: plan.tasks.length,  
    itemBuilder: (context, index) => _buildTaskTile(plan.tasks[index], index),  
  );  
}
```
### **Langkah 13: Terakhir, tambah method dispose()**
```dart
@override  
void dispose() {  
  scrollController.dispose();  
  super.dispose();  
}
```
### **Langkah 14: Hasil**
![](./image/2025-11-0218-07-22-ezgif.com-video-to-gif-converter.gif)

## 2. Jelaskan maksud dari langkah 4 pada praktikum tersebut! Mengapa dilakukan demikian?
* Membungkus beberapa data layer ke dalam sebuah file yang nanti akan mengekspor kedua model tersebut. Dengan begitu, proses impor akan lebih ringkas seiring berkembangnya aplikasi. Buat file bernama `data_layer.dart` di folder **models**. Kodenya hanya berisi `export` dari **models** lain.
## 3. Mengapa perlu variabel plan di langkah 6 pada praktikum tersebut? Mengapa dibuat konstanta ?
* Variabel `plan` diperlukan untuk menyimpan dan mengelola seluruh data rencana dan daftar tugasnya yang ditampilkan di layar, dan dibuat `const` pada awalnya sebagai inisialisasi objek kosong yang efisien.
## 4. Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!
![](./image/2025-11-0218-07-22-ezgif.com-video-to-gif-converter.gif)
* Memuat todo list
## 5. Apa kegunaan method pada Langkah 11 dan 13 dalam lifecyle state ?
* Langkah 11 (`initState`): Metode ini berfungsi untuk melakukan inisialisasi satu kali saat widget pertama kali dibuat dan dimasukkan ke dalam pohon widget. Dalam kode ini, `initState` digunakan untuk membuat objek `ScrollController` dan menambahkan listener (pendengar) padanya. Listener ini akan menghilangkan fokus dari `TextFormField` (sehingga keyboard menutup) setiap kali pengguna melakukan scroll pada daftar.
* Langkah 13 (`dispose`): Metode ini berfungsi untuk membersihkan sumber daya (resources) yang digunakan oleh state sebelum widget dihancurkan dan dihapus dari pohon widget. Dalam kasus ini, `dispose` memanggil `scrollController.dispose()` untuk melepaskan memori yang digunakan oleh `ScrollController` tersebut, mencegah kebocoran memori (memory leaks).
## 6. Kumpulkan laporan praktikum Anda berupa link commit atau repository GitHub ke dosen yang telah disepakati !


# Tugas Praktikum 2

# Tugas Praktikum 3
