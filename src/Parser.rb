require('securerandom.rb')

class Parser
  # class method
  # Parse plist into key/value hash
  def self.plistFile(filename)
    result = Plist::parse_xml(filename)

    parseResultHash = Hash.new()
    # key : IDECodeSnippetCompletionScopes
    parseResultHash['codeSnippetCompletionScopes'] = result['IDECodeSnippetCompletionScopes'][0]
    # key : IDECodeSnippetContents
    parseResultHash['codeSnippetContents'] = result['IDECodeSnippetContents']
    # key : IDECodeSnippetIdentifier
    parseResultHash['codeSnippetIdentifier'] = result['IDECodeSnippetIdentifier']
    # key : IDECodeSnippetLanguage
    parseResultHash['codeSnippetLanguage'] = result['IDECodeSnippetLanguage']
    # key : IDECodeSnippetTitle
    parseResultHash['codeSnippetTitle'] = result['IDECodeSnippetTitle']
    # key : IDECodeSnippetUserSnippet
    parseResultHash['codeSnippetUserSnippet'] = result['IDECodeSnippetUserSnippet']
    # key : IDECodeSnippetVersion
    parseResultHash['codeSnippetVersion'] = result['IDECodeSnippetVersion']

    return parseResultHash
  end

  # class method
  # Parse .m file into plist
  def self.dotMFile(filename)
    f = File.open(filename)
    codesnippetPlist = Hash.new()
    lines = f.readlines

    # codeSnippetTitle = ""
    codeSnippetTitle = lines[0].split(":")
    codeSnippetTitleKey = codeSnippetTitle[0].sub("// ","").strip
    codeSnippetTitleValue = codeSnippetTitle[1].strip
    codesnippetPlist[codeSnippetTitleKey] = codeSnippetTitleValue

    # codeSnippetCompletionScopes = ""
    codeSnippetCompletionScopes = lines[1].split(":")
    codeSnippetCompletionScopesKey = codeSnippetCompletionScopes[0].sub("// ","").strip
    codeSnippetCompletionScopesValue = codeSnippetCompletionScopes[1].strip
    codesnippetPlist[codeSnippetCompletionScopesKey] = [codeSnippetCompletionScopesValue]

    # codeSnippetLanguage = ""
    codeSnippetLanguage = lines[2].split(":")
    codeSnippetLanguageKey = codeSnippetLanguage[0].sub("// ","").strip
    codeSnippetLanguageValue = codeSnippetLanguage[1].strip
    codesnippetPlist[codeSnippetLanguageKey] = codeSnippetLanguageValue

    # IDECodeSnippetIdentifier
    codesnippetPlist["IDECodeSnippetIdentifier"] = SecureRandom.uuid.upcase

    # IDECodeSnippetVersion
    codesnippetPlist["IDECodeSnippetVersion"] = 2

    # IDECodeSnippetUserSnippet
    codesnippetPlist["IDECodeSnippetUserSnippet"] = true

    # IDECodeSnippetContents
    linesOfCode = lines.slice(3,lines.length)
    snippetCode = ""
    for lineOfCode in linesOfCode do
      snippetCode += "#{lineOfCode}"
    end
    codesnippetPlist["IDECodeSnippetContents"] = snippetCode

    return codesnippetPlist
  end
end