#!/bin/sh

# chmod +x ./CountingLines.sh

owner=""
month=""

# Reading the parameters

while getopts ":o:m:" option; do
  case $option in
    o)
        owner="$OPTARG"
        ;;
    m)
        month="$OPTARG"
        ;;
    *)
        echo "Invalid option: -$OPTARG"
        echo "Usage: $0 [-o owner] OR [-m month]"
        exit 1
        ;;
  esac
done

# Validating If only 1 parameter is included
# 0 parameters or 2 or more print a message

if [ $OPTIND -ne 3 ]; then
  echo "Usage: $0 [-o owner] OR [-m month]"
  exit 1
fi

echo ""

# Owner Functionality

if [ -n "$owner" ]; then
    echo "Looking for files where the owner is: $owner"
    files=$(find "./" -user "$owner" | sort) # Find files in the script folder by owner, and sort alphabetically

    # Formattinng
    for i in $(seq 1 50); do
      printf "="
    done
    echo

    for file in $files; do # Iterate the returned results of the previous find
      if [ -f "$file" ]; then
        filename=$(basename "$file") # Get the filename
        lineCount=$(wc -l < "$file") # Counting the lines of the corresponding file
        printf "File: %-20s   ||   Lines: %-15s \n" "$filename" "$lineCount"
      fi
    done
fi


# Month Functionality

if [ -n "$month" ]; then
    echo "Looking for files where the month be: $month"
    startDate=$(date -d "$month 1 2023" +%Y-%m-%d) # Defining the start of given month
    endDate=$(date -d "$month 1 2023 +1 month" +%Y-%m-%d) # Defining the end of given month
    files=$(find "./" -newermt "$startDate" ! -newermt "$endDate" | sort) # Find files who ModifiedTime be between those dates and sort (-newerBt doesn't work)

    # Formatting
    for i in $(seq 1 45); do
      printf "="
    done
    echo

    for file in $files; do
      if [ -f "$file" ]; then
        filename=$(basename "$file")
        lineCount=$(wc -l < "$file")
        printf "File: %-20s   ||   Lines: %-15s \n" "$filename" "$lineCount"
      fi
    done
fi

echo