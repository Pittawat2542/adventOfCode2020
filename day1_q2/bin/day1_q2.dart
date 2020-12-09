import 'dart:io';

void main(List<String> arguments) async {
  final rootFolderPath = File(Platform.script.toFilePath()).parent.path;
  final inputFileName = 'input.txt';

  final inputFile = File('$rootFolderPath/$inputFileName');

  if (await inputFile.exists()) {
    try {
      final input = await inputFile.readAsLines();

      input.forEach((x) {
        final parsedX = int.parse(x);
        final diff1 = 2020 - parsedX;

        input.forEach((y) {
          final parsedY = int.parse(y);
          final diff2 = diff1 - parsedY;

          if (input.contains('$diff2')) {
            print(parsedX * parsedY * diff2);
          }
        });


      });
    } catch (exception) {
      print('Error happened: $exception');
    }
  } else {
    print('File does not exist!');
  }
}
