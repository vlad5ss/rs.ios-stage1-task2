#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
//https://www.geeksforgeeks.org/convert-given-time-words/
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    NSString *result;
    NSInteger m =[minutes integerValue];
    NSInteger h =[hours integerValue];
    NSInteger division = h / 12;
    NSArray *nums = @[@"zero", @"one", @"two", @"three", @"four",
                      @"five", @"six", @"seven", @"eight", @"nine",
                      @"ten", @"eleven", @"twelve", @"thirteen",
                      @"fourteen", @"fifteen", @"sixteen", @"seventeen",
                      @"eighteen", @"nineteen", @"twenty", @"twenty one",
                      @"twenty two", @"twenty three", @"twenty four",
                      @"twenty five", @"twenty six", @"twenty seven",
                      @"twenty eight", @"twenty nine", ];
    
    if ([minutes integerValue] == 0){
        result = [@"%s o' clock " stringByAppendingString:  [nums objectAtIndex:h]];
    }
    else if ([minutes integerValue] == 1){
        result = [@"one minute past " stringByAppendingString:  [nums objectAtIndex:h]];
    }
    else if ([minutes integerValue] == 59){
        result = [@"one minute to " stringByAppendingString:  [nums objectAtIndex:division +1]];
    }
    else if ([minutes integerValue] == 15){
        result = [@"quarter past " stringByAppendingString:  [nums objectAtIndex:h]];
    }
    else if ([minutes integerValue] == 30){
        result = [@"half past " stringByAppendingString:  [nums objectAtIndex:h]];
    }
    else if ([minutes integerValue] == 45){
        result = [@"quarter to " stringByAppendingString:  [nums objectAtIndex:division +1]];
    }
    else if ([minutes integerValue] <= 30){
        NSString *concat = [@"quarter to " stringByAppendingString:  [nums objectAtIndex:m]];
        result = [concat stringByAppendingString:  [nums objectAtIndex:h]];
    }
    else if ([minutes integerValue] > 30){
        NSString *concat = [@"quarter to " stringByAppendingString:  [nums objectAtIndex:(60-m)]];
        result = [concat stringByAppendingString:  [nums objectAtIndex:division+1]];
        
    }
    
    return result;
}
@end

