//
//  RedCell.m
//  ColoredCollectionView
//
//  Created by Russel on 03.11.15.
//  Copyright © 2015 Russel. All rights reserved.
//

#import "RedCell.h"

@implementation RedCell

#pragma mark - Init

- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

#pragma mark - Subclass

- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize{
    return CGSizeMake(100.0f, 100.0f);
}

@end
