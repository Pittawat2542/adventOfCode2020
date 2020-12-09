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
        final ruleRange = x.split(' ')[0];
        final ruleLowerBound = int.parse(ruleRange.split('-')[0]);
        final ruleUpperBound = int.parse(ruleRange.split('-')[1]);
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
    } catch (exception) {
      print('Error happened: $exception');
    }
  } else {
    print('File does not exist!');
  }
}
