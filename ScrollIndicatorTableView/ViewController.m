//
//  ViewController.m
//  ScrollIndicatorTableView
//
//  Created by JT Ma on 24/03/2017.
//  Copyright © 2017 JT Ma. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIImageView *scrollIndicator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIEdgeInsets insets = UIEdgeInsetsMake(20, 20, 20, 20);
    UIImage* image = [UIImage imageNamed:@"background"];
    image = [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    self.imageView.image = image;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.showsVerticalScrollIndicator = NO;
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.scrollIndicator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scroll"]];
    self.scrollIndicator.frame = CGRectMake(self.tableView.bounds.size.width - 4, 0, 4, 66);
    [self.tableView addSubview:self.scrollIndicator];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 17;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.imageView.image = [UIImage imageNamed:@"dot"];
    cell.textLabel.text = @"Copyright © 2017 JT Ma.";
    cell.textLabel.textColor = [UIColor whiteColor];
    
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    float p = scrollView.contentOffset.y / (scrollView.contentSize.height - scrollView.frame.size.height + self.scrollIndicator.frame.size.height * (1 - scrollView.frame.size.height / scrollView.contentSize.height));
    self.scrollIndicator.frame = CGRectMake(self.scrollIndicator.frame.origin.x, p * scrollView.contentSize.height, self.scrollIndicator.bounds.size.width, self.scrollIndicator.frame.size.height);
}

@end
