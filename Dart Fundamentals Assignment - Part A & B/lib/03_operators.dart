class Student {
  String name = '';
  int score = 0;
  void display() => print('$name scored $score');
}

void main() {
  // 1. Arithmetic & Relational Operators
  int modResult = 17 % 4;
  int intDivisionResult = 17 ~/ 4;
  print('17 % 4 = $modResult, 17 ~/ 4 = $intDivisionResult');

  bool isGreaterOrEqual = 10 >= 10;
  print('Is 10 >= 10? $isGreaterOrEqual');

  // 2. Type Test (is, is!) & Type Cast (as)
  dynamic val = "Dart Language";
  if (val is String) {
    print('val is indeed a String');
  }

  String text = val as String;
  print('Length of casted string: ${text.length}');

  // 3. Logical & Ternary Operators
  bool hasTicket = true;
  bool hasId = false;
  bool canEnter = hasTicket && hasId;
  String status = hasTicket ? "Allowed" : "Denied";
  print('Can enter: $canEnter, Status: $status');

  // 4. Cascade (..) & Null-Aware Cascade (?..)
  Student()
    ..name = 'John'
    ..score = 95
    ..display();

  Student? nullableStudent;
  nullableStudent
    ?..name = 'Sarah'
    ..score = 88
    ..display(); // Safely ignored because nullableStudent is null
}