//
//  InProgressViewController.h
//  ToDoList
//
//  Created by Abdelrahman Elaraby on 25/08/2025.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "ViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface InProgressViewController : UITableViewController
@property NSMutableArray<Task *> *progress;
@end

NS_ASSUME_NONNULL_END
