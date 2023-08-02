import 'package:quickcube/ifid.dart';

String get tweeStart {
  return '''
:: StoryData
{
"ifid": "${ifid()}",
"format": "SugarCube",
"format-version": "2.0.0"
}

:: StoryTitle
''';
}
