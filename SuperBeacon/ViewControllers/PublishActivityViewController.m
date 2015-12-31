#import "PublishActivityViewController.h"
#import "ActivityTableViewCell.h"
#import "UIView+Utils.h"
#import "UILabel+Utils.h"
#import "CountView.h"
#import "UITextField+Utils.h"
#import "ChooseAddressPresenter.h"
#import "UIButton+SlideMenuButton.h"

@interface PublishActivityViewController ()<UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate, CountViewDelegate, ChooseAddressDelegate, UITextViewDelegate>{
    NSArray *_typeArray;
    NSArray *_oldLevelArray;
    UIFont *_font;
    ChooseAddressPresenter *_chooseAddressPresenter;
    CGFloat photoViewHeight;
}

@property (weak, nonatomic) IBOutlet UITableView *publishTableView;
@property (strong, nonatomic)UITextField *titleTextField;
@property (strong, nonatomic)UILabel *typeLabel;
@property (strong, nonatomic)UILabel *oldLevelLabel;
@property (strong, nonatomic)CountView *countView;
@property (strong, nonatomic)UITextField *priceTextField;
@property (strong, nonatomic)UITextView *contentTextView;
@property (strong, nonatomic)UITextField *phoneTextField;
@property (strong, nonatomic)UILabel *addressLabel;
@end

@implementation PublishActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _chooseAddressPresenter = [[ChooseAddressPresenter alloc] init];
    _chooseAddressPresenter.viewController = self;
    _chooseAddressPresenter.delegate = self;
    
    self.title = @"创建售卖活动";
    [self setLeftNavButtonType:NavButtonX];
    [self setRightNavButtonType:NavButtonNext];
    self.view.backgroundColor = HEXCOLOR(0xFAFAFA);
    _publishTableView.delegate = self;
    _publishTableView.dataSource = self;
    _publishTableView.showsVerticalScrollIndicator = NO;
    _publishTableView.separatorStyle = NO;
    _publishTableView.backgroundColor = [UIColor clearColor];
    _typeArray = @[@"图书", @"衣服", @"生活用品", @"二手电子", @"自行车", @"兼职", @"其他"];
    _oldLevelArray = @[@"全新", @"9成新", @"8成新", @"7成新", @"6成以下"];
    
    _font = [UIFont systemFontOfSize:14.f];
    CGFloat x = 12.f;
    CGFloat y = 0.f;
    CGFloat width = SCREEN_WIDTH - x;
    CGFloat height = 44.f;
    CGRect rect = CGRectMake(x, y, width, height);
    _titleTextField = [[UITextField alloc] initWithFrame:rect];
    _titleTextField.font = _font;
    _titleTextField.placeholder = @"活动名称（10字-20字）";
    _titleTextField.clearButtonMode = UITextFieldViewModeAlways;
    _titleTextField.delegate = self;
    [_titleTextField addTarget:self action:@selector(returnOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    x = 0.f;
    y = 0.f;
    width = 100;
    height = 20.f;
    rect = CGRectMake(x, y, width, height);
    _typeLabel = [UILabel labelWithFrame:rect
                                    font:_font
                           textAlignment:NSTextAlignmentRight
                               textColor:HEXCOLOR(0x999999)
                    highlightedTextColor:nil];
    _oldLevelLabel = [UILabel labelWithFrame:rect
                                        font:_font
                               textAlignment:NSTextAlignmentRight
                                   textColor:HEXCOLOR(0x999999)
                        highlightedTextColor:nil];
    
    
    height = 44.f;
    width = 200.f;
    rect = CGRectMake(x, y, width, height);
    _priceTextField = [UITextField textFieldWithFrame:rect
                                                 font:_font
                                        textAlignment:NSTextAlignmentRight
                                            textColor:HEXCOLOR(0x999999)
                                          placeholder:@"价格￥"
                                         keyboardType:UIKeyboardTypeNumberPad];
    _priceTextField.delegate = self;
    [_priceTextField addTarget:self action:@selector(returnOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    width = 100.f;
    rect = CGRectMake(x, y, width, height);
    _countView = [[CountView alloc] initWithFrame:rect];
    _countView.minValue = 0;
    _countView.maxValue = MAXFLOAT;
    _countView.delegate = self;
    
    x = 12.f;
    y = 5.f;
    width = SCREEN_WIDTH - 2 * x;
    height = 150.f  - 2 * y;
    rect = CGRectMake(x, y, width, height);
    _contentTextView = [[UITextView alloc]initWithFrame:rect];
    _contentTextView.delegate = self;
    
    x = 0.f;
    y = 0.f;
    width = 200.f;
    height = 44.f;
    rect = CGRectMake(x, y, width, height);
    _phoneTextField = [UITextField textFieldWithFrame:rect
                                                 font:_font
                                        textAlignment:NSTextAlignmentRight
                                            textColor:HEXCOLOR(0x999999)
                                          placeholder:@"请输入手机号码"
                                         keyboardType:UIKeyboardTypePhonePad];
    _phoneTextField.delegate = self;
    [_phoneTextField addTarget:self action:@selector(returnOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    _addressLabel = [UILabel labelWithFrame:rect
                                       font:_font
                              textAlignment:NSTextAlignmentRight
                                  textColor:HEXCOLOR(0x999999)
                       highlightedTextColor:HEXCOLOR(0x999999)];
//    photoViewHeight = 100.f;
//    x = 0.f;
//    y = 0.f;
//    width = SCREEN_WIDTH;
//    height = photoViewHeight;
//    rect = CGRectMake(x, y, width, height);
//    _photoView = [[UIView alloc] initWithFrame:rect];
//    
//    x = 5.f;
//    y = 5.f;
//    width = (SCREEN_WIDTH - 25) / 4.f;
//    height = width;
//    photoViewHeight = height;
//    rect = CGRectMake(x, y, width, height);
//    _addPhotoBtn = [UIButton optionButtonWithFrame:rect iconName:@"1" title:@"添加图片"];
//    [_photoView addSubview:_addPhotoBtn];
//    rect.size.height += 10.f;
//    _photoView.frame = rect;
}

- (void)onClickNext{
    [self showWithClassName:@"AddPhotoViewController"];
}

#pragma mark ----------------UITableviewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    int rowNumber;
    if (section == 0) {
        rowNumber = 1;
    }else if(section == 1){
        rowNumber = 4;
    }else if(section == 2){
        rowNumber = 1;
    }else {
        rowNumber = 2;
    }
    return rowNumber;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat sectionHeight;
    if (section == 2) {
        sectionHeight = 40.f;
    }else{
        sectionHeight = 10.f;
    }
    return sectionHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height;
    if (indexPath.section == 2) {
        height = 150.f;
    }else{
        height = 44.f;
    }
    return height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CGFloat x = 0.f;
    CGFloat y = 0.f;
    CGFloat width = SCREEN_WIDTH;
    CGFloat height = 40.f;
    CGRect rect = CGRectMake(x, y, width, height);
    UIView *headerBackView = [[UIView alloc] initWithFrame:rect];
    headerBackView.backgroundColor = [UIColor clearColor];
    x = 12.f;
    height = 20.f;
    y = 40.f - height - 5.f;
    width = 200;
    rect = CGRectMake(x, y, width, height);
    UILabel *headerLabel = [UILabel labelWithFrame:rect
                                              font:_font
                                     textAlignment:NSTextAlignmentLeft
                                         textColor:HEXCOLOR(0x333333)
                              highlightedTextColor:nil];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.text = @"物品详情描述（不少于30字）";
    [headerBackView addSubview:headerLabel];
    return section == 2 ? headerBackView : nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ActivityTableViewCell *tableViewCell;
    tableViewCell = (ActivityTableViewCell *)[UITableViewCell tableView:tableView
                                                        cellWithNibName:@"ActivityTableViewCell"
                                                             withBundle:nil];
    
    [tableViewCell setCornerRadius:0 borderColor:HEXCOLOR(0xD7D7D7) borderWidth:0.5];
    tableViewCell.textLabel.font = _font;
    tableViewCell.backgroundColor = [UIColor whiteColor];
    tableViewCell.alpha = 0.85;
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        [tableViewCell.contentView addSubview:_titleTextField];
        [tableViewCell setCornerRadius:0 borderColor:HEXCOLOR(0xD7D7D7) borderWidth:1.0];
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            tableViewCell.textLabel.text = @"选择分类";
            [tableViewCell setCornerRadius:0 borderColor:HEXCOLOR(0xD7D7D7) borderWidth:1.0];
            if (!_typeLabel.text.length) {
                tableViewCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }else {
                tableViewCell.accessoryView = _typeLabel;
            }
        }else if (indexPath.row == 1){
            tableViewCell.textLabel.text = @"新旧程度";
            if (!_oldLevelLabel.text.length) {
                tableViewCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }else {
                tableViewCell.accessoryView = _oldLevelLabel;
            }
        }else if(indexPath.row == 2){
            tableViewCell.textLabel.text = @"商品价格";
            tableViewCell.accessoryView = _priceTextField;
            
        }else{
            tableViewCell.textLabel.text = @"商品数量";
            [tableViewCell setCornerRadius:0 borderColor:HEXCOLOR(0xD7D7D7) borderWidth:1.0];
            tableViewCell.selectedBackgroundView.backgroundColor = [UIColor clearColor];
            tableViewCell.accessoryView = _countView;
            
        }
    }else if (indexPath.section == 2){
        [tableViewCell setCornerRadius:0 borderColor:HEXCOLOR(0xD7D7D7) borderWidth:1.0];
        tableViewCell.accessoryView = _contentTextView;
    }else if (indexPath.section == 3){
        if (indexPath.row == 0) {
            [tableViewCell setCornerRadius:0 borderColor:HEXCOLOR(0xD7D7D7) borderWidth:1.0];
            tableViewCell.textLabel.text = @"手机号码";
            tableViewCell.accessoryView = _phoneTextField;
            
        }else if(indexPath.row == 1){
            tableViewCell.textLabel.text = @"地址";
            [tableViewCell setCornerRadius:0 borderColor:HEXCOLOR(0xD7D7D7) borderWidth:1.0];
            if (!_addressLabel.text.length) {
                tableViewCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }else{
                tableViewCell.accessoryView = _addressLabel;
            }
        }
    }
    return tableViewCell;
    
}

#pragma mark ----------------UITableviewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [_publishTableView endEditing:YES];
    [self resumeView];
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            UIActionSheet *typeActionSheet = [[UIActionSheet alloc] initWithTitle:@"请选择售卖物品所属类别"
                                                                         delegate:self
                                                                cancelButtonTitle:@"取消"
                                                           destructiveButtonTitle:nil
                                                                otherButtonTitles:@"图书", @"衣服", @"生活用品", @"二手电子", @"自行车", @"兼职", @"其他", nil];
            typeActionSheet.tag = 1000;
            [typeActionSheet showInView:_publishTableView];
            
        }else if (indexPath.row == 1){
            UIActionSheet *oldLevelActionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                                             delegate:self
                                                                    cancelButtonTitle:@"取消"
                                                               destructiveButtonTitle:nil
                                                                    otherButtonTitles:@"全新", @"9成新", @"8成新", @"7成新", @"6成以下", nil];
            oldLevelActionSheet.tag = 1001;
            [oldLevelActionSheet showInView:_publishTableView];
        }
    }else if (indexPath.section == 3){
        if (indexPath.row == 1) {
             [_chooseAddressPresenter loadView];
        }
    }
}

- (void)returnOnKeyboard:(UITextField *)sender{
    T4_LOG_FUNC();
    [sender resignFirstResponder];
}

#pragma mark ---------UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField == _phoneTextField) {
        [self upKeyboardViewWithHeight:180];
    }
    
    
    return YES;
}

- (void)upKeyboardViewWithHeight:(CGFloat)length{
    NSTimeInterval animationDuration=0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    
    CGFloat y = - length;
    CGRect rect = CGRectMake(0.0f, y, width, height);
    _publishTableView.frame = rect;
    
    [UIView commitAnimations];
}

- (void)resumeView
{
    NSTimeInterval animationDuration=0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    CGFloat y = 0;
    CGRect rect = CGRectMake(0.0f, y, width, height);
    _publishTableView.frame = rect;
    [UIView commitAnimations];
}

#pragma mark ---------UITextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    if (IS_IPHONE4 || IS_IPHONE5) {
        [self upKeyboardViewWithHeight:160];
    }else{
        [self upKeyboardViewWithHeight:100];
    }
    
    return  YES;
}

#pragma mark --------UIActionSheet Delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (actionSheet.tag == 1000) {
        if (buttonIndex < 7) {
            _typeLabel.text = _typeArray[buttonIndex];
            [_publishTableView reloadData];
        }
    }else if (actionSheet.tag == 1001){
        if (buttonIndex < 5) {
            _oldLevelLabel.text = _oldLevelArray[buttonIndex];
            [_publishTableView reloadData];
        }
    }
}

#pragma mark - ChooseAddressDelegate
- (void)onClickAddressChoosed:(NSString *)address{
    if (address) {
        _addressLabel.text = address;
        [_publishTableView reloadData];
    }
}

#pragma mark - CountViewDelegate

- (void)valueWillAdd:(CountView *)countView
{
    
}

- (void)valueWillSub:(CountView *)countView
{
    
}

- (void)valueDidChange:(CountView *)countView
{
    //    _month = countView.currentValue;
    //    self.purchaseBtn.enabled = (_month > 0);
    //    if (_month == 12) {
    //        _total = _12mPrice;
    //        self.vipPriceLabel.text = [NSString stringWithFormat:@"%ld", _total];
    //    } else {
    //        _total = _1mPrice * _month;
    //        self.vipPriceLabel.text = [NSString stringWithFormat:@"%ld", _total];
    //    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
