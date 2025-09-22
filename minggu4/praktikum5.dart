void main()
{
  var record = ('first', a: 2, b: true, 'last');
  print(record);

  (int, int) tukar((int, int) record) {
    var (a, b) = record;
    return (b, a);
  }

  print(tukar((5, 7))); 

  // Record type annotation in a variable declaration:
  (String, int) mahasiswa = ('Muhamad Syaifullah', 2341720013);
  print(mahasiswa);

  var mahasiswa2 = ('Muhamad Syaifullah', a: 2341720013, b: true, 'last');

  print(mahasiswa2.$1); // Prints 'Muhamad Syaifullah'
  print(mahasiswa2.a); // Prints 2341720013
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints 'last'
}