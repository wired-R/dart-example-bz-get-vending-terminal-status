import 'package:args/args.dart';
import 'dart:io';

class ArgumentParser {
  final List<String> arguments;
  String _city;
  String _status;

  String getCity() => _city;
  String getStatus() => _status;

  ArgumentParser(this.arguments) {
    final parser = ArgParser()
      ..addOption('city',
          abbr: 'c',
          defaultsTo: 'moscow',
          allowedHelp: {'moscow': 'Moscow', 'SPb': 'Sankt Petersburg'},
          help: 'Specify city name, e.g. Moscow or SPb')
      ..addOption('status',
          abbr: 's',
          defaultsTo: 'all',
          allowed: ['full', 'empty', 'error', 'all'],
          help: 'Specify Vending terminal status, one of: ')
      ..addFlag('?', abbr: '?', help: 'Show this help');
    var argResults;
    try {
      argResults = parser.parse(arguments);
    } on FormatException {
      print('Error! Can\'t read argumentas. Check spelling.');
      exit(64);
    }

    if (argResults.arguments.isEmpty || arguments.contains('?')) {
      print(parser.usage);
    }

    _city = argResults['city'];
    _status = argResults['status'];
  }
}
