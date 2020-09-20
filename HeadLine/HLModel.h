//
//  HLModel.h
//  HeadLine
//
//  Created by 徐佳鹏 on 2020/9/19.
//  Copyright © 2020 shelby. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HLModel : NSObject


@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *digest;
@property (nonatomic, copy) NSString *imgsrc;
@property (nonatomic, copy) NSArray *extrsImg;
//1 小图  10 大图 3 三图  0无图
@property (nonatomic, copy) NSNumber *imageType;



@end

NS_ASSUME_NONNULL_END
