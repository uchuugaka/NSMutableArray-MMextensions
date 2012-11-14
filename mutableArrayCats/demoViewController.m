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

#import "demoViewController.h"
#import "NSMutableArray+MMextensions.h"
//add objectForKeyAtIndex

@interface demoViewController ()

@end

@implementation demoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];



    NSMutableArray *myMutArray = [[NSMutableArray alloc] initWithObjects:@"97", @"attention", @"17", @"100.45", @"33", @"textual", @"24", @"333", @"indexes", @"44.5", @"are", @"676.99", @"ignored", @"37.4", @"97", @"attention", @"17", @"100.45", @"33", @"textual", @"24", @"333", @"indexes", @"44.5", @"are", @"676.99", @"ignored", @"37.4", @"97", @"attention", @"17", @"100.45", @"33", @"textual", @"24", @"333", @"indexes", @"44.5", @"are", @"676.99", @"ignored", @"37.4", nil];


    [myMutArray removeAllObjectsIdenticalTo:@"17"];
    NSLog(@"%@",myMutArray);

    
    NSLog(@"Number of strings:%u",[myMutArray countOfStringsInArray]);
    
    NSArray *reversedArray = [myMutArray reversedCopy];
    NSLog(@"Regular order: %@\n\nReverse order: %@",myMutArray,reversedArray);

    

    NSLog(@"Average of numbers in array: %f",[myMutArray averageNumericValueInArray]);

    if ([myMutArray isArrayCountEven]) {
        NSLog(@"Arrays count is even");
    }else{
        NSLog(@"Arrays count is odd");
    }

    if ([myMutArray isNumberAtIndexPrime:0]) {
        NSLog(@"prime");
    }else{
        NSLog(@"not prime");
    }


    NSLog(@"\n\nHighest Number:objectAtIndex: %i\n\nLowest Number:objectAtIndex: %i\n\nFirst Object: %@\n\n",[myMutArray indexOfHighestNumericalValue],[myMutArray indexOfLowestNumericalValue],[myMutArray firstObject]);

    //    Also included but not displayed in log (void)removeFirstObject. Example: [myMutArray removeFirstObject];


    NSArray *shuffledCopyOfArray = [myMutArray shuffledCopy:3];
    [myMutArray shuffleCurrentArray:3];
    /*(NSUInteger) specifies intensity of shuffle
     This number is unsigned and can not be lower than zero.
     You can set this number as high as you want, but please
     note that the shuffling operation will block the main thread
     until complete. For best performance keep this number below 5.
     */
    [myMutArray shuffleCurrentArray:5];

    NSLog(@"Shuffled Copy: %@\n\nOriginal shuffled: %@",shuffledCopyOfArray,myMutArray);


    [myMutArray removeDuplicateObjectsWithOrderPreservation:NO];//  YES will keep order intact NO will not, plain and simple.
                                                                //  If you don't require your array to maintain its original
                                                                //  order than I advise usage of NO as it does not require
                                                                //  the usage of a loop.
    NSLog(@"%@",myMutArray);


    [myMutArray md5HashObjectAtIndex:4];
    NSLog(@"Object at index 4 hashed: %@",[myMutArray objectAtIndex:4]);

    [myMutArray md5HashAllItemsInArray];
    NSLog(@"%@",myMutArray);

}

- (void)gridItemTapped:(id)sender
{
//    NSLog(@"tap");
    NSLog(@"%@",(UIButton*)sender);
}

- (void)didReceiveMemoryWarning
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end