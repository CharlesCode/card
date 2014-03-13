//
//  SetCard.m
//  Match3
//
//  Created by Charles.Li on 11/26/13.
//  Copyright (c) 2013 Charles.Li. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard


+(NSArray *) validColor
{
    return @[@"red", @"yellow", @"blue"];
}

+(NSArray *) validShape
{
    return @[@"●", @"■", @"▲"];
}

+(NSArray *) validShade
{
    return @[@"filled", @"transperant", @"empty"];
}

+(NSUInteger) maxNumber
{
    return [[SetCard validColor] count];
}

-(void)setColor: (NSString *)color
{
    if ([[SetCard validColor] containsObject: color]){
        _color=color;
    }
}


-(void)setShape: (NSString *)shape
{
    if ([[SetCard validShape] containsObject: shape]){
        _shape=shape;
    }
}


-(void)setShade: (NSString *)shade
{
    if ([[SetCard validShade] containsObject: shade]){
        _shade=shade;
    }
}


//
//-(NSString *)contents
//{
//    
//    NSString *aThen = [NSString stringWithFormat:@"%@",self.shape];
//    for (int i=1; i<self.number; i++){
//        aThen = [aThen stringByAppendingString:self.shape];
//    }
//    
//   
//    NSString *bThen = [aThen stringByAppendingString:self.shade];
//    NSString *cThen = [bThen stringByAppendingString:self.color];
//    return cThen;
//}

-(NSDictionary *) contents{
    
    
    NSString *aThen = [NSString stringWithFormat:@"%@",self.shape];
    for (int i=1; i<self.number; i++){
            aThen = [aThen stringByAppendingString:self.shape];
    }
    
    NSDictionary *contentdic = @{@"color": self.color, @"text": aThen, @"shade": self.shade};
    
    
    return contentdic;
    
}



///override the match for setcard

-(int) match:(NSArray *)otherCards
{
    
    int score = 0;
    
    if ([self matchColor:otherCards] && [self matchShade:otherCards] && [self matchShape:otherCards]&&[self matchNumber:otherCards]){
        return score =1;
       
    }
    else if (![self matchColor:otherCards] && ![self matchShade:otherCards] && ![self matchShape:otherCards]&&[self matchNumber:otherCards]){
        return score =1;
         
    }
    else{
        return score;
    }

    
}

-(BOOL) matchColor: (NSArray *)cardsArray{
    
    
    int counter =0;
    
    
    for (SetCard *card in cardsArray){
        
        if ([self.color isEqualToString:card.color]){
            counter =counter+1;
        }
        
    }
    
    
    if (counter==0){
        SetCard *secondCard =[cardsArray firstObject];
        SetCard *thirdCard =[cardsArray lastObject];
        if ([secondCard.color isEqualToString: thirdCard.color]){
            counter =counter+1;
        }
    }
    
    
    if (counter ==2|| counter==0){
        return YES;
    }
    else {
        return NO;
    }
}



-(BOOL) matchShape: (NSArray *)cardsArray{
    
    int counter =0;
    
    
    
    for (SetCard *card in cardsArray){
        
        if ([self.shape isEqualToString:card.shape]){
            counter =counter+1;
        }
        
    }
    
    if (counter==0){
        SetCard *secondCard =[cardsArray firstObject];
        SetCard *thirdCard =[cardsArray lastObject];
        if ([secondCard.shape isEqualToString: thirdCard.shape]){
           counter =counter+1;
        }
    }
    
    
    
    if (counter ==2|| counter==0){
        return YES;
    }
    else {
        return NO;
    }
}


-(BOOL) matchShade: (NSArray *)cardsArray{
    
    
    int counter =0;
    
    
    for (SetCard *card in cardsArray){
        
        if ([self.shade isEqualToString:card.shade]){
            counter =counter+1;
        }
        
        
        
    }
    
    if (counter==0){
        SetCard *secondCard =[cardsArray firstObject];
        SetCard *thirdCard =[cardsArray lastObject];
        if ([secondCard.shade isEqualToString: thirdCard.shade]){
           counter =counter+1;
        }
    }
    
    
    
    if (counter ==2|| counter==0){
        return YES;
    }
    else {
        return NO;
    }
}



-(BOOL) matchNumber: (NSArray *)cardsArray{
    
    
    int counter =0;
   
    
    for (SetCard *card in cardsArray){
        
        if (self.number == card.number){
           counter =counter+1;
        }
        
    }
    
    if (counter==0){
        SetCard *secondCard =[cardsArray firstObject];
        SetCard *thirdCard =[cardsArray lastObject];
        if (secondCard.number == thirdCard.number){
         counter =counter+1;
        }
    }
    
    
    if (counter ==2|| counter==0){
        return YES;
    }
    else {
        return NO;
    }
}




    
@end
