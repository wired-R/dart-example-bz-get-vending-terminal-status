import 'package:test/test.dart';
import 'package:vending_terminal_statuses_by_city/vending_terminal_statuses_by_city.dart';
import 'package:vending_terminal_statuses_by_city/argumet_parser.dart';

void main(List<String> arguments) async {
  var ap = ArgumentParser(arguments.map((arg) => arg.toLowerCase()).toList());
  var city = ap.getCity();
  var status = ap.getStatus();
  var verbose = ap.getVerbose();
  print('Check vending terminals from $city with status $status...');

  VendingTerminalStatus vts = FiltredVendingTerminalStatus(city, status);
  var terminals = await vts.getVendingTerminalsData();
  if (verbose) {
    for (var t in await terminals) {
      print(
          'show terminal id ${t.id} with status ${t.status} with address ${t.city} ${t.address}\ndescription ${t.description}\n');
    }
  }
  print(terminals.length);
}
