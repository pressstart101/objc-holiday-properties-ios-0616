//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //@property (strong, nonatomic) NSDictionary *database;

    
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    NSArray *holidays;
    holidays = self.database[season];
    return holidays;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    NSArray *supplies;
    supplies = self.database[season][holiday];
    return supplies;
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    if ([[self.database[season]allKeys]containsObject:holiday]){
        return YES;
    }
    return NO;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    if([self.database[season][holiday]containsObject:supply]){
        return YES;
    }
    return NO;
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    self.database[season][holiday] = @[];
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    [self.database[season][holiday]addObject:supply];
    // no return
}

@end
