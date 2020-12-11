import 'dart:io';

void main(List<String> arguments) async {
  final inputStringList = await readInputFile('input.txt');
  var count = 0;

  inputStringList.forEach((x) {
    final rulePositions = x.split(' ')[0];
    final ruleFirstLocation = int.tryParse(rulePositions.split('-')[0]) ?? 1 - 1;
    final ruleSecondPosition = int.tryParse(rulePositions.split('-')[1]) ?? 1 - 1;
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
}

Future<List<String>> readInputFile(String fileName) async {
  final rootFolderPath = File(Platform.script.toFilePath()).parent.path;
  final inputFile = File('$rootFolderPath/$fileName');

  if (await inputFile.exists()) {
    try {
      return await inputFile.readAsLines();
    } catch (exception) {
      print('Error happened: $exception');
      return null;
    }
  } else {
    print('File does not exist!');
    return null;
  }
}
