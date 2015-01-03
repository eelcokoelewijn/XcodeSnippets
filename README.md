XCodeSnippets
=============

Collection of XCode snippets + tool for extracting and adding

##Snippet extractor tool
The bin folder contains a ruby script for extracting the user XCode snippets. Run ./bin/xcode-snippets.rb extract into your working directory, the script will pullout all the user code snippets from XCode. Extracted snippets are saved using their title in a .m file.

##Snippet add tool
The bin folder contains a ruby script for adding user XCode snippets. Run ./bin/xcode-snippets.rb add will convert all .m files from the working directory into xcode snippet-plist file. And place the files into XCode user codesnippets folder. Normally located in: /Users/[USERNAME]/Library/Developer/Xcode/UserData/CodeSnippets

###Dependency
Script is depending on plist gem from [bleything](https://github.com/bleything/plist)  

    gem install plist
