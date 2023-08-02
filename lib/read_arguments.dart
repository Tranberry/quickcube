import 'dart:io';
import 'tool_name.dart';

Map<String, String> readArguments(List<String> arguments) {
  // Sanitize the arguments so we do not try to make invalid directories or include odd symbols

  // Current directory
  final currentDirectory = Directory.current;

  if (arguments.isEmpty) {
    // Exit without error
    stdout.writeln('$toolName, a simple project creator for SugarCube.');
    stdout.writeln('');
    stdout.writeln('You need to name the project like this example:');
    stdout.writeln('  > ${toolName.toLowerCase()} my sugarcube project');
    stdout.writeln('');
    // Explain that this would create an empty project directory
    stdout.writeln(
        'This would create a "my_sugarcube_project" directory in: \n"${currentDirectory.path}".');
    stdout.writeln('With directories, files, and some quality of life things');
    exit(0);
  } else {
    // Combine the arguments into snake case and sanitize
    final projectName =
        arguments.join(' ').trim().replaceAll(RegExp(r'[^\w\s]'), '');
    final projectDirectory =
        projectName.replaceAll(RegExp(r'\s+'), '_').toLowerCase();

    if (projectName.isEmpty) {
      // Handle empty project name after sanitization
      stderr.writeln('Error: Project name cannot be empty.');
      exit(1);
    }

    return {
      'ProjectName': projectName,
      'ProjectDirectory': projectDirectory,
    };
  }
}
