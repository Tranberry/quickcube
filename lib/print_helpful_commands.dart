import 'dart:io';
import 'check_path_for_app.dart';

// a list of names for different VS Code editions
const List<String> codeEditors = ['code', 'code-insiders'];

var gotCode = checkPathForApps(codeEditors);

/// Prints helpful commands for the given project directory.
///
/// If [gotCode] is true, it prints the command to change to the project directory and execute the specified command.
/// Otherwise, it just prints the command to change to the project directory.
void printHelpfulCommands(Directory projectDirectory) {
  if (gotCode[0]) {
    stdout.writeln('');
    stdout.writeln('    cd ${projectDirectory.path} && ${gotCode[1]} .');
  } else {
    stdout.writeln('    cd ${projectDirectory.path}');
  }
}
