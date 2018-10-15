// IDECodeSnippetTitle: create entity without context
// IDECodeSnippetCompletionPrefix: objc_create-entity-no-context
// IDECodeSnippetCompletionScopes: ClassImplementation
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetSummary: 
+ (<#class#> *)create<#class#> {
    NSManagedObjectContext *context = [CoreDataStack sharedInstance].mainContext;
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:[<#class#> entityName] inManagedObjectContext:context];
    <#class#> *<#entityName#> = [[<#class#> alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:nil];

    return <#entityName#>;
}
