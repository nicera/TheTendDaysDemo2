//
//  PickerViewVC.m
//  TheTendDaysDemo2
//
//  Created by student on 15-10-12.
//  Copyright (c) 2015年 student. All rights reserved.
//

#import "PickerViewVC.h"

@interface PickerViewVC ()
@property (nonatomic,strong) UIPickerView *pickerView;
@property (nonatomic,strong) NSArray *datas;
@property (nonatomic,assign) int index;
@end

@implementation PickerViewVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.pickerView=[[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, 320, 300)];
        self.pickerView.delegate=self;
        self.pickerView.dataSource=self;
        [self.view addSubview:self.pickerView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *path=[[NSBundle mainBundle] pathForResource:@"citys.plist" ofType:nil];
    self.datas=[NSArray arrayWithContentsOfFile:path];
    self.index=0;
    
    
}
//返回齿轮的个数，也相当于列的个数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

//返回齿轮中显示的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component==0) {
        return [self.datas count];
    }
    return [[[self.datas objectAtIndex:self.index] objectForKey:@"citys"]count];
}

//返回每一行的标题
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component==0) {
        return [[self.datas objectAtIndex:row] objectForKey:@"province"];
    }
    return [[[self.datas objectAtIndex:self.index] objectForKey:@"citys"] objectAtIndex:row];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component==0) {
        self.index=row;
        //让第二个区域显示第一个区域对应的第一个内容
        [self.pickerView selectRow:0 inComponent:1 animated:YES];
    }
    [self.pickerView reloadComponent:1];
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
