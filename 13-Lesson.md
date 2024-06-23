*Lesson12 continue...*
## Search using 'grep'

1. `grep -E "INFO | WARN" log.txt` = Extended search for 2 keywords "INFO, WARN" in log.txt file

2.  `grep -E "pattern | number" file1 file2` = Extended search for 2 keywords "pattern, number" in multiple files (file1 and file2)

| grep command               | cmd output                                  |
|----------------------------|---------------------------------------------|
| `grep -A 5 "ERROR" log.txt`| Prints 5 lines after the "ERROR" keyword from log.txt |
| `grep -B 3 "WARN" log.txt` | Prints 3 lines before the "WARN" keyword from log.txt |
| `grep -C 7 "INFO" log.txt` | Prints 7 lines before and after the "INFO" keyword from log.txt |


*Commands for zip files are pending to be added*

---
Reference screenshots:
![grep command Screenshot](Screenshots/grep7.png)
---