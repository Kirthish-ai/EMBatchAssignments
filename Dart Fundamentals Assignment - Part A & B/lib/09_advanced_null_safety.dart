// 1. Sound Null Safety & Late Initialization Lifecycle
class DatabaseManager {
  late final String connectionString = _initConnection();

  String _initConnection() {
    print('Connecting to Database...');
    return "postgres://localhost:5432/db";
  }
}

// 2. The Never Type for Exhaustive Error Handling
Never failWithUnreachable(String reason) {
  throw ArgumentError("Fatal Application Error: $reason");
}

// 3. Type Promotion & Fail-Fast Guards using Never
void processInput(Object? input) {
  if (input == null) {
    failWithUnreachable("Input cannot be null");
  }

  // 'input' is automatically promoted from Object? to Object (non-nullable)
  print('Input type promoted length: ${input.toString().length}');
}

class Cache {
  String? _cachedData = "Cached Payload Data";

  void validateCache() {
    // Local copy enables type promotion for private fields
    final localData = _cachedData;
    if (localData != null) {
      print('Cache data length: ${localData.length}');
    } else {
      print('Cache is empty');
    }
  }
}

// Helper class to safely demonstrate runtime LateInitializationError
class LateHolder {
  late String unassignedField;
}

void main() {
  // Test DatabaseManager late init
  var db = DatabaseManager();
  print('DB Manager instantiated, connectionString not read yet.');
  print('DB Connection string: ${db.connectionString}');

  // Process valid input
  processInput("Active Token");

  // Cache promotion
  Cache().validateCache();

  // 4. Late Initialization Edge Case & Error Handling
  var holder = LateHolder();
  try {
    // Accessing an uninitialized late field triggers a runtime LateInitializationError
    print(holder.unassignedField);
  } catch (e) {
    print('Caught expected late init error: $e');
  }

  // Proper assignment
  late String initializedText;
  initializedText = "Initialized";
  print('Assigned late variable: $initializedText');

  // 5. Null-Aware Operators Combined (??, ??=, ?.)
  Map<String, List<int>?>? complexData;

  int scoreCount = complexData?['scores']?.length ?? -1;
  print('Scores count from null container: $scoreCount');

  complexData = {
    'scores': [95, 88, 72],
  };
  int populatedScoreCount = complexData['scores']?.length ?? -1;
  print('Scores count from populated map: $populatedScoreCount');

  // 6. Bang Operator (!) Safety Boundary
  String? conditionalNullable = "Dart 3 Sound Null Safety";
  if (conditionalNullable != null) {
    print('Bang operator executed: ${conditionalNullable.toUpperCase()}');
  }
}