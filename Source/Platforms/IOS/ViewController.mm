// Copyright ❤️ 2025, Wow Play

#import "ViewController.h"

@implementation ViewController
- (void)viewDidLoad {
	[super viewDidLoad];

	self.view.backgroundColor = [UIColor whiteColor];

	UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
	label.text = @"Hello, World!";
	label.textColor = [UIColor blackColor];

	[self.view addSubview:label];
}
@end