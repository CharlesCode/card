//
//  SetCard.h
//  Match3
//
//  Created by Charles.Li on 11/26/13.
//  Copyright (c) 2013 Charles.Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface SetCard : Card

@property(nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *shade;
@property (nonatomic) NSUInteger number;
@property (nonatomic, strong) NSString *shape;



+(NSArray *) validColor;
+(NSArray *) validShape;
+(NSArray *) validShade;
+(NSUInteger) maxNumber;


@end
