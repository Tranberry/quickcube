import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:quickcube/read_arguments.dart';
import 'package:quickcube/simple_file_content.dart';
import 'package:quickcube/twee_start.dart';
import 'package:quickcube/print_helpful_commands.dart';
import 'package:quickcube/write_file.dart';

void main(List<String> arguments) async {
  final projectName = readArguments(arguments);
  // read arguments and make it into a system valid director name (project name).
  Directory projectDirectory = Directory(projectName['ProjectDirectory']!);
  Directory srcDirectory = Directory(path.join(projectDirectory.path, 'src'));
  Directory distDirectory = Directory(path.join(projectDirectory.path, 'dist'));
  Directory vscodeDirectory =
      Directory(path.join(projectDirectory.path, '.vscode'));
  Directory assetsDirectory =
      Directory(path.join(distDirectory.path, 'assets'));

  // create directories if they do not exist
  if (!projectDirectory.existsSync()) {
    stdout.writeln('');
    stdout.writeln(
        'Creating your new SugarCube project "${projectName['ProjectName']}"');
    stdout.writeln('');
    stdout.writeln('Creating DIRECTORIES');

    // create directories
    // create projectDirectory
    projectDirectory.createSync(recursive: true);
    stdout.writeln('"${projectDirectory.absolute.path}"');
    // create srcDirectory
    srcDirectory.createSync(recursive: true);
    stdout.writeln('"${srcDirectory.absolute.path}"');
    // create distDirectory
    distDirectory.createSync(recursive: true);
    stdout.writeln('"${distDirectory.absolute.path}"');
    // create vscodeDirectory
    vscodeDirectory.createSync(recursive: true);
    stdout.writeln('"${vscodeDirectory.absolute.path}"');
    // create assetsDirectory
    assetsDirectory.createSync(recursive: true);
    stdout.writeln('"${assetsDirectory.absolute.path}"');
    stdout.writeln('');
    stdout.writeln('Creating FILES');

    // create files
    // create js config in src directory with content of `jsConfig`
    writeFile(path.join(srcDirectory.path, 'config.js'), jsConfig);
    stdout.writeln(
        '"${srcDirectory.absolute.path}${Platform.pathSeparator}config.js"');
    // create tasks.json in src directory with content of `jsonTasks`
    writeFile(
      path.join(vscodeDirectory.absolute.path, 'tasks.json'),
      jsonTasks,
    );
    stdout.writeln(
        '"${vscodeDirectory.absolute.path}${Platform.pathSeparator}tasks.json"');
    // create start.tw in src directory with content of `tweeStart`
    writeFile(
      path.join(srcDirectory.absolute.path, 'start.tw'),
      tweeStart(projectName['ProjectName']),
    );
    stdout.writeln(
        '"${srcDirectory.absolute.path}${Platform.pathSeparator}start.tw"');
    // create assets dir note 'place images, fonts and other assets here'
    writeFile(
      path.join(assetsDirectory.absolute.path, 'assets.txt'),
      assetsNote,
    );
    stdout.writeln(
        '"${assetsDirectory.absolute.path}${Platform.pathSeparator}assets.txt"');

    // Write a `package.json` file in the root of the project
    writeFile(
        path.join(projectDirectory.path, 'package.json'), nodePackageContent);
    stdout.writeln(
      '"${projectDirectory.absolute.path}${Platform.pathSeparator}package.json"',
    );
    // end of generation message

    printHelpfulCommands(projectDirectory);
  } else {
    stdout.writeln('Directory already exists');
  }
}
