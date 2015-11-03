//
//  ViewController.m
//  ColoredCollectionView
//
//  Created by Russel on 03.11.15.
//  Copyright © 2015 Russel. All rights reserved.
//

#import "ViewController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "RedCell.h"
#import "GreenCell.h"
#import "BlueCell.h"

@interface ViewController ()<ASCollectionViewDataSource, ASCollectionViewDelegate>

@property(nonatomic, weak)UISegmentedControl *segmentedControl;
@property(nonatomic, weak)ASCollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UICollectionViewFlowLayout *collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    collectionViewFlowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    collectionViewFlowLayout.minimumInteritemSpacing = 5.0f;
    collectionViewFlowLayout.minimumLineSpacing = 5.0f;
    collectionViewFlowLayout.sectionInset = UIEdgeInsetsMake(65.0f, 5.0f, 5.0f, 5.0f);
    ASCollectionView* collectionView = [[ASCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:collectionViewFlowLayout asyncDataFetching:NO];
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.alwaysBounceVertical = YES;
    collectionView.asyncDataSource = self;
    collectionView.asyncDelegate = self;
    [self.view addSubview:collectionView];
    _collectionView =collectionView;
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Red",@"Green",@"Blue"]];
    [segmentedControl setSelectedSegmentIndex:0];
    segmentedControl.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:segmentedControl];
    _segmentedControl = segmentedControl;
    
    [segmentedControl addTarget:self
                         action:@selector(actionSegmentedControlDidChange:)
               forControlEvents:UIControlEventValueChanged];
    
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:segmentedControl
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.view
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1.0f
                                                                      constant:28.0f];
    NSLayoutConstraint *centerConstraint = [NSLayoutConstraint constraintWithItem:segmentedControl
                                                                     attribute:NSLayoutAttributeCenterX
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.view
                                                                     attribute:NSLayoutAttributeCenterX
                                                                    multiplier:1.0f
                                                                      constant:0.0f];
    [self.view addConstraints:@[topConstraint, centerConstraint]];
}

#pragma mark - ASCollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 240;
}

- (ASCellNode*)collectionView:(ASCollectionView *)collectionView nodeForItemAtIndexPath:(NSIndexPath *)indexPath{
    ASCellNode *cellNode = nil;
    
    switch (_segmentedControl.selectedSegmentIndex) {
        case 0:
            cellNode = [[RedCell alloc] init];
            break;
        case 1:
            cellNode = [[GreenCell alloc] init];
            break;
        case 2:
            cellNode = [[BlueCell alloc] init];
            break;
        default:
            break;
    }
    
    return cellNode;
}

#pragma mark - Action

- (void)actionSegmentedControlDidChange:(id)sender{
    [_collectionView reloadData];
}

@end
