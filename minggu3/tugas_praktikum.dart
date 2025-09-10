void main() {
  String nama = "Muhamad Syaifullah";
  String nim = "2341720103";

  print("Bilangan Prima antara 1 - 200:");
  for (int i = 0; i <= 201; i++) {
    if (isPrime(i)) {
      print("$i - $nama ($nim)");
    }
  }
}

bool isPrime(int n) {
  if (n < 2) return false;
  for (int i = 2; i * i <= n; i++) {
    if (n % i == 0) return false;
  }
  return true;
}
