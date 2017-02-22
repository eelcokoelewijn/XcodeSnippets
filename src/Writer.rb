class Writer

  # class method
  def self.fileContents(contentHash, folder)
    filename = contentHash['codeSnippetTitle'].downcase.strip.gsub(/[^\w\.\-]/,"_")
    fileExtension = Writer.fileExtension(contentHash['codeSnippetLanguage'])
    f = File.open(folder+"/"+filename.insert(-1,"#{fileExtension}"),"w+")
    f.puts("// IDECodeSnippetTitle: #{contentHash['codeSnippetTitle']}")
    f.puts("// IDECodeSnippetCompletionPrefix: #{contentHash['codeSnippetCompletionPrefix']}")
    f.puts("// IDECodeSnippetCompletionScopes: #{contentHash['codeSnippetCompletionScopes']}")
    f.puts("// IDECodeSnippetLanguage: #{contentHash['codeSnippetLanguage']}")
    f.puts("// IDECodeSnippetSummary: #{contentHash['codeSnippetSummary']}")
    f.puts("#{contentHash['codeSnippetContents']}")
  end

  def self.fileExtension(snippetLanguage)
    if snippetLanguage == "Xcode.SourceCodeLanguage.Swift"
      return ".swift"
    else
      return ".m"
    end
  end

  def self.plistFile(contentHash, folder)
    filename = folder + "/" + contentHash['IDECodeSnippetIdentifier'] + ".codesnippet"
    contentHash.save_plist(filename)
    # puts contentHash.to_plist()
  end

end
