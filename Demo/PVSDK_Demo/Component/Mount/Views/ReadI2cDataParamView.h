//
//  ReadI2cDataParamView.h
//  PVSDK_Demo
//
//  Copyright © 2017 Layne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReadI2cDataParamView : UIView

@property (weak, nonatomic) IBOutlet UITextField *ramAddrTextField;
@property (weak, nonatomic) IBOutlet UITextField *addrTypeTextField;
@property (weak, nonatomic) IBOutlet UITextField *dataNumberTextField;

@end
