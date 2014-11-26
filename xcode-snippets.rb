#!/usr/bin/ruby -w
require 'plist' # https://github.com/bleything/plist
require 'rexml/document'

# // Set Frame
# // Initializes a view frame inside a code block
# // Platform: All
# // Language: Objective-C
# // Completion Scope: Function or Method
# // [Codesnippet]

wkDir = Dir.getwd

Dir.chdir(Dir.home+"/Library/Developer/Xcode/UserData/CodeSnippets")

codeSnippetCompletionScopes = ""
codeSnippetContents = ""
codeSnippetIdentifier = ""
codeSnippetLanguage = ""
codeSnippetTitle = ""
codeSnippetUserSnippet = ""
codeSnippetVersion = ""

Dir.glob("*.codesnippet") do |snippetFilename|
  puts snippetFilename

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
