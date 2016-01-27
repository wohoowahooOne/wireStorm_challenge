//
//  WireStormTableVC.m
//  wireStormChallenge
//
//  Created by rtb on 1/26/16.
//  Copyright © 2016 Randall Bowles. All rights reserved.
//

#import "WireStormTableVC.h"


#define URL @"https://s3-us-west-2.amazonaws.com/wirestorm/assets/response.json"


@implementation WireStormTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getItems];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getItems
{
    // Retrieve JSON data from teh URL
    NSString *urlString = [NSString stringWithFormat:URL];
    __block NSData *retrievedData;

    NSURLSession *WSSession = [NSURLSession sharedSession];
    [[WSSession dataTaskWithURL:[NSURL URLWithString:urlString]
                completionHandler:^(NSData *WSData,
                                    NSURLResponse *response,
                                    NSError *error) {
                    if([WSData length] > 0 && error == nil){
                       NSString *html = [[NSString alloc] initWithData:WSData encoding:NSUTF8StringEncoding];
                       NSLog(@"Data = %@", html);
                       NSData *retrievedData = [[NSData alloc] initWithData:WSData];
 
                    }
                    else if([WSData length] == 0 && error == nil){
                        NSLog(@"Nothing was downloaded");
                    }
                    else if(error != nil){
                        NSLog(@"Error happened = %@", error);
                    }
                }]
         
         resume];
    NSString *htmlNEW = [[NSString alloc] initWithData:_retrievedData encoding:NSUTF8StringEncoding];
    NSLog(@"RetrievedData = %@", htmlNEW);
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
// #warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
