#!/usr/bin/ruby
require 'plist' # https://github.com/bleything/plist
require 'rexml/document'
require_relative('../src/Logger.rb')
require_relative('../src/Parser.rb')
require_relative('../src/Writer.rb')

# // Set Frame
# // Initializes a view frame inside a code block
# // Platform: All
# // Language: Objective-C, Swift
# // CompletionPrefix: setFrame
# // Completion Scope: Function or Method
# // [Codesnippet]

startOptions = ARGV[0]

wkDir = Dir.getwd
xcodeDir = Dir.home+"/Library/Developer/Xcode/UserData/CodeSnippets"

if startOptions == "extract"
  Logger.show("Extracting snippets from #{xcodeDir}")

  Dir.chdir(xcodeDir)

  Dir.glob("*.codesnippet") do |snippetFilename|
    Logger.show("Creating snippet: #{snippetFilename}")
    resultHash = Parser.plistFile(snippetFilename)
    Writer.fileContents(resultHash, wkDir)
  end

elsif startOptions == "add"
  Logger.show("Add snippets to #{xcodeDir}")
  Dir.glob("*.{m,swift}") do |snippetFilename|
    Logger.show("Add snippet: #{snippetFilename}")
    resultHash = Parser.dotMFile(snippetFilename)
    Writer.plistFile(resultHash, xcodeDir)
  end

else
  Logger.show("Use xcode-snippets with 'extract' or 'add' argument")
end
