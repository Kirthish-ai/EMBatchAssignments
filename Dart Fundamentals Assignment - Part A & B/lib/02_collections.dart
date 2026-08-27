void main() {
  // 1. List
  List<int> numbers = [10, 20, 30];
  numbers.add(40);
  numbers.remove(10);
  print('Second item in list: ${numbers[1]}'); // Output: 30

  // 2. Set
  Set<String> fruits = {"apple", "banana", "apple"};
  print('Set elements (unique): $fruits');

  // 3. Map
  Map<String, dynamic> student = {'name': 'Alex', 'grade': 'A'};
  student['age'] = 20;
  print('Student map: $student');

  // 4. Type Conversion
  int parsedInt = int.parse("123");
  print('Parsed Int: $parsedInt');

  double floatVal = 45.67;
  String formattedDouble = floatVal.toStringAsFixed(1);
  print('Formatted Double: $formattedDouble');
}