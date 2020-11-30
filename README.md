# usage

`vending_terminal_statuses_by_city ?` for help
```bash
-c, --city                      Specify city name, e.g. Moscow or SPb

          [SPb]                 Sankt Petersburg
          [moscow] (default)    Moscow

-s, --status                    Specify Vending terminal status, one of: 
                                [full, empty, error, all (default)]
-?, --[no-]?                    Show this help
```
e.g. `vending_terminal_statuses_by_city -s full -c Moscow`