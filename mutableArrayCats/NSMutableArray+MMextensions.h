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

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>

@interface NSMutableArray (MMextensions)

- (id)firstObject;
- (void)removeFirstObject;
- (void)removeAllObjectsIdenticalTo:(id)object;
- (id)randomObjectIndex;
- (void)removeRandomObject;
- (void)removeDuplicateObjectsWithOrderPreservation:(BOOL)flag;
- (void)md5HashAllItemsInArray;
- (void)md5HashObjectAtIndex:(NSUInteger)idx;
- (id)md5HashedCopyOfArray;
- (void)sha1HashAllItemsInArray;
- (void)sha1HashObjectAtIndex:(NSUInteger)idx;
- (id)sha1HashedCopyOfArray;
- (id)reversedCopy;
- (void)reverseCurrentArray;
- (id)shuffledCopy:(NSUInteger)intensity;
- (void)shuffleCurrentArray:(NSUInteger)intensity;
- (NSUInteger)indexOfHighestNumericalValue;
- (NSUInteger)indexOfLowestNumericalValue;
- (NSUInteger)countOfNumbersInArray;
- (NSUInteger)countOfStringsInArray;
- (double)averageNumericValueInArray;
- (BOOL)isNumberAtIndexPrime:(NSUInteger)indexOfObjectToCheck;
- (BOOL)isArrayCountEven;
- (BOOL)isObjectAtIndexEven:(NSUInteger )idx;

//- (void)sortAZ09;
//- (void)sort09AZ;
//- (void)sortZA90;
//- (void)sort90ZA;
//- (void)easyGridWithNumberOfColumns:(NSUInteger )columns spacer:(NSUInteger )space andObjectType:(id)objectType viewToAddTo:(UIView *)view isViewAScrollView:(BOOL)flag target:(id)target action:(SEL)action;

@end