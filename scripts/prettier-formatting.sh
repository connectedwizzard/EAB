#!/bin/bash

# Define the file types to format
FILE_TYPES="js,json,html,css"

# Define the directory to search for files
DIRECTORY="src/"

# Define the branch to compare against
BASE_BRANCH="main"

# Install prettier if it's not already installed
if ! command -v prettier &> /dev/null
then
    echo "Prettier is not installed. Installing now..."
    npm install -g prettier
fi

# Get the list of files that have been modified
MODIFIED_FILES=$(git diff --name-only --diff-filter=d $BASE_BRANCH | grep -E "\.($FILE_TYPES)$")

# If there are no modified files, exit
if [ -z "$MODIFIED_FILES" ]
then
    echo "No modified files found."
    exit 0
fi

# Format the modified files using prettier
echo "Formatting modified files..."
for file in $MODIFIED_FILES
do
    prettier --write --single-quote --trailing-comma es5 --no-semi --parser $FILE_TYPES $DIRECTORY/$file
done

# Add the changes to git
git add $MODIFIED_FILES

# Commit the changes with a generic message
git commit -m "Format code using Prettier"

# Push the changes to the remote repository
git push origin HEAD
