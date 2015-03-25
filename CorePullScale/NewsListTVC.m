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
   
    [self.tableView addPullScaleFuncInVC:self imgName:@"car@2x.jpg" originalHeight:150 hasNavBar:(self.navigationController!=nil)];
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
