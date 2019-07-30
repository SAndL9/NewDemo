//
//  ViewController.m
//  tableview表头自适应
//
//  Created by LiLei on 30/7/2019.
//  Copyright © 2019 李磊. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UILabel *contentLabel;
@end

@implementation ViewController


#pragma mark-
#pragma mark- View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubviewsContraints];
    self.tableView.tableHeaderView = self.headerView;
    _contentLabel.text = @"背qweqweqweqweq景西甲打卡闾丘露薇阿斯加德啊就是大群翁二七螺纹孔爱神的箭看齐文龙请问目前爱豆世纪甲打卡闾丘露薇阿斯加德啊就是大群翁二七螺纹孔爱神的箭看齐文龙请问目前爱豆世纪看全文噢请问你问哦我去饿哦我企鹅去了五年级爱神的箭卡上动脑筋请勿加恩看全文噢请问你问哦我去饿哦我企鹅去了五年级爱神的箭卡上动脑筋请勿加恩情我";
    CGFloat height = [self.headerView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    
    CGRect frame = self.headerView.bounds;
    frame.size.height = height;
    self.headerView.frame = frame;
//    self.tableView.tableHeaderView = self.headerView;
    [self.tableView.tableHeaderView setNeedsLayout];
    [self.tableView.tableHeaderView layoutIfNeeded];
}
#pragma mark-
#pragma mark- Request


#pragma mark-
#pragma mark- SANetworkResponseProtocol


#pragma mark-
#pragma mark- <#代理类名#> delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [[UITableViewCell alloc]init];
}
#pragma mark-
#pragma mark- Event response

#pragma mark-
#pragma mark- Private Methods

#pragma mark-
#pragma mark- Getters && Setters

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
    }
    return _tableView;
}

- (UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]init];
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.numberOfLines = 0;
        [_headerView addSubview:_contentLabel];
        [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        }];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self->_headerView);
        }];
    }
    return _headerView;
}

#pragma mark-
#pragma mark- SetupConstraints
- (void)setupSubviewsContraints {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

@end
