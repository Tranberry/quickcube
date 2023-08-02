import 'dart:io';

void printHelpfulCommands(Directory projectDirectory) {
  // print something like 'cd your_project_directory' and 'code .' where your_project_directory is the project directory
  stdout.writeln('');
  stdout.writeln('    cd ${projectDirectory.path} && code .');
}
