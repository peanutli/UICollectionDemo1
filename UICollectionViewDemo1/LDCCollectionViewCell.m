//
//  CollectionViewCell.m
//  UICollectionViewDemo1
//
//  Created by 花生 on 16/3/29.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "LDCCollectionViewCell.h"

@interface LDCCollectionViewCell()

@property (nonatomic,strong) UIImageView * ldcCellImageView;
@property (nonatomic,strong) UILabel * ldcLabel;

@end


@implementation LDCCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        //_ldcCellImageView = [[UIImageView alloc]initWithFrame:self.contentView.frame];
        _ldcCellImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self.contentView addSubview:_ldcCellImageView];
        self.contentView.backgroundColor = [UIColor orangeColor];
        
        _ldcLabel = [[UILabel alloc]initWithFrame:self.contentView.frame];
        [self.contentView addSubview:_ldcLabel];
    }
    return self;
}

- (void)setModel:(LDCCollectionModel *)model {
    _ldcCellImageView.image = [UIImage imageNamed:model.ldcImageName];
    _ldcLabel.text = model.ldcImageName;
}

@end
