import 'dart:io';

void main(List<String> arguments) async {
  final inputStringList = await readInputFile('input.txt');

  if (inputStringList != null) {
    inputStringList.forEach((x) {
      final parsedX = int.tryParse(x) ?? 0;
      final diff = 2020 - parsedX;

      if (inputStringList.contains('$diff')) {
        print(parsedX * diff);
      }
    });
  }
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
