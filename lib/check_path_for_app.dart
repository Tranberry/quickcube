import 'dart:io';

/// Check if the given [app] is present in the system's PATH.
///
/// Returns true if the app is found in the PATH, otherwise false.
bool checkPathForApp(String app) {
  if (Platform.isWindows) {
    // Use 'where' command to check if the app is in the PATH on Windows
    return Process.runSync('where', [app]).exitCode == 0;
  } else {
    // Use 'which' command to check if the app is in the PATH on non-Windows systems
    return Process.runSync('which', [app]).exitCode == 0;
  }
}

// TODO: test if this works
/// Checks if the given list[string] of apps exists in the path
///
/// Returns true and the first string that is `true` if any of the apps exists in the path, otherwise returns false
List checkPathForApps(List<String> apps) {
  for (String app in apps) {
    if (checkPathForApp(app)) {
      return [true, app];
    }
  }
  return [false, ''];
}
