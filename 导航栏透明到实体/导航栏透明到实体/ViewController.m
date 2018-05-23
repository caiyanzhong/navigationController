//
//  ViewController.m
//  导航栏透明到实体
//
//  Created by MacBook Air on 2018/5/23.
//  Copyright © 2018年 CYZ. All rights reserved.
//

#import "ViewController.h"
#import "ORImage.h"
#import "ORColorUtil.h"

@interface ViewController ()
//记录当前的滚动位置
@property (assign, nonatomic) CGFloat offset;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topForTableView;

@end
#define KIsiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"111111111";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor grayColor]}];
    
    
    //还有一点小问题   关于scrollView.contentOffset.y的初始位置  一开始滚动为-88/-64
    
    if (KIsiPhoneX) {
        self.topForTableView.constant = -88;
    } else {
        self.topForTableView.constant = -64;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"===%f",self.offset);
    if (KIsiPhoneX) {
        self.offset = scrollView.contentOffset.y;
        [self.navigationController.navigationBar setBackgroundImage:[ORImage imageWithColor:[UIColor colorFromString:@"EB1212" alpha:(self.offset / 88)>0.99?0.99:(self.offset / 88)]] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
        
    } else {
        self.offset = scrollView.contentOffset.y;//38,137,247
        [self.navigationController.navigationBar setBackgroundImage:[ORImage imageWithColor:[UIColor colorFromString:@"EB1212" alpha:(self.offset / 64)>0.99?0.99:(self.offset / 64)]] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    }
}


- (void) viewWillAppear:(BOOL)animated
{
    NSLog(@"第一次 %f",self.offset);

    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    if (KIsiPhoneX) {
        [self.navigationController.navigationBar setBackgroundImage:[ORImage imageWithColor:[UIColor colorFromString:@"EB1212" alpha:(self.offset / 88)>0.99?0.99:(self.offset / 88)]] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
        
    } else {
        [self.navigationController.navigationBar setBackgroundImage:[ORImage imageWithColor:[UIColor colorFromString:@"EB1212" alpha:(self.offset / 64)>0.99?0.99:(self.offset / 64)]] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    }
    
}

- (void) viewWillDisappear:(BOOL)animated
{
    NSLog(@"第二次 %f",self.offset);

    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

#pragma mark - UITableViewDelegate/UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}


@end
