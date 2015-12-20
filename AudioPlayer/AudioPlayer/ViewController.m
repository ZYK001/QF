//
//  ViewController.m
//  AudioPlayer
//
//  Created by 赵英奎 on 15/12/12.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import "ViewController.h"
#import<CoreMedia/CoreMedia.h>
#import<AVFoundation/AVFoundation.h>

@interface ViewController ()<AVCaptureAudioDataOutputSampleBufferDelegate>
{
    AVCaptureSession*captureSession;

}
@end

@implementation ViewController

-(void)initVoice
{
   
        captureSession= [[AVCaptureSession alloc]init];
        AVCaptureDevice* audioDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeAudio];
    
        if(audioDevice) {
            NSError*error;
           
            AVCaptureDeviceInput* audioIn = [AVCaptureDeviceInput deviceInputWithDevice:audioDevice error:&error];
            if ( !error ) {
                if ([captureSession canAddInput:audioIn])
                    [captureSession addInput:audioIn];
                else
                    NSLog(@"Couldn't add audio input");
            }
            else
                NSLog(@"Couldn't create audio input");
        }
        else
            NSLog(@"Couldn't create audio capture device");
        AVCaptureAudioDataOutput*audioOut = [[AVCaptureAudioDataOutput alloc]init];
        [audioOut setSampleBufferDelegate:self queue:dispatch_get_main_queue()];
        if ([captureSession canAddOutput:audioOut]) {
            [captureSession addOutput:audioOut];
            //audioConnection = 
            [audioOut connectionWithMediaType:AVMediaTypeAudio];
        }
        else
            NSLog(@"Couldn't add audio output");

        [captureSession startRunning];

    
    
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection
{
    AudioBufferList audioBufferList;
    NSMutableData *data = [[NSMutableData alloc] init];
    CMBlockBufferRef blockBuffer;
    CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(sampleBuffer, NULL, &audioBufferList, sizeof(audioBufferList), NULL, NULL, 0, &blockBuffer);
    
    for (int y = 0; y < audioBufferList.mNumberBuffers; y++) {
        AudioBuffer audioBuffer = audioBufferList.mBuffers[y];
        Float32 *frame = (Float32 *)audioBuffer.mData;
        [data appendBytes:frame length:audioBuffer.mDataByteSize];
    }
    
   
    
    AVAudioPlayer *player=[[AVAudioPlayer alloc]initWithData:data error:nil];

//    CFRelease(blockBuffer);
//    blockBuffer = NULL;
    
}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initVoice];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
