//
//  LeftSideVC.swift
//  MAMA
//
//  Created by xionghuanxin on 7/6/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

import UIKit

class LeftSideVC: XFundationVC {
    lazy var imageNames : [String] = NSDictionary(contentsOfFile:NSBundle.mainBundle().pathForResource("imageName", ofType: "plist")!)!["LeftSideImage"]?.allValues as! [String]
    
    
    lazy var userInfoButton : UIButton = {
        let aButton = UIButton(type: UIButtonType.Custom)
        aButton.bounds = CGRect(x: 0, y: 0, width: 60, height: 60)
        aButton.center = CGPoint(x: 0.75*XScreen.SCREEN_W, y: 0.25*XScreen.SCREEN_W)
        aButton.layer.borderWidth = 3
        aButton.layer.cornerRadius = 30
        aButton.layer.borderColor = UIColor.whiteColor().CGColor
        return aButton
    }()
    
    lazy var specialButton : UIButton = {
        let aButton = UIButton(type: UIButtonType.Custom)
        aButton.bounds = CGRect(x: 0, y: 0, width: 0.5*XScreen.SCREEN_W , height: 50)
        aButton.center = CGPoint(x: 0.75*XScreen.SCREEN_W, y: 0.5*XScreen.SCREEN_W)
        aButton.setTitle("专题", forState: UIControlState.Normal)
        aButton.backgroundColor = XColor.tintColor
        return aButton
        
    }()
    
    lazy var tableView : UITableView = {
        
        let aView = UITableView(frame: CGRect.init(x: XScreen.SCREEN_W * 0.5, y: XScreen.SCREEN_W * 0.5 + 25, width: XScreen.SCREEN_W * 0.5, height: XScreen.SCREEN_H - XScreen.SCREEN_W * 0.5 - 25), style: UITableViewStyle.Plain)
        aView.delegate = self
        aView.dataSource = self
        aView.registerClass(LeftSideCell.classForCoder(), forCellReuseIdentifier: "cellReuse")
        return aView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeInterface()
        self.view.addSubview(self.userInfoButton)
        self.view.addSubview(self.specialButton)
        self.view.addSubview(self.tableView)
    }
    
    override func initializeInterface(){
        super.initializeInterface()
        self.view.backgroundColor = UIColor.blackColor()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
}


extension LeftSideVC : UITableViewDelegate
{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        rootVC?.closeLeftSide()
        rootVC?.homeVC?.navigationController?.pushViewController(SpecialTopicViewController(), animated: true)

    }
}

extension LeftSideVC : UITableViewDataSource
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell : LeftSideCell = tableView.dequeueReusableCellWithIdentifier("cellReuse") as! LeftSideCell
        cell.aTextLabel.text = "asdf"
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.aImageView.image = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource(imageNames[indexPath.row], ofType: "png", inDirectory: "/images/TypePage")!)
        return cell
    }
    
}




