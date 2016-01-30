//
//  LoginViewController.swift
//  PhotoReal
//
//  Created by Akkshay Khoslaa on 1/14/16.
//  Copyright © 2016 Akkshay Khoslaa. All rights reserved.
//

import UIKit
import Parse
class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

       loginButton.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginUser(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(usernameTextField.text!, password:"mypass") {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                // Do stuff after successful login.
                print("logged in")
                self.performSegueWithIdentifier("toMainVC", sender: self)
            } else {
                // The login failed. Check error to see why.
            }
        }

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
