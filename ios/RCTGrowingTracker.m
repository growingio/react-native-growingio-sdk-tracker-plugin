#import "RCTGrowingTracker.h"
#import <objc/message.h>

@implementation RCTGrowingTracker

RCT_EXPORT_MODULE()

static NSString* const GrowingRealTrackerClassName = @"GrowingRealTracker";
static NSString* const GrowingTrackerClassName = @"GrowingTracker";

static id getGrowingTracker(SEL selector)
{
    Class realClazz = NSClassFromString(GrowingRealTrackerClassName);
    BOOL realResponds = [realClazz instancesRespondToSelector:selector];
    Class clazz = NSClassFromString(GrowingTrackerClassName);
    realResponds |= [clazz instancesRespondToSelector:selector];
    BOOL responds = [clazz respondsToSelector:@selector(sharedInstance)];
    if (!realClazz || !realResponds || !clazz || !responds) {
        NSLog(@"RNGrowingTouch do not found GrowingTracker or GrowingRealTracker");
        return nil;
    }
    return [clazz performSelector:@selector(sharedInstance)];
}

// Example method
// See // https://reactnative.dev/docs/native-modules-ios
RCT_REMAP_METHOD(multiply,
                 multiplyWithA:(nonnull NSNumber*)a withB:(nonnull NSNumber*)b
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
{
  NSNumber *result = @([a floatValue] * [b floatValue]);

  resolve(result);
}

RCT_REMAP_METHOD(trackCustomEvent,
                  trackCustomEvent:(NSString *)eventName withAttributes:(NSDictionary *)attributes itemKey:(NSString *)itemKey itemId:(NSString *)itemId)
{
    if (attributes != nil && itemKey != nil && itemId != nil) {
        SEL method = @selector(trackCustomEvent:itemKey:itemId:withAttributes:);
        id growingTracker = getGrowingTracker(method);
        if (growingTracker != nil) {
            ((void (*) (id, SEL, NSString *, NSString *, NSString *, NSDictionary *)) objc_msgSend) (growingTracker, method, eventName, itemKey, itemId, attributes);
        }
        return;
    }
    if (attributes != nil) {
        SEL method = @selector(trackCustomEvent:withAttributes:);
        id growingTracker = getGrowingTracker(method);
        if (growingTracker != nil) {
            [growingTracker performSelector:method withObject:eventName withObject:attributes];
        }
        return;
    }
    if (itemKey != nil && itemId != nil) {
        SEL method = @selector(trackCustomEvent:itemKey:itemId:);
        id growingTracker = getGrowingTracker(method);
        if (growingTracker != nil) {
            ((void (*) (id, SEL, NSString *, NSString *, NSString *)) objc_msgSend) (growingTracker, method, eventName, itemKey, itemId);
        }
        return;
    }
    SEL method = @selector(trackCustomEvent:);
    id growingTracker = getGrowingTracker(method);
    if (growingTracker != nil) {
        [growingTracker performSelector:method withObject:eventName];
    }
}

RCT_REMAP_METHOD(setLoginUserAttributes,
                 setLoginUserAttributes:(NSDictionary*)attributes)
{
    SEL method = @selector(setLoginUserAttributes:);
    id growingTracker = getGrowingTracker(method);
    if (growingTracker != nil) {
        [growingTracker performSelector:method withObject:attributes];
    }
}

RCT_REMAP_METHOD(setLoginUserId,
                 setLoginUserId:(NSString *)userId)
{
    SEL method = @selector(setLoginUserId:);
    id growingTracker = getGrowingTracker(method);
    if (growingTracker != nil) {
        [growingTracker performSelector:method withObject:userId];
    }
}

RCT_REMAP_METHOD(cleanLoginUserId,
                 cleanLoginUserId)
{
    SEL method = @selector(cleanLoginUserId);
    id growingTracker = getGrowingTracker(method);
    if (growingTracker != nil) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [growingTracker performSelector:method];
        });
    }
}

RCT_REMAP_METHOD(setLocation,
                 setLocation:(double)latitude longitude:(double)longitude)
{
    SEL method = @selector(setLocation:longitude:);
    id growingTracker = getGrowingTracker(method);
    if (growingTracker != nil) {
//        NSMethodSignature* signature = [ NSClassFromString(GrowingRealTrackerClassName) instanceMethodSignatureForSelector:method];
//        NSInvocation* invocation = [NSInvocation invocationWithMethodSignature: signature];
//        [invocation setTarget:growingTracker];
//        [invocation setSelector:method];
//        [invocation setArgument:&latitude atIndex:2];
//        [invocation setArgument:&longitude atIndex:3];
//        [invocation invoke];
        [growingTracker performSelector:method withObject:[NSNumber numberWithDouble:latitude] withObject:[NSNumber numberWithDouble:longitude]];
    }
}

RCT_REMAP_METHOD(cleanLocation,
                 cleanLocation)
{
    SEL method = @selector(cleanLocation);
    id growingTracker = getGrowingTracker(method);
    if (growingTracker != nil) {
        [growingTracker performSelector:method];
    }
}

RCT_REMAP_METHOD(setDataCollectionEnabled,
                 setDataCollectionEnabled:(BOOL)enabled)
{
    SEL method = @selector(setDataCollectionEnabled:);
    id growingTracker = getGrowingTracker(method);
    if (growingTracker != nil) {
//        NSMethodSignature* signature = [ NSClassFromString(GrowingRealTrackerClassName) instanceMethodSignatureForSelector:method];
//        NSInvocation* invocation = [NSInvocation invocationWithMethodSignature: signature];
//        [invocation setTarget:growingTracker];
//        [invocation setSelector:method];
//        [invocation setArgument:&enabled atIndex:2];
//        [invocation invoke];
        [growingTracker performSelector:method withObject:(__bridge id)(void * )enabled];
    }
}

RCT_REMAP_METHOD(getDeviceId,
                 getDeviceIdwithResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
{
    SEL method = @selector(getDeviceId);
    id growingTracker = getGrowingTracker(method);
    if (growingTracker != nil) {
        NSString* deviceId = [growingTracker performSelector:method];
        resolve(deviceId);
    }
}

@end
