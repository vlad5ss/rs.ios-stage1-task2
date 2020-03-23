#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    //Task1 exxercise
    //Task1 exxercise
    NSString *concat = [day stringByAppendingString:month];
    NSString *dateStr = [concat stringByAppendingString:year];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"ddMMyyyy"];
    NSDate *date = [dateFormat dateFromString:dateStr];
    
    if (!date) { return @"Такого дня не существует"; } else {
        [dateFormat setDateFormat:@"EEEE MMMM d, YYYY"];
        dateStr = [dateFormat stringFromDate:date];
        
    }
    
    
    
    return dateStr;
}

@end
