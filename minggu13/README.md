# Praktikum 1: Konversi Dart model ke JSON
### **Langkah 1: Buat Project Baru**

### Langkah 2: Buka file **`main.dart`**

### Langkah 3: Buat folder baru **`assets`**

### Langkah 4: Buat file baru **`pizzalist.json`**

### Langkah 5: Edit **`pubspec.yaml`**

### Langkah 6: Edit **`maint.dart`**

### Langkah 7: Tetap di **`main.dart`**

### **Langkah 8: Panggil method readJsonFile**

### Langkah 9: Tampilkan hasil JSON

### **Langkah** 10: Run

### **Langkah** 11: Buat file baru **`pizza.dart`**

### **Langkah 12: Model pizza.dart**

### Langkah 13: Buat `constructor()`

### Langkah 14: Pindah ke **`class _MyHomePageState`**

### **Langkah 15: Pastikan impor class**

### Langkah **16: Konversi List Map ke List Objek Dart**

### **Langkah** **17: return myPizzas**

### **Langkah** **18: Perbarui Signature Method**

### **Langkah** **19: Deklarasikan Variabel State**

### **Langkah** **20: Panggil di initState dan Perbarui State**

### **Langkah** **21: Tampilkan Data di ListView**

### **Langkah** **22: Run**

### **Langkah** **23: Tambahkan Method toJson() (Serialization)**

### **Langkah** **24: Buat Fungsi Konversi JSON String**

### **Langkah** **25: Tampilkan Output JSON di Konsol**

### **Langkah** **26: Cek Output Konsol**


# Praktikum 2: Handle kompatibilitas data JSON
### Langkah 1: Simulasikan Error

### Langkah 2: Lihat Error Tipe Data String ke Int

### Langkah 3: Terapkan tryParse dan Null Coalescing pada ID

### Langkah 4: Simulasikan Error Null pada String

### Langkah 5: Terapkan Null Coalescing pada String

### **Langkah** 6: Gunakan toString() untuk Field String

### **Langkah** **7: Simulasikan Error Tipe Data String ke Double**

### Langkah 8: Terapkan double.tryParse

### **Langkah 9: Run dan Perhatikan Output Null**

### Langkah 10: Tambahkan Operator Ternary untuk Output User-Friendly

### Langkah 11: Run


# Praktikum 3: Menangani error JSON
### Langkah 1: Buka `pizza.dart` **dan Buat Konstanta**

### Langkah 2: Perbarui fromJson() menggunakan Konstanta

### Langkah 3: Perbarui toJson() menggunakan Konstanta

### **Langkah 4: Run**


# Praktikum 4: SharedPreferences
### Langkah 1: Tambahkan Dependensi

### Langkah 2: Install Dependensi

### Langkah 3: Lakukan Import

### Langkah 4: Tambahkan Variabel appCounter

### **Langkah 5: Buat Method readAndWritePreference**

### Langkah 6: Dapatkan Instance SharedPreferences

### Langkah 7: Baca, Cek Null, dan Increment Counter

### Langkah 8: Simpan Nilai Baru

### **Langkah 9: Perbarui State**

### Langkah 10: Panggil di initState()

### **Langkah 11: Perbarui Tampilan (body)**

### **Langkah 12: Run**

### **Langkah 13: Buat Method deletePreference()**

### **Langkah 14: Panggil deletePreference()**

### **Langkah 15: Run**


# Praktikum 5: Akses filesystem dengan path_provider
### Langkah 1: Tambahkan Dependensi

### Langkah 2: Lakukan Import

### **Langkah 3: Tambahkan Variabel Path State**

### Langkah 4: Buat Method getPaths()

### Langkah 5: Panggil getPaths() di initState()

### **Langkah 6: Perbarui Tampilan**

### **Langkah 7: Run**


# Praktikum 6: Akses filesystem dengan direktori
### **Langkah 1: Lakukan Import dart:io**

### Langkah 2: Tambahkan Variabel File dan Text

### Langkah 3: Buat Method writeFile()

### **Langkah 4: Inisialisasi File dan Panggil writeFile() di initState()**

### Langkah 5: Buat Method readFile()

### Langkah 6: Edit build() dan Tambahkan Tombol Baca

### Langkah 7: Run


# Praktikum 7: Menyimpan data dengan enkripsi/dekripsi
### Langkah 1: Tambahkan Dependensi

### Langkah 2: Lakukan Import

### Langkah 3: Tambahkan Variabel dan Controller

### Langkah 4: Inisialisasi Secure Storage

### **Langkah 5: Buat Method writeToSecureStorage()**

### Langkah 6: Buat Method readFromSecureStorage()

### Langkah 7: Edit build() untuk UI dan Logic

### Langkah 8: Hubungkan Read ke Tombol

### Langkah 9: Run
