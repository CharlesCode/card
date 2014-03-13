//
//  Card.h
//  Match3
//
//  Created by Charles.Li on 10/30/13.
//  Copyright (c) 2013 Charles.Li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) id contents;
@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

-(int) match: (NSArray *) otherCards;


@end
