void main(){
  // var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  // print(halogens);

  var names1 = <String>{};
  Set<String> names2 = {}; // This works, too.
  // var names3 = {}; // Creates a map, not a set.

  names1.add('Syaifullah');
  names1.add('2341720013');
  names2.addAll(['Syaifullah', '2341720013']);

  print(names1);
  print(names2);
  // print(names3);
}
