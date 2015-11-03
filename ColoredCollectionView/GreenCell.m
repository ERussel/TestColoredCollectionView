//
//  GreenCell.m
//  ColoredCollectionView
//
//  Created by Russel on 03.11.15.
//  Copyright © 2015 Russel. All rights reserved.
//

#import "GreenCell.h"

@implementation GreenCell

#pragma mark - Init

- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

#pragma mark - Subclass

- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize{
    return CGSizeMake(100.0f, 100.0f);
}

@end
