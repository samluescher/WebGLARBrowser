//
//  CameraViewController.m
//  UIWebViewWebGL
//
//  Created by Samuel Lüscher on 3/26/12.
//  Copyright (c) 2012 Nathan de Vries. All rights reserved.
//

#import "CameraViewController.h"

@interface CameraViewController ()

@end

@implementation UIImagePickerController (NoRotate)

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end


@implementation CameraViewController

@synthesize imagePicker;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (bool)initCamera
{
  if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera])
    {
      imagePicker =
      [[UIImagePickerController alloc] init];
      imagePicker.delegate = self;
      imagePicker.sourceType =
      UIImagePickerControllerSourceTypeCamera;
      imagePicker.allowsEditing = NO;
      imagePicker.showsCameraControls = NO;
      [self presentModalViewController:imagePicker
                              animated:YES];
      [imagePicker release];
      return YES;
    }
  return NO;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return NO;
}

@end
