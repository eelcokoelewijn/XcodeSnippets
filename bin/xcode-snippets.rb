#!/usr/bin/ruby
require 'plist' # https://github.com/bleything/plist
require 'rexml/document'

# helper methods
# print message to console
def outputLogMessage(message)
  puts message
end

# // Set Frame
# // Initializes a view frame inside a code block
# // Platform: All
# // Language: Objective-C
# // Completion Scope: Function or Method
# // [Codesnippet]

startOptions = ARGV[0]

wkDir = Dir.getwd
xcodeDir = Dir.home+"/Library/Developer/Xcode/UserData/CodeSnippets"

if startOptions == "extract"
  outputLogMessage("Extracting snippets from #{xcodeDir}")

  Dir.chdir(xcodeDir)

  codeSnippetCompletionScopes = ""
  codeSnippetContents = ""
  codeSnippetIdentifier = ""
  codeSnippetLanguage = ""
  codeSnippetTitle = ""
  codeSnippetUserSnippet = ""
  codeSnippetVersion = ""

  Dir.glob("*.codesnippet") do |snippetFilename|
    # outputLogMessage(snippetFilename)

    result = Plist::parse_xml(snippetFilename)

    # key : IDECodeSnippetCompletionScopes
    codeSnippetCompletionScopes = result['IDECodeSnippetCompletionScopes'][0]
    # key : IDECodeSnippetContents
    codeSnippetContents = result['IDECodeSnippetContents']
    # key : IDECodeSnippetIdentifier
    codeSnippetIdentifier = result['IDECodeSnippetIdentifier']
    # key : IDECodeSnippetLanguage
    codeSnippetLanguage = result['IDECodeSnippetLanguage']
    # key : IDECodeSnippetTitle
    codeSnippetTitle = result['IDECodeSnippetTitle']
    # key : IDECodeSnippetUserSnippet
    codeSnippetUserSnippet = result['IDECodeSnippetUserSnippet']
    # key : IDECodeSnippetVersion
    codeSnippetVersion = result['IDECodeSnippetVersion']

    filename = codeSnippetTitle.downcase.strip.gsub(/[^\w\.\-]/,"_")
    f = File.open(wkDir+"/"+filename.insert(-1,".m"),"w+")
    f.puts("// IDECodeSnippetTitle: #{codeSnippetTitle}")
    f.puts("// IDECodeSnippetCompletionScopes: #{codeSnippetCompletionScopes}")
    f.puts("// IDECodeSnippetLanguage: #{codeSnippetLanguage}")
    f.puts("#{codeSnippetContents}")

  end
elsif startOptions == "add"
  outputLogMessage("Add snippets to #{xcodeDir}")
else
  outputLogMessage("Use xcode-snippets with 'extract' or 'add' argument")
end
