#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    //https://stackoverflow.com/questions/54532309/product-of-two-consecutive-fibonacci-numbers-code-times-out
    //https://www.codewars.com/kata/product-of-consecutive-fib-numbers
    //    public static long[] productFib(long prod) {
    //
    //        long prev = 0;
    //        long curr = 1;
    //        long multiplied = prev * curr;
    //
    //        while (multiplied < prod) {
    //            long temp = curr;
    //            curr += prev;
    //            prev = temp;
    //            multiplied = prev * curr;
    //        }
    //
    //        return new long[] { prev, curr, multiplied == prod ? 1 : 0 };
    //
    //    }
    int prev = 0, temp = 1, curr = 1;
    while (curr*temp < [number intValue]) {
        prev = temp;
        temp = curr;
        curr = prev + temp;
    }
    if (curr*temp == [number intValue])
        return @[[NSNumber numberWithInt:temp],[NSNumber numberWithInt:curr], [NSNumber numberWithInt:1]];
    else return @[[NSNumber numberWithInt:temp],[NSNumber numberWithInt:curr], [NSNumber numberWithInt:0]];
    
}
@end
