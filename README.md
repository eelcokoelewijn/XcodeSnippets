XCodeSnippets
=============

Collection of XCode snippets

##Snippet extractor tool
The bin folder contains a ruby script for extracting the user XCode snippets. Run ./bin/xcode-snippets.rb into your working directory, the script will pullout all the user code snippets from XCode. Extracted snippets are saved using their title in a .m file.

###Dependency
Script is depending on plist gem from [bleything](http://plist.rubyforge.org)  

    gem install plist
