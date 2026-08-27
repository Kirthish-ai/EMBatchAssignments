class UserProfile {
  // 1. late Keyword
  late String bio;

  void initBio() {
    bio = "Developer from NYC";
  }
}

// 2. Never Type
Never throwFatalError(String msg) {
  throw Exception("Fatal Error: $msg");
}

void main() {
  // 1. Test late keyword
  UserProfile profile = UserProfile();
  profile.initBio();
  print('Bio: ${profile.bio}');

  // 3. Non-Nullable vs Nullable Types (?)
  int nonNullable = 10;
  int? nullableVal = null;
  print('Non-nullable: $nonNullable, Nullable: $nullableVal');

  // 4. If-Null Operator (??) & Null-Aware Assignment (??=)
  int result = nullableVal ?? 0;
  print('Result using ?? operator: $result');

  nullableVal ??= 5;
  print('nullableVal after ??= 5: $nullableVal');

  // 5. Null-Aware Access (?.) & Bang Operator (!)
  String? text;
  print('Null-aware access on null: ${text?.length}');

  text = "Dart";
  print('Bang operator access: ${text!.length}');

  // 6. Type Promotion
  Object data = "Smart Cast";
  if (data is String) {
    // data is automatically promoted from Object to String
    print('Promoted data uppercase: ${data.toUpperCase()}');
  }
}