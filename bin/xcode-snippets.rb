#!/usr/bin/env ruby
require 'plist' # https://github.com/bleything/plist
require 'rexml/document'
require 'fileutils'
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
deleteSnippets = !ARGV[1].nil? ? true : false

wkDir = Dir.getwd
snippetsDir = wkDir + "/Snippets"
templatesDir = wkDir + "/Templates"
xCodeDir = Dir.home + "/Library/Developer/Xcode/"
xCodeSnippetsPath = ["UserData","CodeSnippets"]
xCodeTemplatesPath = ["Templates","File Templates","Custom"]
xCodeSnippetsDir = xCodeDir + xCodeSnippetsPath.join("/")
xCodeTemplatesDir = xCodeDir + xCodeTemplatesPath.join("/")

def checkForFolder(path, folder)
    if not Dir.exist?(path + folder)
        Logger.show("Creating #{path}#{folder}")
        Dir.mkdir(path + folder)
    end
end

def createTemplatesFolder(baseFolder, paths)
    fullPath = baseFolder
    paths.each { |item|
        checkForFolder(fullPath, item)
        fullPath += "#{item}/"
    }
end

def deleteFolder(path)
  FileUtils.rm_rf(path)
end

if startOptions == "extract-snippets"
    checkForFolder(xCodeDir, xCodeSnippetsPath.join("/"))
    Logger.show("Extracting snippets from #{xCodeSnippetsDir}")

    Dir.chdir(xCodeSnippetsDir)

    Dir.glob("*.codesnippet") do |snippetFilename|
    Logger.show("Creating snippet: #{snippetFilename}")
    resultHash = Parser.plistFile(snippetFilename)
    Writer.fileContents(resultHash, snippetsDir)
    end

elsif startOptions == "add-snippets"
    if deleteSnippets
      Logger.show("Delete snippets folder #{xCodeSnippetsDir}")
      deleteFolder(xCodeSnippetsDir)
    end
    checkForFolder(xCodeDir, xCodeSnippetsPath.join("/"))
    Logger.show("Add snippets to #{xCodeSnippetsDir}")
    Dir.chdir(snippetsDir)
    Dir.glob("*.{m,swift}") do |snippetFilename|
    Logger.show("Add snippet: #{snippetFilename}")
    resultHash = Parser.dotMFile(snippetFilename)
    Writer.plistFile(resultHash, xCodeSnippetsDir)
    end
elsif startOptions == "add-templates"
    createTemplatesFolder(xCodeDir, xCodeTemplatesPath)
    Logger.show("Add templates to #{xCodeTemplatesDir}")
    Dir.chdir(templatesDir)
    Dir.glob("*.{xctemplate}") do |templateFilename|
    Logger.show("Add template: #{templateFilename}")
    FileUtils.cp_r(templateFilename, xCodeTemplatesDir)
    end
elsif startOptions == "extract-templates"
    Logger.show("Extracting templates from #{xCodeTemplatesDir}")

    Dir.chdir(xCodeTemplatesDir)

    Dir.glob("*.xctemplate") do |templateFilename|
    Logger.show("Copy template: #{templateFilename}")
    FileUtils.cp_r(templateFilename, templatesDir)
    end
else
    Logger.show("Use xcode-snippets with 'extract-snippets' or 'add-snippets' argument")
end
