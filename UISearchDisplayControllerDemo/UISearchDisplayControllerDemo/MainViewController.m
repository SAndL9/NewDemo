//
//  MainViewController.m
//  UISearchDisplayControllerDemo
//
//  Created by Enwaysoft on 14-8-20.
//  Copyright (c) 2014年 Enway. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate> {
    NSArray *array;
    NSArray *dataArray;
    UISearchBar *searchBar;
    UISearchDisplayController *searchDisplayController;
}
@end

@implementation MainViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"搜索Demo";
    
    array = [NSArray arrayWithObjects:@"Aaaa",@"Abbb",@"Accc",@"Bddd",@"Beee",@"Bfff",@"Jkkk",@"Ekljljfg" ,@"Lsgfdf",@"Maaaa",@"Mfgxvc",@"Meihi",@"Casdgs",@"Awaert", nil];
    
    //初始化一个searchBar
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    searchBar.placeholder = @"搜索";
    
    //设置为自身表头
    self.tableView.tableHeaderView = searchBar;
    
    //显示ScopeBar
//    [searchBar setShowsScopeBar:YES];
//    [searchBar setScopeButtonTitles:[NSArray arrayWithObjects:@"A", @"B", @"C", nil]];
//    searchBar.selectedScopeButtonIndex = 0;
//    
    // 用searchbar初始化SearchDisplayController
    // 并把searchDisplayController和当前controller 关联起来
    searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    
    // searchResultsDataSource 是 UITableViewDataSource
    searchDisplayController.searchResultsDataSource = self;
    // searchResultsDelegate 是 UITableViewDelegate
    searchDisplayController.searchResultsDelegate = self;
}


#pragma mark - TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.tableView) {
        return array.count;
    }else{
        // 谓词搜索, 检查的对象是否保存输入的文本
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self contains [cd] %@",searchDisplayController.searchBar.text];
        dataArray =  [[NSArray alloc] initWithArray:[array filteredArrayUsingPredicate:predicate]];
        return dataArray.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    //给cell的text赋值
    if (tableView == self.tableView) {
        cell.textLabel.text = array[indexPath.row];
    }else{
        //判断当前scope的index是多少,并可设置显示不同的数据
        if (searchBar.selectedScopeButtonIndex == 1) {
            cell.textLabel.text = @"1``111";
        } else {
        cell.textLabel.text = dataArray[indexPath.row];
        }
    }
    return cell;
}

//点击搜索结果的cell, 返回列表页面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == searchDisplayController.searchResultsTableView) {
        [searchDisplayController setActive:NO animated:YES];
        
    }
}


@end
