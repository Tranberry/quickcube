import 'package:test/test.dart';

import '../lib/read_arguments.dart';

void main() {
  test('Project directory', () {
    expect(
        readArguments(['hello', 'world'])['ProjectDirectory'], 'hello_world');
  });
  test('Project name', () {
    expect(readArguments(['hello', 'world'])['ProjectName'], 'hello world');
  });
}
