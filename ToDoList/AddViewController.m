//
//  AddViewController.m
//  ToDoList
//
//  Created by Abdelrahman Elaraby on 25/08/2025.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    _priority.selectedSegmentIndex = UISegmentedControlNoSegment;
}
- (IBAction)priortySelect:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
            case 0:
                _image = @"h";
            sender.selectedSegmentTintColor = [UIColor colorWithCIColor:[CIColor yellowColor]];
                break;
            case 1:
                _image = @"m";
            sender.selectedSegmentTintColor = [UIColor colorWithCIColor:[CIColor magentaColor]];
                break;
            case 2:
                _image = @"l";
            sender.selectedSegmentTintColor = [UIColor colorWithCIColor:[CIColor blueColor]];
                break;
            default:
                break;
        }
}
- (IBAction)saveBtn:(id)sender {
    Task *tas = [Task new];
    tas.name = _taskNameTF.text;
    tas.desc = _taskDescTV.text;
    tas.image = _image;
    [self.del sendTask:tas];
    [self.navigationController popViewControllerAnimated:YES];
}




@end
