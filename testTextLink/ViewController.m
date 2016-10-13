//
//  ViewController.m
//  testTextLink
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "EmojiTextAttachment.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITextView *textLabel=[[UITextView alloc]initWithFrame:CGRectMake(0, 100, 320, 100)];
    textLabel.editable=NO;
    textLabel.delegate=self;
    [self.view addSubview:textLabel];
    
    NSString *origHtml;
    origHtml=[NSString stringWithFormat:@"%@%@：%@",@"abc",[NSString stringWithFormat:@"<img src=\"file://%@\" width=\"30\" height=\"15\"/ style=\"vertical-align:-20%%\">absdcc<img src=\"http://cc.cocimg.com/api/uploads/160927/dcc9a3f21c41a5c8cbcaa9e265d108a2.jpg\" width=\"30\" height=\"15\"/ style=\"vertical-align:-20%%\">",[[NSBundle mainBundle] pathForResource:@"卷轴.png" ofType:nil]],@"aaa"];

    origHtml=[origHtml stringByReplacingOccurrencesOfString:@"<br>" withString:@""];
    origHtml=[origHtml stringByReplacingOccurrencesOfString:@"</p>" withString:@""];
    origHtml=[origHtml stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
    origHtml=[origHtml stringByReplacingOccurrencesOfString:@" alt=" withString:@" width=\"16\" height=\"16\" style=\"vertical-align:-20%%\" alt="];
    
    NSString *timeHtml=[NSString stringWithFormat:@"  %@</font></p>",@"kkk"];
    
    NSDictionary *options = @{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType};
    NSData *dataStr=[[NSString stringWithFormat:@"<p>  %@%@",origHtml,timeHtml] dataUsingEncoding:NSUnicodeStringEncoding];
    
    NSMutableAttributedString *htmlString = [[NSMutableAttributedString alloc] initWithData:dataStr options:options documentAttributes:nil error:nil];
    
    [htmlString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0,htmlString.length)];

    textLabel.attributedText=htmlString;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)url inRange:(NSRange)characterRange
{
    UIAlertView *resignAlt=[[UIAlertView alloc]initWithTitle:@"提示" message:@"ok" delegate:self cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
    [resignAlt show];
    // do the task
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
