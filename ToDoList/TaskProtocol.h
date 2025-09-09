//
//  TaskProtocol.h
//  ToDoList
//
//  Created by Abdelrahman Elaraby on 25/08/2025.
//

#import <Foundation/Foundation.h>
#import "Task.h"
NS_ASSUME_NONNULL_BEGIN

@protocol TaskProtocol <NSObject>

- (void)sendTask:(Task*)task;

@end

NS_ASSUME_NONNULL_END
