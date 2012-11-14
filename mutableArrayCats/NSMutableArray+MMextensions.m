//  NSMutableArray+MMextensions.h
//
//  Created by Michael MacCallum on 10/28/12.
//  Copyright (c) 2012 HappTech. All rights reserved.
//
//  This Software is provided on an "AS IS" basis.  I
//  MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
//  THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
//  FOR A PARTICULAR PURPOSE, REGARDING THE SOFTWARE OR ITS USE AND
//  OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
//
//  IN NO EVENT SHALL I BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
//  OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
//  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
//  INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
//  MODIFICATION AND/OR DISTRIBUTION OF THE SOFTWARE, HOWEVER CAUSED
//  AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
//  STRICT LIABILITY OR OTHERWISE, EVEN IF I HAVE BEEN ADVISED OF THE
//  POSSIBILITY OF SUCH DAMAGE.
//
//  That being said, you are free to use this code free of charge for absoluely
//  anything you want. You may use this in personal projects, commercial projects
//  or for anything else.
//
//  Accreditation is not required, but is always appreciated.
//

#import "NSMutableArray+MMextensions.h"

@implementation NSMutableArray (MMextensions)

- (id)firstObject
{
    if ([self count] > 0) {
        return self[0];
    }
    return nil;
}

- (void)removeFirstObject
{
    if ([self count] > 0) {
        return [self removeObjectAtIndex:0];
    }
}

- (void)removeAllObjectsIdenticalTo:(id)object
{
    NSMutableArray *temp = [self mutableCopy];
    for (id obj in self) {
        if (obj == object) {
            [temp removeObject:obj];
        }
    }
    [self removeAllObjects];
    [self addObjectsFromArray:temp];
    temp = nil;
}

- (id)randomObjectIndex
{
    if ([self count] > 0) {
        return self[arc4random() % [self count]];
    }
    return nil;
}

- (void)removeRandomObject
{
    if ([self count] > 0) {
        return [self removeObjectAtIndex:arc4random() % [self count]];
    }
}

- (void)removeDuplicateObjectsWithOrderPreservation:(BOOL)keepOrder
{
    if ([self count] > 0) {
        if (keepOrder) {
            NSMutableSet *set = [NSMutableSet set];
            NSMutableArray *temp = [NSMutableArray array];
            for (id obj in self) {
                if (![set containsObject:obj]) {
                    [set addObject:obj];
                    [temp addObject:obj];
                }
            }
            [self removeAllObjects];
            [self addObjectsFromArray:temp];
            temp = nil;
            set = nil;
        }else{
            NSArray *temp = [[NSSet setWithArray:self] allObjects];
            [self removeAllObjects];
            [self addObjectsFromArray:temp];
            temp = nil;
        }
    }
}

- (void)md5HashAllItemsInArray
{
    if ([self count] > 0) {
        for (NSUInteger i = 0; i < [self count]; i++) {
            self[i] = [self MD5gen:self[i]];
        }
    }
}


- (void)md5HashObjectAtIndex:(NSUInteger)idx
{
    if ([self count] > 0) {
        self[idx] = [self MD5gen:self[idx]];
    }
}


- (id)md5HashedCopyOfArray
{
    if ([self count] > 0) {
        NSMutableArray *copy = [[NSMutableArray alloc] initWithCapacity:self.count];
        for (NSUInteger i = 0; i < [self count]; i++) {
            [copy addObject:[self MD5gen:self[i]]];
        }
        return copy;
    }
    return 0;
}


- (void)sha1HashAllItemsInArray
{
    if ([self count] > 0) {
        for (NSUInteger i = 0; i < [self count]; i++) {
            self[i] = [self sha1gen:self[i]];
        }
    }
}


- (void)sha1HashObjectAtIndex:(NSUInteger)idx
{
    if ([self count] > 0) {
        self[idx] = [self sha1gen:self[idx]];
    }
}


- (id)sha1HashedCopyOfArray
{
    if ([self count] > 0) {
        NSMutableArray *copy = [[NSMutableArray alloc] initWithCapacity:self.count];
        for (NSUInteger i = 0; i < [self count]; i++) {
            [copy addObject:[self sha1gen:self[i]]];
        }
        return copy;
    }
    return 0;
}


- (NSString *)MD5gen:(NSString *)input
{
    const char *cStr = [input UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];

    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];

    return  output;
}

-(NSString *)sha1gen:(NSString *)input
{
    const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:input.length];

    uint8_t digest[CC_SHA1_DIGEST_LENGTH];

    CC_SHA1(data.bytes, data.length, digest);

    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];

    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
    
}

- (id)reversedCopy;
{
    if ([self count] > 1) {
        NSMutableArray *reversed = [[[self reverseObjectEnumerator] allObjects] mutableCopy];
        //    NSMutableArray *reversed = [[self reverseObjectEnumerator] allObjects];
        //    NSMutableArray *new = [NSMutableArray arrayWithCapacity:[self count]];
        //    [self enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop){
        //        [new addObject:obj];
        //    }];
        return reversed;
    }
    return self;
}

- (void)reverseCurrentArray
{
    if ([self count] > 1) {
        NSMutableArray *reversed = [[[self reverseObjectEnumerator] allObjects] mutableCopy];
        //    NSMutableArray *new = [NSMutableArray arrayWithCapacity:[self count]];
        //    [self enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop){
        //        [new addObject:obj];
        //    }];
        [self removeAllObjects];
        [self addObjectsFromArray:reversed];
    }
}

- (id)shuffledCopy:(NSUInteger)intensity
{
    if ([self count] > 1) {
        NSMutableArray *copy = [self mutableCopy];
        for (NSUInteger i = 0; (intensity > 0) ? i < (intensity * 15) + [copy count] : i < 10 + [copy count]; ++i) {
            int rand1 = arc4random() % [copy count];
            int rand2 = arc4random() % [copy count];
            while (rand1 == rand2) {
                rand2 = arc4random() % [copy count];
            }
            [copy exchangeObjectAtIndex:rand1 withObjectAtIndex:rand2];
        }
        return copy;
    }
    return self;
}

- (void)shuffleCurrentArray:(NSUInteger)intensity
{
    if ([self count] > 1) {
        for (NSUInteger i = 0; (intensity > 0) ? i < (intensity * 15) + [self count] : i < 10 + [self count]; ++i) {
            int rand1 = arc4random() % [self count];
            int rand2 = arc4random() % [self count];
            while (rand1 == rand2) {
                rand2 = arc4random() % [self count];
            }
            [self exchangeObjectAtIndex:rand1 withObjectAtIndex:rand2];
        }
    }
}

- (NSUInteger)indexOfHighestNumericalValue
{
    if ([self count] > 0) {
        NSMutableArray *copy = [self mutableCopy];
        for (int i = 0; i < [copy count]; i++) {
            if (![copy[i] integerValue]) {
                [copy removeObjectAtIndex:i];
            }
        }
        NSArray *sortedArray = [copy sortedArrayUsingComparator:^(id secondObject, id firstObject) {
            return [((NSString *)firstObject) compare:((NSString *)secondObject) options:NSNumericSearch];
        }];
        copy = nil;
        return [self indexOfObject:sortedArray[0]];
    }
    return 0;
}

- (NSUInteger)indexOfLowestNumericalValue
{
    if ([self count] > 0) {
        NSArray *sortedArray = [self sortedArrayUsingComparator:^(id firstObject, id secondObject) {
            return [((NSString *)firstObject) compare:((NSString *)secondObject) options:NSNumericSearch];
        }];
        return [self indexOfObject:sortedArray[0]];
    }
    return 0;
}

- (NSUInteger)countOfNumbersInArray;
{
    NSUInteger currentCount = 0;
    if ([self count] > 0) {
        for (id obj in self) {
            if (![obj doubleValue]) {
                currentCount ++;
            }
        }
        return [self count] - currentCount;
    }
    return 0;
}


- (NSUInteger)countOfStringsInArray
{
    NSUInteger currentCount = 0;
    if ([self count] > 0) {
        for (id obj in self) {
            if (![obj doubleValue]) {
                currentCount ++;
            }
        }
        return currentCount;
    }
    return 0;
}


- (double)averageNumericValueInArray
{
    if ([self count] > 0) {
        double totalValue = 0;
        double divisor = 0;
        for (int i = 0; i < [self count]; i++) {
            if ([self[i] doubleValue]) {
                totalValue += [self[i] doubleValue];
                divisor ++;
            }
        }
        return totalValue / divisor;
    }
    return 0;
}





- (BOOL)isNumberAtIndexPrime:(NSUInteger)idx
{
    if ([self count] > 0 && idx < [self count]) {
        if ([self[idx] integerValue]) {
            
            if ([self[idx] integerValue] <= 1) {
                return 0;
            };

            for (unsigned int i = 2; i * i <= [self[idx] integerValue]; i++) {
                if ([self[idx] integerValue] % i == 0) return 0;
            }
            return 1;
        }
        return 0;
    }
    return 0;
}

- (BOOL)isArrayCountEven
{
    if ([self count] > 0) {
        if ([self count] % 2){
            return 0;
        }else{
            return 1;
        }
    }
    return 0;
}

- (BOOL)isObjectAtIndexEven:(NSUInteger )idx
{
    if ([self count] > 0) {
        if ([self[idx] integerValue] % 2){
            return 0;
        }else{
            return 1;
        }
    }
    return 0;
}

//- (void)easyGridWithNumberOfColumns:(NSUInteger )columns spacer:(NSUInteger )space andObjectType:(id)objectType viewToAddTo:(UIView *)view isViewAScrollView:(BOOL)flag target:(id)target action:(SEL)action
//{
//    if (!flag) {
//        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:view.bounds];
//        [scrollView setBackgroundColor:[UIColor greenColor]];
//        [view addSubview:scrollView];
//    }
//
//    NSUInteger buttonSize = (view.bounds.size.width - ((columns + 1) * space)) / columns;
//    int height = (([self count] / 3) * (buttonSize + space)) + (buttonSize + (space * 2));
//    NSLog(@"%i",height);
//
//
//    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        int row = idx / columns;
//        int column = idx % columns;
//       
//        id dataModel = [[[objectType class] alloc] init];
//        [dataModel setFrame:CGRectMake((buttonSize + space) * column + space, (buttonSize + space) * row + space , buttonSize, buttonSize)];
//        [dataModel setTag:idx];
//        if ([dataModel respondsToSelector:@selector(setTitle: forState:)]) {
//            [dataModel setBackgroundColor:[UIColor blackColor]];
//            [dataModel setTitle:[NSString stringWithFormat:@"%u",idx] forState:UIControlStateNormal];
//            [dataModel addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//        }
//  
//
//        if (flag) {
//            [view addSubview:dataModel];
//            [(UIScrollView *)view setContentSize:CGSizeMake(view.frame.size.width, height)];
//        }else{
//            UIScrollView *scrollView = [view subviews][0];
//            [scrollView addSubview:dataModel];
//            [scrollView setContentSize:CGSizeMake(view.frame.size.width, height)];
//        }
//    }];
//}

//- (void)sortAZ09
//{
//    NSArray *sorted = [self sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
//        /* NSOrderedAscending, NSOrderedSame, NSOrderedDescending */
//        BOOL isPunct1 = [[NSCharacterSet p] characterIsMember:[(NSString*)obj1 characterAtIndex:0]];
//        BOOL isPunct2 = [[NSCharacterSet punctuationCharacterSet] characterIsMember:[(NSString*)obj2 characterAtIndex:0]];
//        if (isPunct1 && !isPunct2) {
//            return NSOrderedAscending;
//        } else if (!isPunct1 && isPunct2) {
//            return NSOrderedDescending;
//        }
//        return [(NSString*)obj1 compare:obj2 options:NSDiacriticInsensitiveSearch|NSCaseInsensitiveSearch];
//    }];
//    [self removeAllObjects];
//    [self addObjectsFromArray:sorted];
//}


@end