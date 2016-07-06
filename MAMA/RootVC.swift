//
//  RootVC.swift
//  MAMA
//
//  Created by xionghuanxin on 7/6/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

import UIKit

class RootVC: UIViewController {
    var leftVC : LeftSideVC?
    var homeVC : HomePageVC?
    var closeTapLeftGesture:UITapGestureRecognizer?
    var openSwipeLeftGesture:UISwipeGestureRecognizer?
    lazy var shadowView:ShadowView = {
        let aView = ShadowView()
        aView.frame = XScreen.SCREEN_BOUNDS
        aView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0)
        return aView
    }()
    
    
    
    init (){
        super.init(nibName : nil ,bundle: nil)
        leftVC = LeftSideVC()
        leftVC?.rootVC = self
        homeVC = HomePageVC()
        homeVC?.rootVC = self
    }
    
    func initializeInterface(){
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeInterface()
        self.addChildViewController(UINavigationController.init(rootViewController: homeVC!))
        self.addChildViewController(leftVC!)
        leftVC?.view.center.x = -((homeVC?.view.center.x)!)
        
        openSwipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.respondsToOpenSwipeGesture(_:)))
        closeTapLeftGesture = UITapGestureRecognizer(target: self, action: #selector(self.respondsToCloseTapGesture(_:)))
        
        self.view.addGestureRecognizer(self.openSwipeLeftGesture!)
        self.shadowView.addGestureRecognizer(self.closeTapLeftGesture!)

    }
    override func addChildViewController(childController: UIViewController) {
        super.addChildViewController(childController)
        self.view.addSubview(childController.view)
        childController.didMoveToParentViewController(self)
    }
    
    //MARK : Action
    func respondsToOpenSwipeGesture(gesture :UISwipeGestureRecognizer){
        openLeftSide()
    }
    func respondsToCloseTapGesture(gesture :UITapGestureRecognizer){
        closeLeftSide()
    }
    
    //MARK :Method
    func openLeftSide()  {
        self.view.addSubview(self.shadowView)
        self.view.bringSubviewToFront((self.leftVC?.view)!)
        UIView.animateWithDuration(0.2, animations: {
            self.leftVC?.view.center.x = 0
            self.shadowView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        }) { (Bool) in
            
        }
        
    }
    
    func closeLeftSide()  {
        UIView.animateWithDuration(0.2, animations: {
            self.leftVC?.view.center.x = -((self.homeVC?.view.center.x)!)
            self.shadowView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.0)
            self.shadowView.removeFromSuperview()

        }) { (Bool) in
            
        }
        
    }
}
