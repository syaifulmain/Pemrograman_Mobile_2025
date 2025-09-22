void main()
{
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1,
    'nama': 'Muhamad Syaifullah',
    'nim': '2341720013',
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2,
    36: 'Muhamad Syaifullah',
    54: '2341720013',
  };

  var mhs1 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';
  gifts['nama'] = 'Muhamad Syaifullah';
  gifts['nim'] = '2341720013';

  var mhs2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';
  nobleGases[36] = 'Muhamad Syaifullah';
  nobleGases[54] = '2341720013';

  print(gifts);
  print(nobleGases);
}