//
//  TimerTableViewCell.m
//  ZXLGCDTimerDome
//
//  Created by 张小龙 on 2018/8/15.
//  Copyright © 2018年 张小龙. All rights reserved.
//

#import "TimerTableViewCell.h"
#import "ZXLGCDTimer.h"
@implementation TimerTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [ZXLGCDTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(changeText) userInfo:0 repeats:YES];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)changeText{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    self.textLabel.text = [fmt stringFromDate:[NSDate date]];
}

-(void)dealloc{
    
}
@end
