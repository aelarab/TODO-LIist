//
//  AddViewController.h
//  ToDoList
//
//  Created by Abdelrahman Elaraby on 25/08/2025.
//

#import <UIKit/UIKit.h>
#import "TaskProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface AddViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *taskNameTF;
@property (weak, nonatomic) IBOutlet UITextView *taskDescTV;
@property (weak, nonatomic) IBOutlet UISegmentedControl *priority;
@property NSString* image;
@property id <TaskProtocol> del;
@end

NS_ASSUME_NONNULL_END
