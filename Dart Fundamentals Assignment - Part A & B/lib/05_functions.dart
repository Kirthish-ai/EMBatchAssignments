// 1. Positional, Optional, Named, & Default Parameters
void buildUser(String id, {required String username, String role = "guest"}) {
  print('ID: $id, User: $username, Role: $role');
}

// 2. Arrow Function (=>)
int square(int n) => n * n;

// 3. First-Class Functions & Anonymous Functions
void executeAction(Function action) {
  action();
}

// 4. Lexical Closures
Function makeAdder(int addBy) {
  return (int i) => i + addBy;
}

void main() {
  // Call buildUser with required parameters
  buildUser('usr_101', username: 'alex_dev');
  buildUser('usr_102', username: 'admin_jane', role: 'admin');

  // Call arrow function
  print('Square of 4: ${square(4)}');

  // Pass anonymous function
  executeAction(() => print("Executing anonymous function..."));

  // Closures
  var add5 = makeAdder(5);
  print('makeAdder(5)(10) = ${add5(10)}');
}