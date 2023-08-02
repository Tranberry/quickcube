import 'package:quickcube/ifid.dart';

String tweeStart(String? projectName) {
  return '''
:: StoryData
{
"ifid": "${ifid()}",
"format": "SugarCube",
"format-version": "2.0.0"
}

:: StoryTitle
$projectName

:: Start
''';
}
