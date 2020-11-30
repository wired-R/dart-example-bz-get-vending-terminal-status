![Dart](https://github.com/wired-R/dart-example-bz-get-vending-terminal-status/workflows/Dart/badge.svg?branch=master)

# usage

`vending_terminal_statuses_by_city ?` for help
```bash
-c, --city                   Specify city name, e.g. Moscow or SPb

          [SPb]              Санкт-Петербург
          [all] (default)    all
          [moscow]           Москва

-s, --status                 Specify Vending terminal status, one of: 
                             [full, empty, error, all (default)]
-?, --[no-]?                 Show this help
-v, --[no-]verbose           verbose output
```
e.g. `vending_terminal_statuses_by_city -s full -c Moscow -v`