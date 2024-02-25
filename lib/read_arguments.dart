import 'dart:io';
import 'tool_name.dart';

/// Reads the command line arguments and returns a map containing the project name and directory.
///
/// This function takes a list of string arguments and processes them to extract the project name and directory.
/// If the arguments list is empty, it prints project creation instructions and exits the program.
///
/// Parameters:
///   arguments - List of string arguments from the command line
///
/// Returns:
///   A map containing the 'ProjectName' and 'ProjectDirectory'
Map<String, String> readArguments(List<String> arguments) {
  final currentDirectory = Directory.current;

  if (arguments.isEmpty) {
    printProjectCreationInstructions(toolName, currentDirectory);
    exit(0);
  } else {
    final projectName = sanitizeProjectName(arguments);
    final projectDirectory = formatProjectDirectory(projectName);

    if (projectName.isEmpty) {
      printErrorAndExit('Error: Project name cannot be empty.');
    }

    return {
      'ProjectName': projectName,
      'ProjectDirectory': projectDirectory,
    };
  }
}

/// Print project creation instructions.
///
/// This function prints instructions for creating a project with the specified tool name and current directory.
///
/// Parameters:
///   toolName - The name of the tool
///   currentDirectory - The current directory
void printProjectCreationInstructions(
    String toolName, Directory currentDirectory) {
  stdout.writeln('');
  stdout.writeln('$toolName, a simple project creator for SugarCube.');
  stdout.writeln('');

  // Print project naming example
  stdout.writeln('You need to name the project like this example:');
  stdout.writeln('  > ${toolName.toLowerCase()} my sugarcube project');
  stdout.writeln('');

  // Print project creation directory
  stdout.writeln(
      'This would create a "my_sugarcube_project" directory in: \n"${currentDirectory.path}".');
  stdout.writeln('With directories, files, and some quality of life things');
  stdout.writeln('');
}

/// Sanitize the project name by joining the arguments, trimming any leading or trailing whitespace, and removing any non-alphanumeric characters.
///
/// arguments: list of strings to sanitize
String sanitizeProjectName(List<String> arguments) {
  return arguments.join(' ').trim().replaceAll(RegExp(r'[^\w\s]'), '');
}

/// Formats the project directory by replacing spaces with underscores and converting to lowercase.
///
/// [projectName]: The name of the project to format.
String formatProjectDirectory(String projectName) {
  return projectName.replaceAll(RegExp(r'\s+'), '_').toLowerCase();
}

/// Prints the given error message to the standard error stream and exits the program with a status code of 1.
///
/// [errorMessage] - The error message to be printed.
void printErrorAndExit(String errorMessage) {
  stderr.writeln(errorMessage);
  exit(1);
}
