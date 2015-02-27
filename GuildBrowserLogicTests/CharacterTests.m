//
//  CharacterTests.m
//  GuildBrowser
//
//  Created by Pranay Swar on 2/26/15.
//  Copyright (c) 2015 Charlie Fulton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Character.h"
#import "Item.h"
#import "Guild.h"

@interface CharacterTests : XCTestCase
{
    NSDictionary *_characterDetailJson;
    Character *_testGuy;
}

@end

@implementation CharacterTests

- (void)setUp {
    [super setUp];
    
    NSURL *dataServiceURL = [[NSBundle bundleForClass:self.class]
                             URLForResource:@"character" withExtension:@"json"];
    
    // 4
    NSData *sampleData = [NSData dataWithContentsOfURL:dataServiceURL];
    NSError *error;
    
    // 5
    id json = [NSJSONSerialization JSONObjectWithData:sampleData
                                              options:kNilOptions
                                                error:&error];
  

    XCTAssertNotNil(json, @"invalid test data");
    
    _characterDetailJson = json;
    
    _testGuy = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    _characterDetailJson = nil;

}


- (void)testCreateCharacterFromDetailJson
{
    // 2
    Character *testGuy1 = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];
    XCTAssertNotNil(testGuy1, @"Could not create character from detail json");
    
    // 3
    Character *testGuy2 = [[Character alloc] initWithCharacterDetailData:nil];
    XCTAssertNotNil(testGuy2, @"Could not create character from nil data");
}


-(void)testCreateCharacterFromDetailJsonProps
{
    XCTAssertEqual(_testGuy.thumbnail, @"borean-tundra/171/40508075-avatar.jpg", @"thumbnail url is wrong");
    XCTAssertEqual(_testGuy.name, @"Hagrel", @"name is wrong");
    XCTAssertEqual(_testGuy.battleGroup, @"Emberstorm", @"battlegroup is wrong");
    XCTAssertEqual(_testGuy.realm, @"Borean Tundra", @"realm is wrong");
    XCTAssertEqual(_testGuy.achievementPoints, @3130, @"achievement points is wrong");
    XCTAssertEqual(_testGuy.level,@85, @"level is wrong");
    
    XCTAssertEqual(_testGuy.classType, @"Warrior", @"class type is wrong");
    XCTAssertEqual(_testGuy.race, @"Human", @"race is wrong");
    XCTAssertEqual(_testGuy.gender, @"Male", @"gener is wrong");
    XCTAssertEqual(_testGuy.averageItemLevel, @379, @"avg item level is wrong");
    XCTAssertEqual(_testGuy.averageItemLevelEquipped, @355, @"avg item level is wrong");
}

// 2
-(void)testCreateCharacterFromDetailJsonValidateItems
{
    XCTAssertEqual(_testGuy.neckItem.name,@"Stoneheart Choker", @"name is wrong");
    XCTAssertEqual(_testGuy.wristItem.name,@"Vicious Pyrium Bracers", @"name is wrong");
    XCTAssertEqual(_testGuy.waistItem.name,@"Girdle of the Queen's Champion", @"name is wrong");
    XCTAssertEqual(_testGuy.handsItem.name,@"Time Strand Gauntlets", @"name is wrong");
    XCTAssertEqual(_testGuy.shoulderItem.name,@"Temporal Pauldrons", @"name is wrong");
    XCTAssertEqual(_testGuy.chestItem.name,@"Ruthless Gladiator's Plate Chestpiece", @"name is wrong");
    XCTAssertEqual(_testGuy.fingerItem1.name,@"Thrall's Gratitude", @"name is wrong");
    XCTAssertEqual(_testGuy.fingerItem2.name,@"Breathstealer Band", @"name is wrong");
    XCTAssertEqual(_testGuy.shirtItem.name,@"Black Swashbuckler's Shirt", @"name is wrong");
    XCTAssertEqual(_testGuy.tabardItem.name,@"Tabard of the Wildhammer Clan", @"nname is wrong");
    XCTAssertEqual(_testGuy.headItem.name,@"Vicious Pyrium Helm", @"neck name is wrong");
    XCTAssertEqual(_testGuy.backItem.name,@"Cloak of the Royal Protector", @"neck name is wrong");
    XCTAssertEqual(_testGuy.legsItem.name,@"Bloodhoof Legguards", @"neck name is wrong");
    XCTAssertEqual(_testGuy.feetItem.name,@"Treads of the Past", @"neck name is wrong");
    XCTAssertEqual(_testGuy.mainHandItem.name,@"Axe of the Tauren Chieftains", @"neck name is wrong");
    XCTAssertEqual(_testGuy.trinketItem1.name,@"Rosary of Light", @"neck name is wrong");
    XCTAssertEqual(_testGuy.trinketItem2.name,@"Bone-Link Fetish", @"neck name is wrong");
    XCTAssertEqual(_testGuy.rangedItem.name,@"Ironfeather Longbow", @"neck name is wrong");
}


@end
