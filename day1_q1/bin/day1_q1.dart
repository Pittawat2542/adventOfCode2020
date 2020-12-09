import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) async {
  final rootFolderPath = File(Platform.script.toFilePath()).parent.path;
  final inputFileName = 'input.txt';

  final inputFile = File('$rootFolderPath/$inputFileName');

  if (await inputFile.exists()) {
    try {
      final input = await inputFile.readAsLines();

      input.forEach((x) {
        var parsedX = int.parse(x);
        final diff = 2020 - parsedX;

        if (input.contains('$diff')) {
          print(parsedX * diff);
        }
      });
    } catch (exception) {
      print('Error happened: $exception');
    }
  } else {
    print('File does not exist!');
  }
}
