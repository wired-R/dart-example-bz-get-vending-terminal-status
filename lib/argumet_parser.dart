import 'package:args/args.dart';
import 'dart:io';

class ArgumentParser {
  final List<String> arguments;
  String _city;
  String _status;
  bool _verbose;
  String getCity() => _city;
  String getStatus() => _status;
  bool getVerbose() => _verbose;

  ArgumentParser(this.arguments) {
    final parser = ArgParser()
      ..addOption('city',
          abbr: 'c',
          defaultsTo: 'all',
          allowedHelp: {
            'moscow': 'Москва',
            'SPb': 'Санкт-Петербург',
            'all': 'all'
          },
          help: 'Specify city name, e.g. Moscow or SPb')
      ..addOption('status',
          abbr: 's',
          defaultsTo: 'all',
          allowed: ['full', 'empty', 'error', 'all'],
          help: 'Specify Vending terminal status, one of: ')
      ..addFlag('?', abbr: '?', help: 'Show this help')
      ..addFlag('verbose', abbr: 'v', help: 'verbose output');

    var argResults;

    try {
      argResults = parser.parse(arguments);
    } on FormatException {
      print('Error! Can\'t read argumentas. Check spelling.');
      exit(64);
    }

    if (argResults.arguments.isEmpty || arguments.contains('?')) {
      print(parser.usage);
      exit(0);
    }

    _city = argResults['city'];
    _status = argResults['status'];
    _verbose = argResults['verbose'];
  }
}
