//
//  loginVC.swift
//  Shanli
//
//  Created by Li Zhaotian on 4/7/18.
//  Copyright © 2018 Li Zhaotian. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class loginVC: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pswdTextField: UITextField!
    
    //@IBOutlet weak var googlelogin: UIView!
    
     @IBOutlet weak var googlelogin: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance().uiDelegate = self
        googlelogin.style = .wide
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender: Any) {
        
        let email = emailTextField.text
        let pswd = pswdTextField.text
        
        let emailsStored = UserDefaults.standard.string(forKey: "Email")
        let pswdStored = UserDefaults.standard.string(forKey: "Password")
        
        if emailsStored == email
        {
            if pswdStored == pswd
            {
                //Login is successful
                
                UserDefaults.standard.bool(forKey: "isUserLoggedIn")
                UserDefaults.standard.synchronize()
                self.dismiss(animated: true, completion: nil)
                
                //go to first view controller in the game
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let con = sb.instantiateViewController(withIdentifier: "firstViewController")
                self.present(con, animated: false, completion: nil)
                
            }else{
                //display alert message
                displayAlertMessage(userMessage: "Login Unsuccessful, Please check your credentials!!" )
                return
            }
        }
        
    }
    /* @IBAction func logout(_ sender: UIButton) {
     
     let
     displayAlertMessage(userMessage: "Do you want to logout from your google account?!!" )
     storyboard = UIStoryboard(name: "Main", bundle: nil)
     window!.rootViewController = storyboard.instantiateViewController(withIdentifier: "loginVC")
     }*/
    
    
    func displayAlertMessage(userMessage:String){
        let alert = UIAlertController(title: "Alert!", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let OKAction =  UIAlertAction(title:"OK", style: UIAlertActionStyle.default, handler: nil)
        
        alert.addAction(OKAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
