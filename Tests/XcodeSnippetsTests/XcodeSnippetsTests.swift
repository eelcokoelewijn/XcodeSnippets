import XCTest
@testable import XcodeSnippets
@testable import FileKit

final class XcodeSnippetsTests: XCTestCase {
    override func setUp() {
        // {
        // "scopes" : [
        //     "ClassImplementation"
        // ],
        // "summary" : "Setup auto layout helper views",
        // "userSnippet" : true,
        // "title" : "Autolayout helpers",
        // "completionPrefix" : "objc_al_setup-auto-layout",
        // "language" : "Xcode.SourceCodeLanguage.Objective-C",
        // "contents" : "#pragma mark - setup views\n\t\n\t- (void)setupViews {\n\t    [self.view addSubview:<#childView#>];\n\t}\n\t\n\t#pragma mark - layout constraints\n\t\n\t- (void)setupViewConstraints {\n\t    NSMutableArray* constraints = [NSMutableArray new];\n\t    [constraints addObject:[NSLayoutConstraint constraintWithItem:<#(nonnull UIView *)#>\n\t                                                        attribute:<#NSLayoutAttribute#>\n\t                                                        relatedBy:<#NSLayoutRelation#>\n\t                                                           toItem:<#(nullable UIView *)#>\n\t                                                        attribute:<#NSLayoutAttribute#>\n\t                                                       multiplier:1\n\t                                                         constant:0]];\n\t    [NSLayoutConstraint activateConstraints:constraints];\n\t}\n\t",
        // "identifier" : "D8F9924D-2B17-43F0-AF62-680013CA5FFC",
        // "version" : 2
        // }        
        _jsonString = "{\"scopes\":[\"ClassImplementation\"],\"summary\":\"Setup auto layout helper views\",\"userSnippet\":true,\"title\":\"Autolayout helpers\",\"completionPrefix\":\"objc_al_setup-auto-layout\",\"language\":\"Xcode.SourceCodeLanguage.Objective-C\",\"contents\":\"#pragma mark - setup views\\n\\t\\n\\t- (void)setupViews {\\n\\t    [self.view addSubview:<#childView#>];\\n\\t}\\n\\t\\n\\t#pragma mark - layout constraints\\n\\t\\n\\t- (void)setupViewConstraints {\\n\\t    NSMutableArray* constraints = [NSMutableArray new];\\n\\t    [constraints addObject:[NSLayoutConstraint constraintWithItem:<#(nonnull UIView *)#>\\n\\t                                                        attribute:<#NSLayoutAttribute#>\\n\\t                                                        relatedBy:<#NSLayoutRelation#>\\n\\t                                                           toItem:<#(nullable UIView *)#>\\n\\t                                                        attribute:<#NSLayoutAttribute#>\\n\\t                                                       multiplier:1\\n\\t                                                         constant:0]];\\n\\t    [NSLayoutConstraint activateConstraints:constraints];\\n\\t}\\n\\t\",\"identifier\":\"D8F9924D-2B17-43F0-AF62-680013CA5FFC\",\"version\":2}"
        let data = _jsonString.data(using: .utf8)
        _jsonFile = FileKit.fileInCachesFolder(withName: "test.json", data: data)
    }

    func testSnippetJsonParser() {
        let subject = SnippetJsonParser()
        XCTAssertNoThrow(try subject.parse(file: _jsonFile), "Failed to parse json-snippet.")
    }

    func testSnippetJson() {
        let subject = SnippetJsonParser()
        let jsonSnippet = try? subject.parse(file: _jsonFile)
        guard let snippet = jsonSnippet else {
            XCTFail("Failed to parse json-snippet.")
            return
        }
        XCTAssertEqual(snippet.title, "Autolayout helpers", "'Autolayout helpers' expected, got \(snippet.title)")
        XCTAssertEqual(snippet.scopes, ["ClassImplementation"], "Array ['ClassImplementation'], got \(snippet.scopes)")
        XCTAssertEqual(snippet.version, 2, "Version 2 expected, got \(snippet.version)")
    }

    static var allTests = [
        ("testSnippetJsonParser", testSnippetJsonParser),
        ("testSnippetJson", testSnippetJson),
    ]

    private var _jsonString: String!
    private var _jsonFile: File!
}
//
//<?xml version="1.0" encoding="UTF-8"?>
//<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
//<plist version="1.0">
//<dict>
//    <key>IDECodeSnippetCompletionPrefix</key>
//    <string>cnstrnt</string>
//    <key>IDECodeSnippetCompletionScopes</key>
//    <array>
//        <string>CodeBlock</string>
//    </array>
//    <key>IDECodeSnippetContents</key>
//    <string>[&lt;#view#&gt; addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:&lt;#visualformat#&gt; options:0 metrics:&lt;#metrics#&gt; views:&lt;#views#&gt;]];
//    </string>
//    <key>IDECodeSnippetIdentifier</key>
//    <string>3B6DD540-B447-48DB-9CDE-BD2640EADDF8</string>
//    <key>IDECodeSnippetLanguage</key>
//    <string>Xcode.SourceCodeLanguage.Objective-C</string>
//    <key>IDECodeSnippetSummary</key>
//    <string>Create layout constraint using visual format</string>
//    <key>IDECodeSnippetTitle</key>
//    <string>Create NSLayoutConstraint visual format</string>
//    <key>IDECodeSnippetUserSnippet</key>
//    <true/>
//    <key>IDECodeSnippetVersion</key>
//    <integer>2</integer>
//</dict>
//</plist>
