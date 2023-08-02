import 'dart:io';

void writeFile(String path, String payload) {
  File file = File(path);
  file.writeAsStringSync(payload);
}
