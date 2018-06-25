//
//  ViewController.m
//  HelperDemo
//
//  Created by 林泽华 on 2018/6/25.
//  Copyright © 2018年 林泽华. All rights reserved.
//

#import "ViewController.h"

#import "HeaderHelper.h"
#import "ContentHelper.h"
#import "FooterHelper.h"

#import "HeaderHelper.h"
#import "ContentHelper.h"
#import "FooterHelper.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *headerCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *contentCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *footerCollectionView;

@property (nonatomic, strong) HeaderHelper *headerHelper;
@property (nonatomic, strong) ContentHelper *contentHelper;
@property (nonatomic, strong) FooterHelper *footerHelper;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.headerHelper = [HeaderHelper new];
    self.headerCollectionView.dataSource = self.headerHelper;
    self.headerCollectionView.delegate = self.headerHelper;
    
    self.contentHelper = [ContentHelper new];
    self.contentCollectionView.dataSource = self.contentHelper;
    self.contentCollectionView.delegate = self.contentHelper;
    
    self.footerHelper = [FooterHelper new];
    self.footerCollectionView.dataSource = self.footerHelper;
    self.footerCollectionView.delegate = self.footerHelper;
}


@end
