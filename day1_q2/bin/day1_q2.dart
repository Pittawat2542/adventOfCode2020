import 'dart:io';

void main(List<String> arguments) async {
  final inputStringList = await readInputFile('input.txt');

  inputStringList.forEach((x) {
    final parsedX = int.tryParse(x) ?? 0;
    final diff1 = 2020 - parsedX;

    inputStringList.forEach((y) {
      final parsedY = int.tryParse(y) ?? 0;
      final diff2 = diff1 - parsedY;

      if (inputStringList.contains('$diff2')) {
        print(parsedX * parsedY * diff2);
      }
    });
  });
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
