import 'dart:io';

void main(List<String> arguments) async {
  final rootFolderPath = File(Platform.script.toFilePath()).parent.path;
  final inputFileName = 'input.txt';

  final inputFile = File('$rootFolderPath/$inputFileName');

  if (await inputFile.exists()) {
    try {
      final input = await inputFile.readAsLines();
      var count = 0;

      input.forEach((x) {
        final rulePositions = x.split(' ')[0];
        final ruleFirstLocation = int.parse(rulePositions.split('-')[0]) - 1;
        final ruleSecondPosition = int.parse(rulePositions.split('-')[1]) - 1;
        final ruleCharacter = x.split(' ')[1].substring(0, 1);
        final password = x.split(' ')[2];

        if (((password.substring(ruleFirstLocation, ruleFirstLocation + 1) ==
            ruleCharacter) &&
            !(password.substring(ruleSecondPosition, ruleSecondPosition + 1) ==
                ruleCharacter)) || ((password.substring(ruleSecondPosition, ruleSecondPosition + 1) ==
            ruleCharacter) &&
            !(password.substring(ruleFirstLocation, ruleFirstLocation + 1) ==
                ruleCharacter))) {
          count++;
        }
      });

      print(count);
    } catch (exception) {
      print('Error happened: $exception');
    }
  } else {
    print('File does not exist!');
  }
}
