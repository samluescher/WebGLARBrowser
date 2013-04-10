//
//  WGLAppDelegate.m
//  UIWebViewWebGL
//
//  Created by Nathan de Vries on 27/10/11.
//  Copyright (c) 2011 Nathan de Vries. All rights reserved.
//


#define CAMERA_ENABLED false

#import "WGLAppDelegate.h"
#import "CameraViewController.h"
#import "ARViewController.h"

@implementation WGLAppDelegate

@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
  
  ARViewController *overlayViewController = [[ARViewController alloc] initWithNibName:@"ARViewController" bundle:nil];
  
  #if (CAMERA_ENABLED)
  CameraViewController *cameraViewController = [[CameraViewController alloc] init];
  self.window.rootViewController = cameraViewController;
  #else
  self.window.rootViewController = overlayViewController;
  #endif

  [self.window makeKeyAndVisible];
  
  #if (CAMERA_ENABLED)
  if ([cameraViewController initCamera]) {
    cameraViewController.imagePicker.cameraOverlayView = overlayViewController.view;
  } else {
    [cameraViewController.view addSubview:overlayViewController.view];
  }
  #endif
  
   
  return YES;
}

@end
