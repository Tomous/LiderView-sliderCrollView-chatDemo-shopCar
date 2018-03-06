//
//  DCAddNumView.m
//  类似QQ主页的侧滑
//
//  Created by 许大成 on 17/5/31.
//  Copyright © 2017年 许大成. All rights reserved.
//

#import "DCAddNumView.h"
#import "Util.h"
#import "Header.h"

@implementation DCAddNumView

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        num = 1;
        self.backgroundColor = UIColorRGBA(251, 251, 251, 1);
        [Util makeCorner:0.5 view:self color:GrayLine];
        
        minusBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, frame.size.height)];
        [minusBtn setTitle:@"-" forState:UIControlStateNormal];
        [minusBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        minusBtn.titleLabel.font = [UIFont systemFontOfSize:37.0];
        [minusBtn addTarget:self action:@selector(MinusBtn:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:minusBtn];
        
        numLabel = [[UILabel alloc] initWithFrame:CGRectMake(32, (frame.size.height - 18)/2, 35, 18)];
        numLabel.textAlignment = NSTextAlignmentCenter;
        numLabel.textColor = TextColor;
        numLabel.font = [UIFont systemFontOfSize:17.0];
        [self addSubview:numLabel];
        [Util setFoursides:numLabel Direction:@"left" sizeW:18];
        [Util setFoursides:numLabel Direction:@"right" sizeW:18];
        
        addBtn = [[UIButton alloc] initWithFrame:CGRectMake(64, 0, 32, frame.size.height)];
        [addBtn setTitle:@"+" forState:UIControlStateNormal];
        [addBtn setTitleColor:UIColorRGBA(51, 51, 51, 1) forState:UIControlStateNormal];
        addBtn.titleLabel.font = [UIFont systemFontOfSize:25.0];
        [addBtn addTarget:self action:@selector(AddBtn:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:addBtn];
        
    }
    return self;
}



-(void)MinusBtn:(UIButton *)sender{
    
    if ((num - 1) <= 0 || num == 0) {
        
        NSLog(@"超出范围");
        
    }else{
        
        num  = num -1;
    }
    
    numLabel.text = [NSString stringWithFormat:@"%ld",(long)num];
    
    [_delegate AddNumView:num];
}

-(void)AddBtn:(UIButton *)sender{
    
    if (num >= 10 ) {
        
        NSLog(@"超出范围");
        
    }else{
        
        num = num +1;
    }
    
    numLabel.text = [NSString stringWithFormat:@"%ld",(long)num];
    
    [_delegate AddNumView:num];
    
}

-(void)setNumInteger:(NSInteger)numInteger{
    
    _numInteger = numInteger;
    numLabel.text = [NSString stringWithFormat:@"%ld",(long)_numInteger];
    num = _numInteger;
}

-(void)setMinInteget:(NSInteger)minInteget{
    
    _minInteget = minInteget;
    if (_minInteget == 0) {
        
        [_delegate AddNumView:_minInteget];
        numLabel.text = @"0";
        num = 0;
        
    }else if (_minInteget<=[numLabel.text integerValue]){
        
        [_delegate AddNumView:_minInteget];
        numLabel.text = [NSString stringWithFormat:@"%ld",(long)_minInteget];
        num = _minInteget;
    }
    
}

@end
