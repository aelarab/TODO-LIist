//
//  Task.m
//  ToDoList
//
//  Created by Abdelrahman Elaraby on 25/08/2025.
//

#import "Task.h"

@implementation Task
- (instancetype)init {
    if (self = [super init]) {
        _taskId = [NSUUID UUID].UUIDString;
    }
    return self;
}
- (instancetype)initWithName:(NSString *)n desc:(NSString *)d {
    if (self = [super init]) {
        _name = n;
        _desc = d;
    }
    return self;
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.taskId forKey:@"taskId"];
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.desc forKey:@"desc"];
    [coder encodeObject:self.image forKey:@"image"];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        _taskId = [coder decodeObjectOfClass:[NSString class] forKey:@"taskId"];
        if (!_taskId) _taskId = [NSUUID UUID].UUIDString;
        _name = [coder decodeObjectOfClass:[NSString class] forKey:@"name"];
        _desc = [coder decodeObjectOfClass:[NSString class] forKey:@"desc"];
        _image = [coder decodeObjectOfClass:[NSString class] forKey:@"image"];
    }
    return self;
}
@end
