//
//  ViewController.m
//  calk
//
//  Created by Maksim  on 06.06.2018.
//  Copyright © 2018 Maksim . All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    double allo;
    double allo2;
    int countForNumber1;
    int countForNumber2;
    int sign;
    double optional;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
    allo = 0;
    allo2 = 0;
    sign = 0;
    optional = 0;
    countForNumber1 = 0;
    countForNumber2 = 0;
    NSLog(@"Ya zagruzilsya");
    
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"YA poyavilsya");
}
- (void)setValue:(NSInteger)number {
    if(!sign){
        if(countForNumber1 < 9){
            allo *= 10;
            allo += number;
            countForNumber1++;
            NSLog(@"result %li", (long)allo);
            [self.textField setText:[NSString stringWithFormat:@"%li", (long)allo]];
        }
    }else{
        if(countForNumber2 < 9){
            allo2 *= 10;
            allo2 += number;
            countForNumber2++;
            NSLog(@"result %li", (long)allo2);
            [self.textField setText:[NSString stringWithFormat:@"%li", (long)allo2]];
        }
    }
}
- (IBAction)sevenClick:(id)sender {
    
    [self setValue:7];
}
- (IBAction)eightClick:(id)sender {
    [self setValue:8];
}
- (IBAction)nineClick:(id)sender {
    [self setValue:9];
}
- (IBAction)fourClick:(id)sender {
    [self setValue:4];
}
- (IBAction)fiveClick:(id)sender {
    [self setValue:5];
}
- (IBAction)sixClick:(id)sender {
    [self setValue:6];
}
- (IBAction)oneClick:(id)sender {
    [self setValue:1];
}
- (IBAction)twoClick:(id)sender {
    [self setValue:2];
}
- (IBAction)threeClick:(id)sender {
    [self setValue:3];
}
- (IBAction)zeroClick:(id)sender {
    [self setValue:0];
}
- (IBAction)changeSign:(id)sender {
    if(!sign){
        if((allo == 0)&&(optional != 0)){
            allo = optional;
        }
        allo *= -1;
        NSLog(@"result %li", (long)allo);
        [self.textField setText:[NSString stringWithFormat:@"%li", (long)allo]];
    }else{
        allo2 *= -1;
        NSLog(@"result %li", (long)allo2);
        [self.textField setText:[NSString stringWithFormat:@"%li", (long)allo2]];
    }
}
- (IBAction)deleteClick:(id)sender {
    /*allo /= 10;
    NSLog(@"result %li", (long)allo);*/
    if(!sign){
        allo = 0;
        optional = 0;
        countForNumber1 = 0;
        [self.textField setText:[NSString stringWithFormat:@"%li", (long)allo]];
    }else{
        allo2 = 0;
        countForNumber2 = 0;
        //optional = 0;
        [self.textField setText:[NSString stringWithFormat:@"%li", (long)allo2]];
    }
}
- (IBAction)percentClick:(id)sender {
    if(!sign){
        if((allo == 0)&&(optional != 0)){
            allo = optional;
        }
        allo /= 100;
        NSLog(@ "result %li", (long)allo);
        [self.textField setText:[NSString stringWithFormat:@"%li", (long)allo]];
    }else{
        allo2 /= 100;
        NSLog(@ "result %li", (long)allo2);
        [self.textField setText:[NSString stringWithFormat:@"%li", (long)allo2]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sumClick:(id)sender {
    if (!allo){
        allo = optional;
    }
    sign = 1;
}
- (IBAction)substraction:(id)sender {
    if (!allo){
        allo = optional;
    }
    sign = 2;
}
- (IBAction)multyClick:(id)sender {
    if (!allo){
        allo = optional;
    }
    sign = 3;
}
- (IBAction)divideClick:(id)sender {
    if (!allo){
        allo = optional;
    }
    sign = 4;
}
- (IBAction)resultClick:(id)sender {
    switch (sign) {
        case 1:
            optional = allo + allo2;
            if(optional < 999999999){
                [self.textField setText:[NSString stringWithFormat:@"%li", (long)(optional)]];
                
            }else{
                [self.textField setText:@"Max"];
                optional = 0;
            }
            allo = 0;
            allo2 = 0;
            sign = 0;
            countForNumber1 = 0;
            countForNumber2 = 0;
            break;
        case 2:
            optional = allo - allo2;
            [self.textField setText:[NSString stringWithFormat:@"%li", (long)(optional)]];
            allo = 0;
            allo2 = 0;
            sign = 0;
            countForNumber1 = 0;
            countForNumber2 = 0;
            break;
        case 3:
            optional = allo * allo2;
            if(optional < 999999999){
                [self.textField setText:[NSString stringWithFormat:@"%li", (long)(optional)]];
            }else{
                [self.textField setText:@"Max"];
                optional = 0;
            }
            allo = 0;
            allo2 = 0;
            sign = 0;
            countForNumber1 = 0;
            countForNumber2 = 0;
            break;
        case 4:
            if(allo2 == 0){
                [self.textField setText:@"Nan"];
                countForNumber1 = 0;
                countForNumber2 = 0;
                allo = 0;
                allo2 = 0;
                sign = 0;
                
            }else{
                optional = allo / allo2;
                [self.textField setText:[NSString stringWithFormat:@"%.2lf", (optional)]];
                allo = 0;
                allo2 = 0;
                sign = 0;
                countForNumber1 = 0;
                countForNumber2 = 0;
            }
            break;
        default:
            break;
    }
}





@end
