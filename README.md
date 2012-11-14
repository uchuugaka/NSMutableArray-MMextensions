NSMutableArray+MMextensions
===================

MMextensions is a NSMutableArray category that adds a bunch of helpful functions to NSMutableArray. (More coming soon)

If you haven't used a category before, set up is quite simple. 

Setup instructions:

Note: Category is included in a sample project, but only NSMutableArray+MMextensions.h and 
NSMutableArray+MMextensions.m are needed in your project.

1. drag and drop NSMutableArray+MMextensions.h
and NSMutableArray+MMextensions.m into your projects "Supporting Files" group. 

2. When the "Choose options for adding these file" window comes up, make sure that the "copy items 
into destination group's folder" and "add to targets" check boxes are selected

3. Import the categories header in the header file (.h) of your view controller #import "NSMutableArray+MMextensions.h"

And that's it you're done! Usage examples below.

 
Return the first item in the array.
    ```NSString *myString = [inputArray firstObject];```

Remove the first item in the array.
    ```[inputArray removeFirstObject];```

Remove all occurrences of an item from the array
    ```[inputArray removeAllObjectsIdenticalTo:@"17"];```

Return a random unsigned integer within the array's bounds
    ```NSUInteger i = [inputArray randomObjectIndex];```

Remove a random object from the array
    ```[inputArray removeRandomObject];```

Remove duplicates from the array. Order preservation should be set to NO if maintaining the original order
of the array isn't necessary. This will avoid utilization of a thread blocking loop.
    ```[inputArray removeDuplicateObjectsWithOrderPreservation:YES];```

Hash all items in the array using MD5.
    ```[inputArray md5HashAllItemsInArray];```

MD5 hash a specific item in the array.
    ````[inputArray md5HashObjectAtIndex:3];```

Create a copy of the input array with all indexes MD5 hashed.
    ```NSArray *newArray = [inputArray md5HashedCopyOfArray];```

Hash all items in the array using SHA1.
    ```[inputArray sha1HashAllItemsInArray];```

SHA1 hash a specific item in the array.
    ```[inputArray sha1HashObjectAtIndex:3];```

Create a copy of the input array with all indexes SHA1 hashed.
    ```NSArray *newArray = [inputArray sha1HashedCopyOfArray];```

Create a reversed copy of the input array. ([count]...0)
    ```NSArray *newArray = [inputArray reversedCopy];```

Reverses current array. ([count]...0)
    ```[inputArray reverseCurrentArray];```

Creates a shuffled copy of the input array. (NSUInteger) argument specifies intensity of shuffle
This number is unsigned and can not be lower than zero. You can set this number as high as 
you want, but please note that the shuffling operation will block the main thread until complete. 
For best performance keep this number below 5.
    NSArray *newArray = [inputArray shuffledCopy:2];```

Shuffle the current array. Same rules apply as listed above for shuffled copy.
    ```[inputArray shuffleCurrentArray:2];```

Return the index in the input array of the highest numeric value within the array.
    ```NSUInteger i = [inputArray indexOfHighestNumericalValue];```

Return the index in the input array of the lowest numeric value within the array.
    ```NSUInteger i = [inputArray indexOfLowestNumericalValue];```

Return the count of numbers in the array
    ```NSUInteger i = [inputArray countOfNumbersInArray];```

Return the count of strings in the array
    ```NSUInteger i = [inputArray countOfStringsInArray];```

Return the average numeric value contained within the input array.
    ```double avg = [inputArray averageNumericValueInArray];```

Return whether or not the object at a specified index is prime. (YES == EVEN | NO == ODD)
    ```BOOL primeIdx = [inputArray isNumberAtIndexPrime:6];```

Return whether or not the object at a specified index is even. (YES == EVEN | NO == ODD)
    ```BOOL evenIdx = [inputArray isObjectAtIndexEven:4];```

Return whether or not the array's count is even. (YES == EVEN | NO == ODD)
    ```BOOL evenCount = [inputArray isArrayCountEven];```

 




Created by Michael MacCallum on 10/28/12.
Copyright (c) 2012 HappTech. All rights reserved.

This Software is provided on an "AS IS" basis.  I
MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
FOR A PARTICULAR PURPOSE, REGARDING THE SOFTWARE OR ITS USE AND
OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.

IN NO EVENT SHALL I BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
MODIFICATION AND/OR DISTRIBUTION OF THE SOFTWARE, HOWEVER CAUSED
AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
STRICT LIABILITY OR OTHERWISE, EVEN IF I HAVE BEEN ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.

That being said, you are free to use this code free of charge for absoluely
anything you want. You may use this in personal projects, commercial projects
or for anything else.

Accreditation is not required, but is always appreciated.
