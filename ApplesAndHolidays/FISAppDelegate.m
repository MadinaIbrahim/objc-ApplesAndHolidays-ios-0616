//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

/**
 
 * Implement your methods here.
 
 */


-(NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    
    NSPredicate *appleStringOccurrencesInFruits = [NSPredicate predicateWithFormat:@"SELF contains[c]'apple'"];
    NSArray * allAppleStrings = [fruits filteredArrayUsingPredicate:appleStringOccurrencesInFruits];
    
    return allAppleStrings;
}


-(NSArray *)holidaysInSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database {
    
    NSArray *allHolidaysKeys = [database[season]allKeys];

    return allHolidaysKeys;
}


-(NSArray *)suppliesInHoliday:(NSString *)holiday
                     inSeason:(NSString *)season
                   inDatabase:(NSDictionary *)database {
    
    
    NSMutableArray *suppliesForHolidayAndSeason = [[NSMutableArray alloc]initWithArray:database[season][holiday] copyItems:YES];
    
    return suppliesForHolidayAndSeason;
}


-(BOOL)holiday:(NSString *)holiday IsInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    BOOL seasonHoliday = [[database[season]allKeys] containsObject:holiday];
    
    return seasonHoliday;
}


-(BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    BOOL supplyStringInSeasonInHoliday = [database[season][holiday]containsObject:supply];
    
    return supplyStringInSeasonInHoliday;
}


-(NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    NSMutableArray *newKeyValueHoliday = [[NSMutableArray alloc]init];
                                  
    [database[season] setValue:newKeyValueHoliday forKey:holiday];
    return database;
                                      
}

//addSupply:toHoliday:inSeason:inDatabase: to insert the submitted "supply" argument into the mutable array of the submitted "holiday" key in the sub-dictionary of the submitted "season" key.

-(NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    [database[season] setValue:supply forKey:holiday];
    return database;
}

@end