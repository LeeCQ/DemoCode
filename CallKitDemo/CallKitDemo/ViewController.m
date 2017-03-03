//
//  ViewController.m
//  CallKitDemo
//
//  Created by 李昌庆 on 2017/2/15.
//  Copyright © 2017年 李昌庆. All rights reserved.
//

#import "ViewController.h"
#import "CallDirectoryHandler.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)add:(id)sender {
    if ( [_textField.text integerValue]) {
        NSMutableArray * lists = [self getuserDeList];
        if (![lists containsObject:@(_textField.text.integerValue)]) {
            
            [lists addObject:@([_textField.text integerValue])];
            [self saveList:lists];
            [self reloadData];
        }
    }
}


-(void)saveList:(NSMutableArray *)lists{
    NSUserDefaults * userDe = [[NSUserDefaults alloc]initWithSuiteName:@"2CHZTA348F.group.com.li.app"];
    
    [userDe setValue:lists forKey:@"list"];
    [userDe synchronize];

}
-(NSMutableArray *)getuserDeList{
    NSUserDefaults * userDe = [[NSUserDefaults alloc]initWithSuiteName:@"2CHZTA348F.group.com.li.app"];
    
    NSMutableArray * lists = [NSMutableArray arrayWithArray:[userDe valueForKey:@"list"]];
    if (!lists) {
        
        lists = [NSMutableArray array];
        
    }
    return lists;
}
-(void)reloadData{
    CXCallDirectoryManager * CXDManager = [CXCallDirectoryManager sharedInstance];
    [CXDManager reloadExtensionWithIdentifier:@"Li.CallKitDemo.CallKitDictionaryExtansion" completionHandler:^(NSError * _Nullable error) {
       
           dispatch_sync(dispatch_get_main_queue(), ^{
               
               NSString * message = error ? @"更新失败": @"更新成功";
               UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
               UIAlertAction * action = [UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleDefault handler:nil];
               [alert addAction:action];
               [self presentViewController:alert animated:YES completion:nil];
               
               
           });
       
        
        
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
