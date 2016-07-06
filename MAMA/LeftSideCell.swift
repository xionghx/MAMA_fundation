//
//  LeftSIdeCell.swift
//  MAMA
//
//  Created by xionghuanxin on 7/6/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

import UIKit

class LeftSideCell: UITableViewCell {

    lazy var aImageView: UIImageView = {
        var aView = UIImageView()
        aView.bounds = CGRect(x: 0, y: 0, width: 50, height: 50)
        aView.center = CGPoint(x: 20, y: 10)
        return aView
    }()
    
    lazy var aTextLabel: UILabel = {
        var aLabel = UILabel()
        aLabel.bounds = CGRect(x: 0, y: 0, width: 50, height: 50)
        aLabel.center = CGPoint(x: 70, y: 10)
        return aLabel
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.aImageView)
        self.contentView.addSubview(self.aTextLabel)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

 }
