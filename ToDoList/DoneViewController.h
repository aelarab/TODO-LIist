//
//  DoneViewController.h
//  ToDoList
//
//  Created by Abdelrahman Elaraby on 25/08/2025.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "ViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface DoneViewController : UITableViewController
@property NSMutableArray<Task *> *done;
@end

NS_ASSUME_NONNULL_END
