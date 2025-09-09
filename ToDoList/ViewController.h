//
//  ViewController.h
//  ToDoList
//
//  Created by Abdelrahman Elaraby on 25/08/2025.
//

#import <UIKit/UIKit.h>
#import "Task.h"
@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *viewName;
@property (weak, nonatomic) IBOutlet UITextView *viewDesc;
@property (weak, nonatomic) IBOutlet UISegmentedControl *priority;
@property (weak, nonatomic) IBOutlet UISegmentedControl *status;

@property NSString* image;
@property Task* t;

@end

