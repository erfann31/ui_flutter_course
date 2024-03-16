import 'dart:math';

main() {
  var y = 1;
  // var y = "1";
  var flag = true;
  // =========================

  print('hello world ' + y.toString() + ' hello world');
  print('hello world ${y + 2}');
  print('hello world ${flag}');
  y = 5;
  print(y);
// =========================

  if (y >= 5) {
    print('>=5');
  } else if (y > 1) {
    print('>1');
  } else if (y > 20) {
    print('>20');
  } else {
    print('<5');
  }
// =========================
  y = 3;
  switch (y) {
    case 0:
      print('x is zero');
      break;
    case 1:
      print('x is one');
      break;
    default:
      print('x is another');
  }
  for (int i = 1; i < 5; i++) {
    print('hello world ${i}');
  }

  y = 1;
  while (y < 5) {
    print('hello world ${y}');
    y++;
  }
  // ============================
  // var res = sum(2, 3);
  var res = sum("2", "3");
  print(res);
  // var res = sum("2", 3);
  res = sum(2, 2.3);
  print(res);
  // =====================
  var a = sum2(1.4, 2.3);
  print(a);
  print(a.round());
  // print(round(1.4, 2.3, 1));
  print(round(1.4, 2.3, 1, sub2));
  // ==========================
  // print(mul2(2, 3, 4));
  print(mul2(2, 3));
  print(mul2(2, 3, z: 4));
}

sum(x, y) {
// int sum(int x, int y) {
  var s = x + y;
  return s;
}

sum2(x, y) => x + y;
sub2(x, y) => x - y;
// mul2(x, y, {z}) => x * y * z;
mul2(x, y, {z = 1}) => x * y * z;

// round(x, y, dotPlace) {
//   var mod = pow(10.0, dotPlace);
//   return (((x + y) * mod).round() / mod);
// }
round(x, y, dotPlace, Function(double, double) f) {
  var mod = pow(10.0, dotPlace);
  return ((f(x, y) * mod).round() / mod);
}
