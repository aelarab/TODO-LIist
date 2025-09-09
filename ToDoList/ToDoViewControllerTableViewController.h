//
//  ToDoViewControllerTableViewController.h
//  ToDoList
//
//  Created by Abdelrahman Elaraby on 25/08/2025.
//

#import <UIKit/UIKit.h>
#import "AddViewController.h"
#import "Task.h"
#import "TaskProtocol.h"
#import "ViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface ToDoViewControllerTableViewController : UITableViewController <TaskProtocol>
@property NSMutableArray <Task*> *tasks ;
@end

NS_ASSUME_NONNULL_END
