import 'dart:io';

void writeFile(String path, String tweeStart) {
  File file = File(path);
  file.writeAsStringSync(tweeStart);
}
