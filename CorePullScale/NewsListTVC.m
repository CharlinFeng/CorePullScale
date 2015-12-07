//
//  ViewController.m
//  CorePullScale
//
//  Created by 沐汐 on 15-2-23.
//  Copyright (c) 2015年 沐汐. All rights reserved.
//

#import "NewsListTVC.h"
#import "UIScrollView+PullScale.h"

@interface NewsListTVC ()

@end

@implementation NewsListTVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
   
    [self.tableView addPullScaleFuncInVC:self originalHeight:150 hasNavBar:(self.navigationController!=nil)];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.tableView.imageV.image = [UIImage imageNamed:@"car@2x.jpg"];
    });
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *rid=@"rid";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
    
    if(cell==nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    
    cell.textLabel.text=[NSString stringWithFormat:@"这是第%li行",indexPath.row];
    
    return cell;
}



@end
