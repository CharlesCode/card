//
//  PlayingCard.m
//  Match3
//
//  Created by Charles.Li on 10/30/13.
//  Copyright (c) 2013 Charles.Li. All rights reserved.
//

#import "PlayingCard.h"





@implementation PlayingCard
//-(int) match:(NSArray *)otherCards
//{
//    int score = 0;
//    
//    if ([otherCards count ]==1){
//        PlayingCard *otherCard = [otherCards firstObject];
//        if ([self.suit isEqualToString: otherCard.suit]){
//            score=1;
//        }
//        else if (self.rank ==otherCard.rank){
//            score=4;
//        }
//    }
//    
//    return score;
//}


-(int) match:(NSArray *)otherCards


{
    NSLog(@"old match is called");
    int score = 0;
    
    NSUInteger arrayCount = [otherCards count];
    
    
    for (PlayingCard *nextCard in otherCards) {
        
        if ([nextCard isKindOfClass:[PlayingCard class]]){
            if ([self.suit isEqualToString: nextCard.suit]){
                score=1;
            }
            else if (self.rank ==nextCard.rank){
                score=4;
            }
        }
    }
    
    if (arrayCount>1){
        
        for (int i=0; i<arrayCount; i++) {
            
            int index=i;
            PlayingCard *aCard=otherCards[index];

            
            for (int i = index+1; i<arrayCount; i++) {
                int indexer=i;
                PlayingCard *bCard = otherCards[indexer];
                
                
                if ([bCard.suit isEqualToString: aCard.suit]){
                    score+=1;
                }
                else if (bCard.rank ==aCard.rank){
                    score+=4;
                }
            }
            
            
        }
        
    }
    
    return score;
}


-(NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank]
            stringByAppendingString:self.suit];
}




//setting up the valid suits
+(NSArray *)validSuits
{
    return @[@"❤︎", @"♣︎", @"◆", @"♠︎"];
}



//setting up the valid ranks
+(NSArray *)rankStrings{
    return @[@"?", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+(NSUInteger)maxRank

{
    return [[PlayingCard rankStrings] count]-1;
}

//protect the rank
-(void)setRank:(NSUInteger)rank{
    if (rank <=[PlayingCard maxRank]){
        _rank=rank;
    }
}


//setting up the suit

@synthesize suit=_suit;

-(void)setSuit: (NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject: suit]){
        _suit=suit;
    }
}

-(NSString *)suit{
    return _suit ? _suit: @"?";
    
}




@end
