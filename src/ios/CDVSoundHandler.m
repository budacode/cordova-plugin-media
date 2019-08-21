//
//  CDVSoundHandler.m
//  Fitrádió
//
//

#import <Foundation/Foundation.h>
#import "CDVSound.h"
#import "CDVSoundHandler.h"

@implementation CDVSoundHandler

NSMutableDictionary *players = nil;

-(void) pluginInitialize{
    // pluginInitialize is being called for each player (CDVSound) right before create it
}

- (void)create:(CDVInvokedUrlCommand*)command
{
    CDVSound* player = [self getOrCreateAPlayer:command];
    if (player) {
        [player pluginInitialize];
        [player create:command];
    }
}

- (void)startPlayingAudio:(CDVInvokedUrlCommand*)command
{
    CDVSound* player = [self getOrCreateAPlayer:command];
    if (player) {
        [player startPlayingAudio:command];
    }
}

- (void)pausePlayingAudio:(CDVInvokedUrlCommand*)command
{
    CDVSound* player = [self getOrCreateAPlayer:command];
    if (player) {
        [player pausePlayingAudio:command];
    }
}

- (void)stopPlayingAudio:(CDVInvokedUrlCommand*)command
{
    CDVSound* player = [self getOrCreateAPlayer:command];
    if (player) {
        [player stopPlayingAudio:command];
    }
}

- (void)seekToAudio:(CDVInvokedUrlCommand*)command
{
    CDVSound* player = [self getOrCreateAPlayer:command];
    if (player) {
        [player seekToAudio:command];
    }
}

- (void)release:(CDVInvokedUrlCommand*)command
{
    CDVSound* player = [self getOrCreateAPlayer:command];
    if (player) {
        [players removeObjectForKey:command];
        [player release:command];
    }
}

- (void)getCurrentPositionAudio:(CDVInvokedUrlCommand*)command
{
    CDVSound* player = [self getOrCreateAPlayer:command];
    if (player) {
        [player getCurrentPositionAudio:command];
    }
}

- (void)resumeRecordingAudio:(CDVInvokedUrlCommand*)command
{
    CDVSound* player = [self getOrCreateAPlayer:command];
    if (player) {
        [player resumeRecordingAudio:command];
    }
}

- (void)pauseRecordingAudio:(CDVInvokedUrlCommand*)command
{
    CDVSound* player = [self getOrCreateAPlayer:command];
    if (player) {
        [player pauseRecordingAudio:command];
    }
}

- (void)startRecordingAudio:(CDVInvokedUrlCommand*)command
{
    CDVSound* player = [self getOrCreateAPlayer:command];
    if (player) {
        [player startRecordingAudio:command];
    }
}

- (void)stopRecordingAudio:(CDVInvokedUrlCommand*)command
{
    CDVSound* player = [self getOrCreateAPlayer:command];
    if (player) {
        [player stopRecordingAudio:command];
    }
}

- (void)getCurrentAmplitudeAudio:(CDVInvokedUrlCommand*)command
{
    CDVSound* player = [self getOrCreateAPlayer:command];
    if (player) {
        [player getCurrentAmplitudeAudio:command];
    }
}

- (void)setVolume:(CDVInvokedUrlCommand*)command
{
    CDVSound* player = [self getOrCreateAPlayer:command];
    if (player) {
        [player setVolume:command];
    }
}

- (void)setRate:(CDVInvokedUrlCommand*)command
{
    CDVSound* player = [self getOrCreateAPlayer:command];
    if (player) {
        [player setRate:command];
    }
}

- (void)onMemoryWarning
{
    if (players) {
        for(id key in players) {
            CDVSound* player = [players objectForKey:key];
            if (player) {
                [player onMemoryWarning];
            }
        }
    }
    [super onMemoryWarning];
}

- (void)onReset
{
    if (players) {
        for(id key in players) {
            CDVSound* player = [players objectForKey:key];
            if (player) {
                [player onReset];
            }
        }
    }
}

- (void)dealloc
{
    if (players) {
        for(id key in players) {
            [players removeObjectForKey:key];
        }
        [players removeAllObjects];
        players = nil;
    }
}

- (CDVSound*)getOrCreateAPlayer:(CDVInvokedUrlCommand*)command {
    NSString* mediaId = [command argumentAtIndex:0];
    if (!players) {
        players = [NSMutableDictionary dictionary];
    }
    CDVSound* player = [players objectForKey:mediaId];
    if (!player) {
        player = [[CDVSound alloc] init];
        player.commandDelegate = self.commandDelegate;
        [players setObject:player forKey:mediaId];
    }
    return player;
}

@end
