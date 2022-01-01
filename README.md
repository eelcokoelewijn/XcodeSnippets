XCodeSnippets
=============

Collection of Xcode snippets + script for exporting and importing

## Exporting snippets
To export the code snippets from Xcode, located in `/Users/[USERNAME]/Library/Developer/Xcode/UserData/CodeSnippets`, run the following command:

`swift run snippets export`

This will export all snippets to the current working directory in the folder `snippets.json/default`.

## Importing snippets
To import code snippets into Xcode, run the following command:

`swift run snippets import`

This will import all snippets from the `snippets.json/default` folder into `/Users/[USERNAME]/Library/Developer/Xcode/UserData/CodeSnippets` folder.

## Build from source
To build Snippets from source run:

`swift build -c release`
