//
//  DoneViewController.m
//  ToDoList
//
//  Created by Abdelrahman Elaraby on 25/08/2025.
//

#import "DoneViewController.h"

@interface DoneViewController ()

@end

@implementation DoneViewController
- (void)saveArray:(NSMutableArray<Task *> *)array withKey:(NSString *)key {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:array
                                        requiringSecureCoding:YES
                                                        error:nil];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
}

- (NSMutableArray<Task *> *)loadArrayForKey:(NSString *)key {
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if (data) {
        NSArray *savedArray = [NSKeyedUnarchiver unarchivedObjectOfClasses:
                               [NSSet setWithObjects:[NSArray class], [Task class], nil]
                               fromData:data error:nil];
        return [savedArray mutableCopy];
    }
    return [NSMutableArray new];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.done = [self loadArrayForKey:@"done"];
        if (!self.done) self.done = [NSMutableArray new];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.done = [self loadArrayForKey:@"done"];
    [self.tableView reloadData];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _done.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Task *t = self.done[indexPath.row];
    cell.textLabel.text = t.name;
    cell.imageView.image = [UIImage imageNamed:t.image];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ViewController *edit = [self.storyboard instantiateViewControllerWithIdentifier: @"ViewController"];
    edit.t = _done[indexPath.row];
    [self.tableView reloadData];
    [self.navigationController pushViewController:edit animated:YES];
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
 forRowAtIndexPath:(NSIndexPath *)indexPath {

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_done removeObjectAtIndex:indexPath.row];

        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_done
                                             requiringSecureCoding:YES
                                                             error:nil];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"done"];

        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    [self.tableView reloadData];
}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    Task *selectedTask = self.progress[indexPath.row];
//        
//
//        NSMutableArray *done = [self loadArrayForKey:@"done"];
//        if (!done) done = [NSMutableArray new];
//        
//        [done addObject:selectedTask];
//        [self.progress removeObjectAtIndex:indexPath.row];
//        
//        [self saveArray:self.progress withKey:@"progress"];
//        [self saveArray:done withKey:@"done"];
//        
//        [self.tableView reloadData];
//}

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
