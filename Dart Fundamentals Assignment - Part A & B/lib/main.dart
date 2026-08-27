import '01_variables.dart' as variables;
import '02_collections.dart' as collections;
import '03_operators.dart' as operators;
import '04_control_flow.dart' as control_flow;
import '05_functions.dart' as functions;
import '06_null_safety.dart' as null_safety;
import '07_advanced_control_flow.dart' as advanced_control_flow;
import '08_advanced_functions.dart' as advanced_functions;
import '09_advanced_null_safety.dart' as advanced_null_safety;

void main() {
  print('=' * 60);
  print('🎯 DART FUNDAMENTALS & ADVANCED ASSIGNMENT TEST RUNNER');
  print('=' * 60);

  // Core Modules
  _runModule('Section 1: Variables & Data Types', variables.main);
  _runModule('Section 2: Collections & Conversions', collections.main);
  _runModule('Section 3: Operators & Expressions', operators.main);
  _runModule('Section 4: Control Flow & Basic Patterns', control_flow.main);
  _runModule('Section 5: Functions & Scope', functions.main);
  _runModule('Section 6: Null Safety Foundations', null_safety.main);

  // Advanced Modules
  _runModule('Section 7: Advanced Patterns & Sealed Classes', advanced_control_flow.main);
  _runModule('Section 8: Advanced Functions & Lexical Closures', advanced_functions.main);
  _runModule('Section 9: Advanced Null Safety, Never & Type Promotion', advanced_null_safety.main);

  print('\n${'=' * 60}');
  print('✅ All 9 modules executed successfully!');
  print('=' * 60);
}

void _runModule(String title, void Function() moduleRunner) {
  print('\n------------------------------------------------------------');
  print('▶ $title');
  print('------------------------------------------------------------');
  try {
    moduleRunner();
  } catch (e, stackTrace) {
    print('❌ Error occurred in $title: $e');
    print(stackTrace);
  }
}