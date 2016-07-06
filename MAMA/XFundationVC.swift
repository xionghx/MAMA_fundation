//
//  XFundationVC.swift
//  MAMA
//
//  Created by xionghuanxin on 7/6/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

import UIKit

class XFundationVC: UIViewController {
    var rootVC : RootVC?
    var navigationBar : XNavigationBar?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeInterface()
        
    }
    
    func initalzieDataSource(){
        
        
    }
    func initializeInterface(){
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBarHidden = true
        if self.navigationController?.childViewControllers.count >= 2 {
            self.navigationController?.navigationBarHidden = true
            navigationBar = XNavigationBar.init(frame: CGRectMake(0, 0, XScreen.SCREEN_W, 64))
            navigationBar?.backButton.addTarget(self, action: #selector(backItemAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(navigationBar!)
        }
    }
    
    
    func backItemAction (sender:UIButton){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
}
