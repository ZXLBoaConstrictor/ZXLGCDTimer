//
//  ViewController.m
//  ZXLGCDTimerDome
//
//  Created by 张小龙 on 2018/8/15.
//  Copyright © 2018年 张小龙. All rights reserved.
//

#import "ViewController.h"
#import "TimerTableViewCell.h"
#import "ZXLGCDTimer.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * tableView;
@end

@implementation ViewController

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
        [_tableView registerClass:[TimerTableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self.tableView reloadData];
    //为了测试界面释放定时器会停止
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(20 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self changeCellCount];
        });
        
    });
//    //正常使用
    [ZXLGCDTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(print) userInfo:0 repeats:YES];
//
//    //异步使用
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [ZXLGCDTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(print2) userInfo:0 repeats:YES];
//    });
//
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)changeCellCount{
    [self.tableView removeFromSuperview];
    _tableView = nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)print{
    static int i = 0;
    NSLog(@"%@---%@",[NSThread currentThread], @(i++).stringValue);
}

-(void)print2{
    static int i = 0;
    NSLog(@"%@---%@",[NSThread currentThread], @(i++).stringValue);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIdentifier = @"UITableViewCell";
    TimerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    return cell;
}

@end
