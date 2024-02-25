import 'dart:io';

/// Writes the given payload to the file at the specified path.
///
/// * [path]: The path to the file.
/// * [payload]: The content to be written to the file.
void writeFile(String path, String payload) {
  File file = File(path);
  file.writeAsStringSync(payload);
}
