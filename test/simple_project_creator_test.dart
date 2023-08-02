import 'package:quickcube/read_arguments.dart';
import 'package:test/test.dart';

void main() {
  test('Project directory', () {
    expect(
        readArguments(['hello', 'world'])['ProjectDirectory'], 'hello_world');
  });
  test('Project name', () {
    expect(readArguments(['hello', 'world'])['ProjectName'], 'hello world');
  });
}
