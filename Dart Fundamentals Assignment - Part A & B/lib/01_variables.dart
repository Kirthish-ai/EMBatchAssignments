void main() {
  // 1. var Keyword
  var cityName = "Tokyo";
  print('City: $cityName, Type: ${cityName.runtimeType}');

  // 2. Object vs dynamic
  Object objVal = 42;
  // objVal.nonExistentMethod(); // Compile-time Error: The method 'nonExistentMethod' isn't defined for the class 'Object'.
  print('objVal: $objVal');

  dynamic dynVal = "Hello";
  dynVal = 100;
  // dynVal.toUpperCase(); // Runtime Error: NoSuchMethodError: Class 'int' has no instance method 'toUpperCase'.
  print('dynVal: $dynVal');

  // 3. final vs const
  // 'final' is initialized at runtime, allowing dynamic values like DateTime.now().
  // 'const' is evaluated at compile-time and requires a constant literal or expression.
  final DateTime currentTime = DateTime.now();
  const double pi = 3.14159;
  print('Current Time: $currentTime, Pi: $pi');

  // 4. int & double
  int age = 25;
  double temperature = 98.6;
  double divisionResult = temperature / age;
  print('Temperature divided by age: $divisionResult');

  // 5. String & Interpolation
  String firstName = "Ada";
  String lastName = "Lovelace";
  String fullName = "$firstName $lastName";
  print("User: $fullName (Length: ${fullName.length})");

  // 6. bool
  bool isLoggedIn = false;
  isLoggedIn = !isLoggedIn;
  print('isLoggedIn: $isLoggedIn');

  // 7. Runes & UTF-32
  String emojiString = '🎯';
  print('Code Units: ${emojiString.codeUnits}');
  print('Runes: ${emojiString.runes.toList()}');
}