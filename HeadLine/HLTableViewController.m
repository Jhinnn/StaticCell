//
//  HLTableViewController.m
//  HeadLine
//
//  Created by 徐佳鹏 on 2020/9/19.
//  Copyright © 2020 shelby. All rights reserved.
//

#import "HLTableViewController.h"
#import "HLTableViewCell.h"
#import "HLDataRequest.h"
#import "YYModel.h"
#import "HLModel.h"
@interface HLTableViewController ()

@property (nonatomic, strong) NSMutableArray *news;

@end

@implementation HLTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSLog(@"%@",[self readLocalFileWithName:@"News"]);
    
    self.news =  [self readLocalFileWithName:@"News"].copy;

//    [[HLDataRequest sharedInstace] post:@"T1467284926140/0-20.html" parameters:@{} success:^(id  _Nonnull response) {
//        NSLog(@"%@",response);
//    } failure:^(NSError * _Nonnull error) {
//
//    }];
}


- (void)setNews:(NSMutableArray *)news {
    _news = news;
    [self.tableView reloadData];
}

// 读取本地JSON文件
- (NSArray *)readLocalFileWithName:(NSString *)name {
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    
    NSMutableArray *arrays = [NSMutableArray arrayWithCapacity:10];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSArray *datas = dict[@"datas"];
    for (NSDictionary *dict in datas) {
        HLModel *model = [HLModel yy_modelWithDictionary:dict];
        [arrays addObject:model];
    }
    return arrays;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.news.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HLModel *model = self.news[indexPath.row];
    HLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[HLTableViewCell getReusableCellId:model] forIndexPath:indexPath];
    cell.model = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    HLModel *model = self.news[indexPath.row];
    return [HLTableViewCell getRowHeight:model];
}



@end
