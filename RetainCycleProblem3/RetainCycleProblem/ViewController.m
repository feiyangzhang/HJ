//
//  ViewController.m
//  RetainCycleProblem
//
//  Created by Leon on 15/9/22.
//  Copyright (c) 2015年 Feiyang. All rights reserved.
//

#import "ViewController.h"
#import "HJTestCell.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *nameArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.nameArray = @[@"AA", @"BB", @"CC", @"DD", @"EE"];
}

#pragma mark --UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.nameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"HJTestCell";
    HJTestCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.nameLabel.text = self.nameArray[indexPath.row];
    /* 这里如果block里面直接用self的话会引起循环引用
     因为cell默认是strong的，进入block后self的retaincount会被加1 block又被cell copy到堆上就会引起循环引用， ViewController 和 Cell相互持有,导致双方都无法释放
     用来weak来声明 Self的retaincount在block内部不变
    */
    __weak typeof(self) weakSelf = self;
    [cell setTouchBlock:^(HJTestCell *cell) {
        [weakSelf refreshData];
    }];
    return cell;
}

- (void)refreshData
{
    NSLog(@"%s", __func__);
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
