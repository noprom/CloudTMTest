//
//  LoginViewController.swift
//  CloudTMTest
//
//  Created by noprom on 15/8/30.
//  Copyright © 2015年 noprom. All rights reserved.
//

import UIKit

// 开启圆角渲染
extension UIView {
    @IBInspectable var cornerRaduis: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = (newValue > 0)
        }
    }
}
class LoginViewController: UIViewController, JSAnimatedImagesViewDataSource {

    @IBOutlet weak var loginStackView: UIStackView!
    @IBOutlet weak var wallPaperImageView: JSAnimatedImagesView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.wallPaperImageView.dataSource = self
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hidden = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        // 登陆组由水平变为垂直
        UIView.animateWithDuration(1) { () -> Void in
            self.loginStackView.axis = UILayoutConstraintAxis.Vertical
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 轮播图
    func animatedImagesNumberOfImages(animatedImagesView: JSAnimatedImagesView!) -> UInt {
        return 3
    }
    
    func animatedImagesView(animatedImagesView: JSAnimatedImagesView!, imageAtIndex index: UInt) -> UIImage! {
        return UIImage(named: "\(index + 1)")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
