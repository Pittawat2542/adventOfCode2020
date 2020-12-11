import 'dart:io';

void main(List<String> arguments) async {
  final inputStringList = await readInputFile('input.txt');
  var count = 0;

  inputStringList.forEach((x) {
    final ruleRange = x.split(' ')[0];
    final ruleLowerBound = int.tryParse(ruleRange.split('-')[0]) ?? 0;
    final ruleUpperBound = int.tryParse(ruleRange.split('-')[1]) ?? 0;
    final ruleCharacter = x.split(' ')[1].substring(0, 1);
    final password = x.split(' ')[2];

    var numberOfRuleCharacter = 0;
    password.split('').forEach((c) {
      if (c == ruleCharacter) {
        numberOfRuleCharacter++;
      }
    });
    if (numberOfRuleCharacter >= ruleLowerBound && numberOfRuleCharacter <= ruleUpperBound) {
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
