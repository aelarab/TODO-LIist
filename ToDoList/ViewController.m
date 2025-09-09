//
//  ViewController.m
//  ToDoList
//
//  Created by Abdelrahman Elaraby on 25/08/2025.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
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
    
    _viewName.enabled = NO;
    _viewDesc.editable = NO;
    _priority.enabled = NO;
    
    _viewName.text = _t.name;
    _viewDesc.text = _t.desc;
    
    if([_t.image isEqualToString:@"h"]){
        _priority.selectedSegmentTintColor = [UIColor colorWithCIColor:[CIColor yellowColor]];
        _priority.selectedSegmentIndex = 0 ;
        _image = @"h";
    }
    if([_t.image isEqualToString:@"m"]){
        _priority.selectedSegmentTintColor = [UIColor colorWithCIColor:[CIColor magentaColor]];
        _priority.selectedSegmentIndex = 1 ;
        _image = @"m";
    }
    if([_t.image isEqualToString:@"l"]){
        _priority.selectedSegmentTintColor = [UIColor colorWithCIColor:[CIColor blueColor]];
        _priority.selectedSegmentIndex = 2 ;
        _image = @"l";
    }
    
}
- (IBAction)ableBtn:(id)sender {
    _viewName.enabled = YES;
    _viewDesc.editable = YES;
    _priority.enabled = YES;
}

- (IBAction)viewPriorty:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
            case 0:
                _image = @"h" ;
            sender.selectedSegmentTintColor = [UIColor colorWithCIColor:[CIColor yellowColor]];
                break;
            case 1:
                _image = @"m" ;
            sender.selectedSegmentTintColor = [UIColor colorWithCIColor:[CIColor magentaColor]];
                break;
            case 2:
                _image = @"l" ;
            sender.selectedSegmentTintColor = [UIColor colorWithCIColor:[CIColor blueColor]];
                break;
            default:
                break;
        }
}
- (IBAction)editBtn:(id)sender {
       self.t.name  = self.viewName.text;
        self.t.desc = self.viewDesc.text;
        self.t.image = self.image;
        
        NSMutableArray *tasks = [self loadArrayForKey:@"tasks"];
        NSMutableArray *progress = [self loadArrayForKey:@"progress"];
        NSMutableArray *done = [self loadArrayForKey:@"done"];
        if (!tasks) tasks = [NSMutableArray new];
        if (!progress) progress = [NSMutableArray new];
        if (!done) done = [NSMutableArray new];
        
    [tasks removeObject:_t];
    [progress removeObject:_t];
    [done removeObject:_t];
//    NSString *tid = self.t.taskId;
//        BOOL (^sameId)(Task *) = ^BOOL(Task *x){ return [x.taskId isEqualToString:tid]; };
//
//        [tasks filterUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(Task *obj, NSDictionary *_) {
//            return !sameId(obj);
//        }]];
//        [progress filterUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(Task *obj, NSDictionary *_) {
//            return !sameId(obj);
//        }]];
//        [done filterUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(Task *obj, NSDictionary *_) {
//            return !sameId(obj);
//        }]];
        
        switch (self.status.selectedSegmentIndex) {
            case 0:
                [tasks addObject:self.t];
                [self saveArray:tasks withKey:@"tasks"];
                break;
            case 1:
                [progress addObject:self.t];
                [self saveArray:progress withKey:@"progress"];
                break;
            case 2:
                [done addObject:self.t];
                [self saveArray:done withKey:@"done"];
                break;
        }
        
        [self.navigationController popViewControllerAnimated:YES];
    }
- (IBAction)statusSB:(id)sender {
    
}


@end
