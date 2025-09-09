//
//  ToDoViewControllerTableViewController.m
//  ToDoList
//
//  Created by Abdelrahman Elaraby on 25/08/2025.
//

#import "ToDoViewControllerTableViewController.h"

@interface ToDoViewControllerTableViewController ()

@end

@implementation ToDoViewControllerTableViewController
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
    self.navigationItem.title = @"TODO";
    _tasks = [self loadArrayForKey:@"tasks"];
    if (!_tasks) _tasks = [NSMutableArray new];
    UIBarButtonItem *addBtn =
          [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                        target:self
                                                        action:@selector(didTapAdd:)];
    UIBarButtonItem *reBtn =
          [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                        target:self
                                                        action:@selector(didTapRe:)];
        self.navigationItem.rightBarButtonItem = addBtn;
    self.navigationItem.leftBarButtonItem = reBtn;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
- (void)didTapRe:(UIBarButtonItem *)sender{
    [self.tableView reloadData];
}
- (void)didTapAdd:(UIBarButtonItem *)sender {
    AddViewController *add = [self.storyboard instantiateViewControllerWithIdentifier: @"AddViewController"];
    add.del = self; 
    [self.navigationController pushViewController:add animated:YES];
   
}
- (void)sendTask:(Task *)task {
    [self.tasks addObject:task];
    [self saveArray:_tasks withKey:@"tasks"];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _tasks.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = _tasks[indexPath.row].name;
    cell.imageView.image =  [UIImage imageNamed:_tasks[indexPath.row].image];
//    [self.tableView reloadData];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ViewController *edit = [self.storyboard instantiateViewControllerWithIdentifier: @"ViewController"];
    edit.t = _tasks[indexPath.row];
        [self.tableView reloadData];
    [self.navigationController pushViewController:edit animated:YES];
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
 forRowAtIndexPath:(NSIndexPath *)indexPath {

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_tasks removeObjectAtIndex:indexPath.row];

        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_tasks
                                             requiringSecureCoding:YES
                                                             error:nil];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"tasks"];

        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    [self.tableView reloadData];
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
