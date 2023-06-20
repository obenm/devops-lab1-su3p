# devops-lab1-su3p

# DevOps Skilling Up Program
# Lab 1

DevOps Skilling Up Program 2023 - Lab 1
DevOps Skilling Up Program 2023
Lab 1 - Bash Shell Scripting

Shell Script to do a line count over files
Create a Bash Shell script using functions to count the number of lines in text files located in the current directory when:
They belong to an owner OR
When were created in a specific month
The shell script should accept the following options:
-o <owner>
To select files where the owner is <owner>
-m <month>
To select files where the creation month is <month>
When receiving invalid arguments, show help
Invalid arguments:
./countlines.sh
./countlines.sh -o owner -m month
Other arguments
./countlines.sh -x owner
Valid arguments:
./countlines.sh -o jose.sandoval
Looking for files where the owner is: jose.sandoval
File: countlines.sh, Lines:       55 countlines.sh
File: example1.txt, Lines:        5 example1.txt
File: example2.txt, Lines:        5 example2.txt
File: example4.txt, Lines:        5 example4.txt
./countlines.sh -m Jun
     
Looking for files where the month is: Jun
File: countlines.sh, Lines:       55 countlines.sh
File: example1.txt, Lines:        5 example1.txt
File: example2.txt, Lines:        5 example2.txt
File: example3.txt, Lines:        5 example3.txt
File: example4.txt, Lines:        5 example4.txt
Hints
Use getopts command
