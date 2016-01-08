//
//  DatePickVC.m
//  TheTendDaysDemo2
//
//  Created by student on 15-10-12.
//  Copyright (c) 2015年 student. All rights reserved.
//

#import "DatePickVC.h"

@interface DatePickVC ()
@property (nonatomic,strong) UIDatePicker *picker;
@property (nonatomic,strong) UILabel *lblShowTime;
@end

@implementation DatePickVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.picker =[[UIDatePicker alloc] initWithFrame:CGRectMake(0, 200, 320, 200)];
        self.lblShowTime=[[UILabel alloc] initWithFrame:CGRectMake(0, 40, 320, 100)];
        
        self.lblShowTime.textColor=[UIColor redColor];
        
        
        [self.view addSubview:self.picker];
        [self.view addSubview:self.lblShowTime];
        
    }
    return self;
}

-(void)showTime
{
   // self.lblShowTime.text=[NSString stringWithFormat:@"%@", self.picker.date];
    NSLog(@"data:%@",self.picker.date);
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    formatter.timeStyle=NSDateFormatterFullStyle;
    self.lblShowTime.text=[formatter stringFromDate:self.picker.date];  //这样子是不会显示的，需要设置格式转换器的样式(timeStyle)
    
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self.picker addTarget:self action:@selector(showTime) forControlEvents:UIControlEventValueChanged];
//    NSArray *a=[NSArray arrayWithObjects:@"zhangjiajie",@"jishou",@"changsha", nil];
//    NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:a,@"湖南", nil];
//    NSLog(@"dict=%@",dict);
//    NSArray* a1=[dict objectForKey:@"湖南"];
//    NSLog(@"a1=%@",a1);
    
    [self showTime];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
