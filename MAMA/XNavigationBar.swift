//
//  XNavigationBar.swift
//  MAMA
//
//  Created by xionghuanxin on 7/6/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

import UIKit

class XNavigationBar: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.backButton)
        self.backgroundColor = XColor.barGrayColor
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var backButton : UIButton = {
        var aButton = UIButton(type: UIButtonType.Custom)
        aButton.frame = CGRect(x: 20, y: 20, width: 44, height: 44)
        aButton.setImage(UIImage.init(named: "黑色返回"), forState: UIControlState.Normal)
        aButton.imageEdgeInsets = UIEdgeInsetsMake(10, 0, 5, 20)
        return aButton
    
    }()

}
