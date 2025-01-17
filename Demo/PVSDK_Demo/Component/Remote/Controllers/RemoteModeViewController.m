//
//  RemoteModeViewController.m
//  PVSDK_Demo
//
//  Copyright © 2017 PowerVision. All rights reserved.
//

#import "RemoteModeViewController.h"

@interface RemoteModeViewController ()
<
UITableViewDelegate,UITableViewDataSource
>
@property (weak, nonatomic) IBOutlet UITableView *listView;
@property (nonatomic, strong) PVFlightRemote *flightRemote;
@property (nonatomic, copy) NSArray *items;

@end

@implementation RemoteModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self configManager];
}

- (void)initData{
    self.items = @[@"The American hand",@"The Japanese hand"];
}
- (void)configManager{
    self.flightRemote = [ComponentHelper fetchFlightRemote];
}

//  TODO: [Command] Set up the remote control mode
- (void)setEyeRemoteModeWithRemoteMode:(PVFlightRemoteMode)mode
{
    WEAKSELF;
    [self.flightRemote setRemoteMode:mode withCompletion:^(NSError * _Nullable error) {
        STRONGSELF;
        if (error == nil) {
            [strongSelf.navigationController popViewControllerAnimated:YES];
        }
    }];
}


#pragma mark - UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.items[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //  Set up the remote control mode
    if (indexPath.row == 0) {
        [self setEyeRemoteModeWithRemoteMode:PVFlightRemoteModeUSA];
    }else{
        [self setEyeRemoteModeWithRemoteMode:PVFlightRemoteModeJapan];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
