#!/bin/bash

# Define the source files to generate documentation from
SOURCE_FILES="src/**/*.js"

# Define the name of the GitHub branch to generate documentation for
BRANCH_NAME="main"

# Define the name of the documentation file
DOCUMENTATION_FILE="index.html"

# Install jsdoc if it's not already installed
if ! command -v jsdoc &> /dev/null
then
    echo "jsdoc is not installed. Installing now..."
    npm install -g jsdoc
fi

# Check out the specified branch
echo "Checking out $BRANCH_NAME branch..."
git checkout $BRANCH_NAME

# Ask the user to specify the output directory for the documentation
read -p "Where should the documentation be generated? " OUTPUT_DIRECTORY

# Generate the documentation using jsdoc
echo "Generating documentation..."
jsdoc $SOURCE_FILES -d $OUTPUT_DIRECTORY

# Add the changes to git and commit them with a generic message
echo "Committing changes..."
git add $OUTPUT_DIRECTORY
git commit -m "Generate documentation using jsdoc"

# Push the changes to the remote repository
echo "Pushing changes..."
git push origin $BRANCH_NAME

# Open the documentation file in the default web browser
echo "Opening documentation..."
xdg-open $OUTPUT_DIRECTORY$DOCUMENTATION_FILE
