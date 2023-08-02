import 'dart:io';

import 'tool_name.dart';

Map<String, String> readArguments(List<String> arguments) {
  // current directory
  final currentDirectory = Directory.current;
  // make sure the are not empty
  if (arguments.isEmpty) {
    // exit without error
    stdout.writeln('$toolName, a simple project creator for SugarCube.');
    stdout.writeln('');
    stdout.writeln('You need to name the project like this example:');
    stdout.writeln('  > ${toolName.toLowerCase()} my sugarcube project');
    stdout.writeln('');
    // explain that this would create an empty project directory
    stdout.writeln(
        'This would create a "my_sugarcube_project" directory in: \n"${currentDirectory.path}".');
    stdout.writeln('With directories, files and some quality of life things');
    exit(0);
  } else {
    // combine the arguments into snakecase
    return {
      'ProjectName': arguments.join(' '),
      'ProjectDirectory': arguments.join('_').toLowerCase()
    };
  }
}
