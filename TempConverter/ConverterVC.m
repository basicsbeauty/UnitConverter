//
//  ConverterVC.m
//  TempConverter
//
//  Created by Beauty on 1/13/14.
//  Copyright (c) 2014 Ranam. All rights reserved.
//

#import "ConverterVC.h"

@interface ConverterVC ()

@property BOOL flagFChanged;
@property BOOL flagCChanged;


- (IBAction)onTap:(id)sender;
- (void)convert;

- (void)convertF2C;
- (void)convertC2F;


@property (weak, nonatomic) IBOutlet UITextField *txtF;
@property (weak, nonatomic) IBOutlet UITextField *txtC;


- (IBAction)txtFHandler:(id)sender;
- (IBAction)txtCHandler:(id)sender;


- (IBAction)btnConvert:(id)sender;

@end

@implementation ConverterVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        // Titile: Set
        self.title = @"Unit Converter";
        
        self.flagFChanged = TRUE;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self convert];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)convertF2C {

    NSLog( @"%s", "F2C: BGN");
    
    static const double f2cFactor = (double)5/(double)9;
    
    double  cValue;
    double  fValue;
    
    NSString *fValueText = self.txtF.text;
    
    fValue = [fValueText doubleValue];
    cValue = (fValue - 32) * f2cFactor;

    self.txtF.text = [ NSString stringWithFormat:@"%d", (int) fValue];
    self.txtC.text = [ NSString stringWithFormat:@"%d", (int) cValue];

    NSLog( @"%s F:%f C:%f Fac:%lf", "F2C: END", fValue, cValue, f2cFactor);
}

- (void)convertC2F {

    NSLog( @"%s", "C2F: BGN");
    
    static double c2fFactor = (double) (9/5);
    
    double cValue;
    double fValue;
    
    NSString *cValueText = self.txtC.text;
    
    cValue = [cValueText doubleValue];
    fValue = (cValue * c2fFactor) + 32;

    self.txtF.text = [ NSString stringWithFormat:@"%d", (int) fValue];
    self.txtC.text = [ NSString stringWithFormat:@"%d", (int) cValue];

    NSLog( @"%s", "C2F: END");
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (void)convert {

    NSLog( @"%s F:%d C:%d", "Convert: BGN", self.flagFChanged, self.flagCChanged);
    
    if( TRUE == self.flagFChanged) {
        NSLog( @"%s", "F Changed");
        [self convertF2C];
    }
    else if( TRUE == self.flagCChanged) {
        NSLog( @"%s", "C Changed");
        [self convertC2F];
    }
    self.flagCChanged = FALSE;
    self.flagFChanged = FALSE;

    NSLog( @"%s", "Convert: END");
}

- (IBAction)btnConvert:(id)sender {
    [self convert];
}

- (IBAction)txtFHandler:(id)sender {
    NSLog( @"%s", "Txt F: Handler: BGN");
    self.flagFChanged = TRUE;
    NSLog( @"%s", "Txt F: Handler: END");
}

- (IBAction)txtCHandler:(id)sender {
    NSLog( @"%s", "Txt C: Handler: BGN");
    self.flagCChanged = TRUE;
    NSLog( @"%s", "Txt C: Handler: END");
}

@end
