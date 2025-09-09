//
//  Task.h
//  ToDoList
//
//  Created by Abdelrahman Elaraby on 25/08/2025.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Task : NSObject <NSSecureCoding>
@property NSString *taskId;
@property NSString *name, *desc, *image;
- (instancetype)initWithName:(NSString*)n desc:(NSString*)d;
@end

NS_ASSUME_NONNULL_END
