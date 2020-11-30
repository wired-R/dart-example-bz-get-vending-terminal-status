import 'package:test/test.dart';
import 'package:vending_terminal_statuses_by_city/vending_terminal_statuses_by_city.dart';
import 'package:vending_terminal_statuses_by_city/argumet_parser.dart';

void main(List<String> arguments) async {
  var ap = ArgumentParser(arguments.map((arg) => arg.toLowerCase()).toList());
  var city = ap.getCity();
  var status = ap.getStatus();
  print('Check vending terminals from $city with status $status...');

  VendingTerminalStatus vts = FiltredVendingTerminalStatus(city, status);
  for (var t in await vts.getVendingTerminalsData()) {
    print('show terminal id ${t.id} with status ${t.status}');
  }
}
