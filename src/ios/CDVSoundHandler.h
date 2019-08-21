//
//  CDVSoundHandler.h
//  Fitrádió
//
//

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface CDVSoundHandler: CDVPlugin {
}
- (void)startPlayingAudio:(CDVInvokedUrlCommand*)command;
- (void)pausePlayingAudio:(CDVInvokedUrlCommand*)command;
- (void)stopPlayingAudio:(CDVInvokedUrlCommand*)command;
- (void)seekToAudio:(CDVInvokedUrlCommand*)command;
- (void)release:(CDVInvokedUrlCommand*)command;
- (void)getCurrentPositionAudio:(CDVInvokedUrlCommand*)command;
- (void)resumeRecordingAudio:(CDVInvokedUrlCommand*)command;
- (void)pauseRecordingAudio:(CDVInvokedUrlCommand*)command;

- (void)startRecordingAudio:(CDVInvokedUrlCommand*)command;
- (void)stopRecordingAudio:(CDVInvokedUrlCommand*)command;
- (void)getCurrentAmplitudeAudio:(CDVInvokedUrlCommand*)command;

- (void)setVolume:(CDVInvokedUrlCommand*)command;
- (void)setRate:(CDVInvokedUrlCommand*)command;
@end
