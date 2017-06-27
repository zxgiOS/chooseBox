//
//  ViewController.m
//  DropDown
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "DropTableViewCell.h"

static NSString *indentifier = @"dropDownCell";
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *dropDownBtn;

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic) BOOL showList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"1",@"2",@"3"];
    
    self.showList = NO;
    
    CGRect textFiledFram = self.dropDownBtn.frame;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(textFiledFram.origin.x, textFiledFram.origin.y+textFiledFram.size.height, textFiledFram.size.width, 100)];
    
    [self.view addSubview:_tableView];
    self.tableView.hidden = YES;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"DropTableViewCell" bundle:nil] forCellReuseIdentifier:indentifier];
}

- (IBAction)clickDropDoen:(UIButton *)sender {
    if (_showList) {
        return;
    }else{
        _tableView.hidden = NO;
        [self.dropDownBtn setBackgroundImage:[UIImage imageNamed:@"xia"] forState:UIControlStateNormal];
        _showList = YES;
    }

}

#pragma mark - tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DropTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil)
    {
        [tableView registerNib:[UINib nibWithNibName:@"DropTableViewCell" bundle:nil] forCellReuseIdentifier:indentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    }
    
    cell.titleLable.text = _dataArray[indexPath.row];
    cell.titleLable.font = [UIFont fontWithName:_dataArray[indexPath.row] size:20];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 35;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [_dropDownBtn setTitle:_dataArray[indexPath.row] forState:UIControlStateNormal];
    
    _showList = NO;
    [self.dropDownBtn setBackgroundImage:[UIImage imageNamed:@"shang"] forState:UIControlStateNormal];
    
    tableView.hidden = YES;
    
}


@end
