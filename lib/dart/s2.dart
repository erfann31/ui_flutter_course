main() {
  var sum = mul2(x: 2, z: 3);
  print(sum);

  // =========================

  for (int i = 1; i < 6; i++) {
    if (i == 3) continue;
    if (i == 5) break;
    print('hello world ${i}');
  }

  // =========================

  final v1 = 12;
  const v2 = 13;
  // v1 = 13;
  // v2 = 12;
  if (v1 is double) print("its double");
  print(num.parse('12') is int);
  print(num.parse('12.25').sign);
  // print(num.parse('10.91a'));

  // =====================

  var num1 = 14;
  print(num1.isOdd);

  // =====================

  var num2 = 14.54;
  print(num2.round());

  // ==========================

  String uStr = " ABC ";
  String lStr = "hello";
  print(uStr.trim());
  print(lStr.substring(1, 3));

  // ==========================

  List lst1 = List.filled(3, Null);
  print(lst1);
  lst1[0] = 12;
  lst1[1] = 13;
  lst1[2] = 11;
  print(lst1);
  // lst.add(12);
  // print(lst);

  // ==========================

  List lst2 = [];
  lst2.add(12);
  print(lst2);
  lst2.addAll(lst1);
  print(lst2);
  lst2.insert(2, 11);
  print(lst2);
  lst2.insertAll(2, lst1);
  print(lst2);
  print(lst2.reversed);

  // ==========================

  var user = {'Username': 'erfan', 'Password': 'erfan123'};
  user['id'] = '2';
  print(user);
  user['Username'] = 'erfan1';
  user['Password'] = 'erfan1234';
  print(user);

  var user2 = new Map();
  user2['name'] = 'erfan';
  user2['std_n'] = '99361...';
  user2['num'] = '0910...';
  print(user2);
  print(user2.entries);
  print(user2.keys);
  print(user2.values);
  user2.addAll(user);
  print(user2);
  user2.remove("num");
  print(user2);
  user2.forEach(
    (key, value) {
      print('${key}: ${value}');
    },
  );

  // ==========================

  // rectangle r1 = new rectangle();
  var r1 = rectangle.c0();
  // var r1 = rectangle(4,5);
  r1.h = 5;
  r1.w = 2;
  r1._h = 3;
  r1._w = 6;
  print(r1.area());
  print(r1.area2());
  r1.width = 5;
  print(r1.area());
  print(r1.width);

  // ===============================

  square s = square(5);
  print(s.area2());
}

// mul2(x, y, {z = 1}) => x * y * z;
mul2({x = 1, y = 1, z = 1}) => x * y * z;

// ===========================

class rectangle {
  var h, w;
  var _h, _w;
  rectangle.c0() {}
  // rectangle.c1(w, h) {
  //   this._w = w;
  //   this._h = h;
  // }
  // rectangle.c2(w) {
  //   this._w = w;
  //   this._h = 1;
  // }

  rectangle.c1(this._w, this._h);
  rectangle.c2(this._w);
  set width(arg) {
    _w = arg;
  }

  get width {
    return _w;
  }

  set height(arg) {
    _h = arg;
  }

  get height {
    return _h;
  }

  area() => h * w;
  area2() => _h * _w;
}

class square extends rectangle {
  square(side) : super.c1(side, side);

  @override
  set width(arg) {
    super.width = arg;
    super.height = arg;
  }

  @override
  set height(arg) {
    super.width = arg;
    super.height = arg;
  }
}

class test {

  @override
  toString() {
    var temp = super.toString();
    return temp + " test calss";
  }
}
