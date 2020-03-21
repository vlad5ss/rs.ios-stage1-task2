#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    //Task1 exxercise
    NSString *concat = [day stringByAppendingString:month];
    NSString *dateStr = [concat stringByAppendingString:year];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"ddMMyyyy"];
    NSDate *date = [dateFormat dateFromString:dateStr];
    
//        [dateFormat setDateFormat:@"EEEE MMMM d, YYYY"];
//        dateStr = [dateFormat stringFromDate:date];
    
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay: [day intValue]];
    [comps setMonth:[month intValue]];
    [comps setYear:[year intValue]];
    Boolean Validate= comps.isValidDate;
    if ( (Validate=true)) {
        [dateFormat setDateFormat:@"EEEE MMMM d, YYYY"];
        dateStr = [dateFormat stringFromDate:date];
    } else {
        
        dateStr =@"Date don't exist";
    }
    
    
    
    
    return dateStr;
}

@end
