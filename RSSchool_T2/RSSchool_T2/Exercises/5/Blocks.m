#import "Blocks.h"

@interface Blocks ()

@property (nonatomic, copy) NSArray *myarray;
@property (nonatomic, copy) Class myclass;

@end

@implementation Blocks

- (BlockA)blockA {
    return ^void(NSArray *array) {
        self.myarray = array;
    };
}
- (BlockB)blockB {
    return ^void(Class class) {
        self.myclass = class;
        NSMutableArray *arraymutable = [self.myarray mutableCopy];
        [arraymutable removeObjectIdenticalTo:[NSNull null]];
        [arraymutable filterUsingPredicate:[NSPredicate predicateWithFormat: @"isKindOfClass: %@", class]];
        
        if (class == [NSNumber class]) {
            __block NSInteger numer = 0;
            [arraymutable enumerateObjectsUsingBlock:^(NSNumber *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                numer += [obj intValue];
            }];
            self.blockC(@(numer));
        } else if (class == [NSString class]) {
            __block NSString *str = @"";
            [arraymutable enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                str = [NSString stringWithFormat:@"%@%@", str, obj];
            }];
            self.blockC(str);
        } else if (class == [NSDate class]) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"dd.MM.yyyy";
            NSDate *resultDate = [arraymutable firstObject];
            for (NSDate *currentDate in arraymutable) {
                resultDate = [currentDate laterDate:resultDate];
            }
            self.blockC([formatter stringFromDate:resultDate]);
        }
    };
}
@end


