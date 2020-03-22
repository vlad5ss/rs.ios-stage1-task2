#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    a = [a lowercaseString];
    b = [b lowercaseString];
    
    NSMutableSet *setA = [NSMutableSet new];
    NSMutableSet *setB = [NSMutableSet new];
    NSMutableSet *setDiff = [NSMutableSet new];
    NSMutableArray *arrayA = [NSMutableArray new];
    
    
    for(int i = 0; i < [a length]; i++){
        [setA addObject:[a substringWithRange:NSMakeRange(i, 1)]];
        [arrayA addObject:[a substringWithRange:NSMakeRange(i, 1)]];
    }
    
    for(int i = 0; i < [a length]; i++){
        [setB addObject:[b substringWithRange:NSMakeRange(i, 1)]];
    }
    
    setDiff = [setA mutableCopy];
    [setDiff minusSet:setB];
    [setA minusSet:setDiff];
    
    NSEnumerator *enumerator = [setDiff objectEnumerator];
    NSString *value;
    while ((value = [enumerator nextObject])) {
        [arrayA removeObject:value];
    }
    
    return ([[arrayA componentsJoinedByString:@""] isEqualToString:b]) ? @"YES" : @"NO";
}
@end

