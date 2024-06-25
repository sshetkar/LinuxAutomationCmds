# Cheat Sheet
This cheat sheet contains links to various resources.

## Lessons
For in-depth practical learnings, learn from [Lessons](Readme.md#index) created.

## Interview Preparation
For quick interview preparation, use these summarized commands:


### General cmd
- `whoami`: returns username
- `pwd`: Print working directory
- `cd`: Change the directory
- `ls`: List directory contents

### Create folder
- `mkdir demoFolder`: creates folder with name 'demoFolder'
- `mkdir folder1 folder-2 "Folder 3" folder4`: creates multiple folders *(for folder name with space use double quotes)*

### Create file
- `touch file1`: creates a new file named 'file1' and by-default it is a '.txt' extension file
- `touch file2.md file-3.log "File 4.cfg" demoFile.html`: creates multiple files with provided extension *(for file with space use double quotes)*

### Edit file using 'vi' editor
- `vi file1`: will open file content on terminal
- to edit content use 'i' *(on keyboard)* that will activate INSERT mode
- then edit file and to save, exit edit mode press 'Esc' and ':wq'

### Edit file using 'nano' editor
- `nano file1`: will open file content on terminal
- edit the file and to save content press 'ctrl+w' and 'Enter'
- to exit press 'ctrl+x'

### List files and folders
- `ls -l`: list files, folders of current path
- `ls -la`: list file, folders including hidden one's
- `ls -lt`: files, folders sorted based on last modified date-time
- `ls -lh`: file size is displayed in human-readable format
- `ls -lr`: files sorted in reverse
- `ls -lhat`: combination of above respective individual cmds

### Remove files and folders
*(take backup before deleting files, folders)*
- `rmdir demoFolder`: deletes folder with name 'demoFolder'
- `rmdir -rf impFolder`: recurcively & forcefully impFolder with content will be deleted
- `rmdir -rf impFolder emptyFolder "Folder 1" Folder-2` : deletes multiple folders
- `rmdir file1`: deletes file1
- `rmdir file1 "file 2" file-3 file4`: deletes multiple files

### Reading files on terminal
- `cat file1`: returns content of file1 on terminal
- `cat file1 file2 file3`: returns content of multiple files on terminal
- `tac file1`: returns content of file bottom to top on terminal
- `tac file1 file2 file3`: returns content of multiple files bottom to top on terminal
- `cat -n file1`: returns content of file1 on terminal with line numbers
- `cat file1.log file2.log`: create new file2 with .log extension and copy content of file1 *(can use any valid extension like, .log, .txt, .md, .cfg, .json, .csv, .html, .gz)*

### Reading specific lines of files on terminal
- `head file1`: returns first 10 lines of file1 on terminal
- `head -n 15 file1 file-2 "file-3"`: returns first 15 lines of all files on terminal
- `tail file1`: returns last 10 lines of file1 on terminal
- `head -n 7 file1 file-2 "file-3`: returns last 7 lines of all files on terminal

### Copy/ move/ rename
- `cp -r demoFolder /c/Users/SHASHANK/Desktop/`: on provided path a copy of folder *(including sub-folder, files)* will be created
- `cp -r file5 /c/Users/SHASHANK/Desktop/`: on provided path a copy of file5 will be created
- `mv impFolder /d/Automation/GitProject/`: impFolder *(including sub-folder, files)* will be moved to provided path
- `mv file1 file2 "file 3" file-4 /d/Automation/GitProject/`: multiple files will be moved to provided path

#### grep = search - content or keyword inside a file
#### find = search - file or folder

### grep (global regular expression print)
- `grep "DEBUG" file1`: case sensitive search of keyword "DEBUG" that returns the matching lines from file1
- `grep -i "debug" file1`: case In-sensitive search of keyword "debug" that returns the matching lines from file1
- `grep -w "ERROR" file2`: search of exact keyword "ERROR" that returns the matching lines from file2
- `grep -n "WARN" file2`: case sensitive search of keyword "WARN" that returns the matching lines with line numbers from file2
- `grep -c "DEBUG" file3`: returns the count of matching keyword "DEBUG"
- `grep -v "INFO" log.txt`: returns all lines except matching keyword "INFO"
- `grep "pattern" file1 file2`: search of exact keyword "pattern" in multiple files *(file1 and file2)*
- `grep -r "TODO" .`: recursively search of keyword "TODO" and "."(dot) indicates location to be searched in the current directory and its subdirectories
- `grep -l "FIXME" *`: returns list of filenames containing "FIXME" in the current directory
- `grep -A 5 "ERROR" file5`: prints 5 lines after the every "ERROR" keyword from file5
- `grep -B 3 "WARN" file5`: prints 3 lines before the every "WARN" keyword from file5
- `grep -C 7 "INFO" file5`: prints 7 lines before and after the every "INFO" keyword from file5
- `grep -E "INFO | WARN" file10` = Extended search for 2 keywords "INFO, WARN" in file10
- `grep -E "pattern | number" file1 file2` = Extended search for 2 keywords "pattern, number" in multiple files *(file1 and file2)*

### Search files, folders
- `find . -type d`: return all dir inside current path
- `find . -type f`: return all files inside current path
- `find . -name "*.extension"`: return all files with .extension inside current path

### Sort file content
- `sort user_activity.log`: sorted content A-Z
- `sort -r user_activity.log`: sorted content Z-A
- `sort file1 file-2 "file 3" file4`: sorted content A-Z for multiple files

### Compare files
- `comp file1 file2`: return byte by byte comparison
- `diff file1 file2`: return difference in content of 2 files

### Filter file content
- `awk '{print $n}' file`: filter content of file basis ' ' (space) and print column n
- `awk -F "=" '{print $n1, $n2}' file`: filter content of file basis '=' (equalto) and print (column n1 - before equalto), (column n2 - after equalto)
- `awk -F "-" '{print $n1, $n2, $n3}' file`: filter content of file basis '-' (hypen) and print (column n1 - before equalto), (column n2 - after equalto) and (column n3 - before/after equalto)