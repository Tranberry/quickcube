import 'package:uuid/uuid.dart';

/// Generates and returns a unique identifier in uppercase.
///
/// `IFID` is a interactive fiction identifier.
String ifid() {
  var uuid = Uuid();
  return uuid.v4().toUpperCase();
}
