// Helper class for required & optional named parameter rules
class APIConfig {
  final String endpoint;
  final int timeoutSeconds;
  final bool enableLogs;

  APIConfig({
    required this.endpoint,
    this.timeoutSeconds = 30,
    this.enableLogs = false,
  });

  void display() {
    print('Endpoint: $endpoint, Timeout: ${timeoutSeconds}s, Logs: $enableLogs');
  }
}

// 1. Positional + Named Parameters with default & required modifiers
void sendNotification(
  String recipient, {
  String message = "Default Hello",
  bool urgent = false,
  required String sender,
}) {
  print('From: $sender -> To: $recipient | Msg: $message | Urgent: $urgent');
}

// Optional positional variation:
void sendPositionalNotification(
  String recipient, [
  String message = "Default Hello",
  String sender = "System",
]) {
  print('From: $sender -> To: $recipient | Msg: $message');
}

// 2. First-Class & Anonymous Functions (Higher-Order Functions)
List<int> customMap(List<int> list, int Function(int) action) {
  List<int> result = [];
  for (var item in list) {
    result.add(action(item));
  }
  return result;
}

// 3. Lexical Closures (State Encapsulation)
int Function() createCounter() {
  int count = 0; // Lexically captured variable
  return () {
    count++;
    return count;
  };
}

void main() {
  // Testing APIConfig
  final config = APIConfig(endpoint: "https://api.example.com/v1", enableLogs: true);
  config.display();

  // Call sendNotification with named & positional mix
  sendNotification(
    "alice@example.com",
    sender: "security-team",
    message: "Password reset requested",
    urgent: true,
  );

  // Call customMap with an inline anonymous closure
  List<int> originalList = [1, 2, 3, 4, 5];
  List<int> squaredList = customMap(originalList, (x) => x * x);
  print('Original: $originalList -> Squared: $squaredList');

  // Lexical closure state isolation verification
  var counterA = createCounter();
  var counterB = createCounter();

  print('counterA call 1: ${counterA()}'); // 1
  print('counterA call 2: ${counterA()}'); // 2
  print('counterB call 1: ${counterB()}'); // 1 (state isolated from counterA)
}