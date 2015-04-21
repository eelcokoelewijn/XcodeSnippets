// IDECodeSnippetTitle: get or create entity with server id
// IDECodeSnippetCompletionPrefix: objc_get-or-create-entity
// IDECodeSnippetCompletionScopes: ClassImplementation
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
+ (<#class#> *)getOrCreate<#class#>WithServerId:(NSInteger)serverId inManagedContext:(NSManagedObjectContext *)context
	{
	    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[<#class#> entityName]];
	    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"<#idParamName#> = %d", serverId]];
	    [fetchRequest setFetchLimit:1];
	    
	    NSError *error = nil;
	    NSArray *results = [context executeFetchRequest:fetchRequest error:&error];
	    
	    if (error) {
	        NSLog(@"ERROR: %@ %@", [error localizedDescription], [error userInfo]);
	        return nil;
	    }
	    
	    <#class#> *<#entityName#>;
	    if (results.count == 0)
	    {
	        <#entityName#> = [<#class#> insertInManagedObjectContext:context];
	        <#entityName#>.<#idParamName#> = [NSNumber numberWithInteger:serverId];
	    }
	    else
	    {
	        <#entityName#> = [results lastObject];
	    }
	    
	    return <#entityName#>;
	}
	
