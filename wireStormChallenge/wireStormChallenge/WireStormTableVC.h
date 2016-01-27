//
//  WireStormTableVC.h
//  wireStormChallenge
//
//  Created by rtb on 1/26/16.
//  Copyright © 2016 Randall Bowles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WireStormTableVC : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *objectArray;
@property (nonatomic, strong) NSMutableData *retrievedData;

@end
