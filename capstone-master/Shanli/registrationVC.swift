//
//  registrationVC.swift
//  Shanli
//
//  Created by Li Zhaotian on 4/7/18.
//  Copyright © 2018 Li Zhaotian. All rights reserved.
//

import UIKit

class registrationVC: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var yearOfBirth: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPswd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signup(_ sender: Any) {
        
        let un = username.text
        let yob = yearOfBirth.text
        let em = email.text
        let pswd = password.text
        let confirm = confirmPswd.text
        
        if (un?.isEmpty)! || (yob?.isEmpty)! || (em?.isEmpty)! || (pswd?.isEmpty)! || (confirm?.isEmpty)!
        {
            // display alert message
            displayAlertMessage(userMessage: "Please fill the form" )
            return
            
        } else {
            
            // Check if password match with its confirm fields
            
            if pswd != confirm
            {
                //display alert message
                displayAlertMessage(userMessage: "Your Password must match with Confirm Password field" )
                return
                
            } else {
                
                // Storing Data Locally
                
                let defaults = UserDefaults.standard
                defaults.set(un, forKey:"UserName")
                defaults.set(yob, forKey:"YearOfBirth")
                defaults.set(em, forKey:"Email")
                defaults.set(pswd, forKey:"Password")
                
                //UserDefaults.standard.set(un, forKey: value(forKey:"UserName") as! String)
                //UserDefaults.standard.set(yob, forKey: value(forKey:"YearOfBirth") as! String)
                //UserDefaults.standard.set(em, forKey: value(forKey:"Email") as! String)
                //UserDefaults.standard.set(pswd, forKey: value(forKey:"Password") as! String)
                UserDefaults.standard.synchronize()
                
                // Display Confirmation Page
                var alert = UIAlertController(title: "Congrats!", message:"Sign up Successful!", preferredStyle: UIAlertControllerStyle.alert)
                
                let OKAction =  UIAlertAction(title:"Log in with the account", style: UIAlertActionStyle.default) { action in
                    self.dismiss(animated: true, completion:nil)
                }
                alert.addAction(OKAction);
                self.present(alert, animated:true, completion:nil)
                
                //go to first view controller in the game
                //let sb = UIStoryboard(name: "Main", bundle: nil)
                //let con = sb.instantiateViewController(withIdentifier: "firstViewController")
                //self.present(con, animated: false, completion: nil)
                
            }
            
        }
        
        
        
    }
    
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
