//
//  HLTableViewCell.m
//  HeadLine
//
//  Created by 徐佳鹏 on 2020/9/19.
//  Copyright © 2020 shelby. All rights reserved.
//

#import "HLTableViewCell.h"
#import "HLModel.h"
#import "UIImageView+WebCache.h"

@interface HLTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *contentLbl;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imageVS;

@end

@implementation HLTableViewCell

- (void)setModel:(HLModel *)model {
    _model = model;
    self.titleLbl.text = _model.title;
    self.contentLbl.text = _model.digest;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:_model.imgsrc]];
    
    [self.imageVS enumerateObjectsUsingBlock:^(UIImageView *imageV, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *imageUrl = _model.extrsImg[idx];
        [imageV sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    }];
    
}

//1 小图  10 大图 3 三图  0无图
+ (NSString *)getReusableCellId:(HLModel *)model {
    if ([model.imageType isEqualToNumber:@1]) {
        return @"sImageVCell";
    }else if ([model.imageType isEqualToNumber:@10]) {
        return @"bImageVCell";
    }else if (model.extrsImg) {
        return @"tImageVCell";
    }
    return @"textCell";
}

+ (CGFloat)getRowHeight:(HLModel *)model {
    if ([model.imageType isEqualToNumber:@1]) {
        return 120;
    }else if ([model.imageType isEqualToNumber:@10]) {
        return 300;
    }else if (model.extrsImg) {
        return 220;
    }
    return 120;
}

@end
