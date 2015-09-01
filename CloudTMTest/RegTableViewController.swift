//
//  RegTableViewController.swift
//  CloudTMTest
//
//  Created by noprom on 15/8/31.
//  Copyright © 2015年 noprom. All rights reserved.
//

import UIKit

class RegTableViewController: UITableViewController {

    @IBOutlet weak var user: UITextBox!
    @IBOutlet weak var password: UITextBox!
    @IBOutlet weak var email: UITextBox!
    @IBOutlet weak var question: UITextBox!
    @IBOutlet weak var answer: UITextBox!
    @IBOutlet var regTextFields: [UITextField]!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.hidden = false
        self.title = "用户注册"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "doneButtonTap")
        
        // 格式验证
        self.navigationItem.rightBarButtonItem?.enabled = false
        
        // 用户名验证
        let v1 = AJWValidator(type: AJWValidatorType.String)
        v1.addValidationToEnsureMinimumLength(3, invalidMessage: "至少3个字符")
        v1.addValidationToEnsureMaximumLength(10, invalidMessage: "最多10个字符")
        self.user.ajw_attachValidator(v1)
        v1.validatorStateChangedHandler = {(newState: AJWValidatorState) -> Void in
            switch newState {
                case AJWValidatorState.ValidationStateValid:
                    self.user.highlightState = UITextBoxHighlightState.Default
                default:
                    let errorMsg = v1.errorMessages.first as? String
                    self.user.highlightState = UITextBoxHighlightState.Wrong(errorMsg!)
            }
        }
        
        // 密码验证
        let v2 = AJWValidator(type: AJWValidatorType.String)
        v2.addValidationToEnsureMinimumLength(6, invalidMessage: "至少6个字符")
        v2.addValidationToEnsureMaximumLength(15, invalidMessage: "最多15个字符")
        self.password.ajw_attachValidator(v2)
        v2.validatorStateChangedHandler = {(newState: AJWValidatorState) -> Void in
            switch newState {
            case AJWValidatorState.ValidationStateValid:
                self.password.highlightState = UITextBoxHighlightState.Default
            default:
                let errorMsg = v2.errorMessages.first as? String
                self.password.highlightState = UITextBoxHighlightState.Wrong(errorMsg!)
            }
        }
        
        // 邮箱验证
        let v3 = AJWValidator(type: AJWValidatorType.String)
        v3.addValidationToEnsureValidEmailWithInvalidMessage("Email格式不正确")
        self.email.ajw_attachValidator(v3)
        v3.validatorStateChangedHandler = {(newState: AJWValidatorState) -> Void in
            switch newState {
            case AJWValidatorState.ValidationStateValid:
                self.email.highlightState = UITextBoxHighlightState.Default
            default:
                let errorMsg = v3.errorMessages.first as? String
                self.email.highlightState = UITextBoxHighlightState.Wrong(errorMsg!)
            }
        }
    }
    
    func checkRequired() {
//        self.view.runBlockOnAllSubviews { (subView:UIView!) -> Void in
//            if let subView = subView as? UITextField {
//                if subView.text!.isEmpty {
//                    print("文本框为空")
//                }
//            }
//        }
        for textField in regTextFields {
            if textField.text!.isEmpty {
                self.errorNotice("内容不能为空")
            }
        }
        
        // 邮箱格式验证
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        guard predicate.evaluateWithObject(email.text) else {
            self.errorNotice("邮箱格式不对!")
            return
        }
    }

    func doneButtonTap() {
        let alert = UIAlertController(title: "系统提示", message: "完成", preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
