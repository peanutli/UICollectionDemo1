//
//  ViewController.m
//  UICollectionViewDemo1
//
//  Created by 花生 on 16/3/29.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "ViewController.h"
#import "LDCCollectionViewCell.h"
#import "LDCCollectionModel.h"

static NSString * CellIndentifier = @"CellIndentifier";
#define  kScreenWidth ([UIScreen mainScreen].bounds.size.width)

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UICollectionView * ldcCollectionView;
@property (nonatomic,strong)NSMutableArray * ldcDataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake((kScreenWidth-30)/2, (kScreenWidth-30)/2 + 20);
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 10, 0);
//    layout.minimumLineSpacing = 1;
//    layout.minimumInteritemSpacing = 1;
    _ldcCollectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    [_ldcCollectionView registerClass:[LDCCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    _ldcCollectionView.delegate = self;
    _ldcCollectionView.dataSource = self;
    [self.view addSubview:_ldcCollectionView];
    
    //添加数据源
    _ldcDataSource = [[NSMutableArray alloc]init];
    for (NSInteger i = 1; i <=11; i++) {
         NSString * imageName = [NSString stringWithFormat:@"img%ld.jpg",(long)i];
        LDCCollectionModel * model = [[LDCCollectionModel alloc]init];
        model.ldcImageName = imageName;
        [_ldcDataSource addObject:model];
    }
    // Do any additional setup after loading the view, typically from a nib.
}



#pragma UICollectionViewDelegate&&UICollectionViewDataSource
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LDCCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    LDCCollectionModel * model = [_ldcDataSource objectAtIndex:indexPath.item];
    cell.model = model;
    return cell;
};

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _ldcDataSource.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
