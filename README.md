XCodeSnippets
=============

Collection of Xcode snippets + script for exporting and importing

## Exporting snippets
To export the code snippets from Xcode, located in `/Users/[USERNAME]/Library/Developer/Xcode/UserData/CodeSnippets`, run the following command:

`xcodesnippets export`

This will export all snippets to the current working directory in the folder `snippets.json/default`.

## Importing snippets
To import code snippets into Xcode, run the following command:

`xcodesnippets import`

This will import all snippets from the `snippets.json/default` folder into `/Users/[USERNAME]/Library/Developer/Xcode/UserData/CodeSnippets` folder.

## Deprecated
The ruby script is deprecated and will no longer be maintained.

### Snippet extractor tool
The bin folder contains a ruby script for extracting the user XCode snippets. Run:

    ./bin/xcode-snippets.rb extract

From your working directory, the script will pullout all the user code snippets from XCode. Extracted snippets are saved using their title in a .m file.

### Snippet add tool
The bin folder contains a ruby script for adding user XCode snippets. Run:

    ./bin/xcode-snippets.rb add

This command will convert all .m files from the working directory into xcode snippet-plist file. And place the files into XCode user codesnippets folder. Normally located in: /Users/[USERNAME]/Library/Developer/Xcode/UserData/CodeSnippets

#### Dependency
Script is depending on plist gem from [bleything](https://github.com/bleything/plist)  

    gem install plist
