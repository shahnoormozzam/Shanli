//
//  AppDelegate.swift
//  Shanli
//
//  Created by Li Zhaotian on 3/22/18.
//  Copyright © 2018 Li Zhaotian. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?
    var orientationLock = UIInterfaceOrientationMask.portrait
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        /*   currentuser = Auth.auth().currentUser
         
         if currentuser == nil {
         showloginVC()
         }else{ // Already authenticated by google
         showGoToSchoolAt6VC()
         }*/
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return self.orientationLock
    }
    
    struct AppUtility {
        static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
            if let delegate = UIApplication.shared.delegate as? AppDelegate {
                delegate.orientationLock = orientation
            }
        }
        
        static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
            self.lockOrientation(orientation)
            UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
        }
    }

    // Add the following 2 funcs to handle the  URL for ios 9 and older versions of ios
    @available(iOS 9.0, *)
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any])
        -> Bool {
            return GIDSignIn.sharedInstance().handle(url,
                                                     sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                     annotation: [:])
    }
    
    /* This is required if you are working with ios8
     func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
     return GIDSignIn.sharedInstance().handle(url,
     sourceApplication: sourceApplication,
     annotation: annotation)
     }
     */
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let error = error{
            print(error.localizedDescription)
            return
        }
        //USE this google user obeject to sign in with Firebase
        print("You are now signed in as far as Google is concerned!")
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                print("Error with Google Auth")
                print(error.localizedDescription)
                return
            }
            print(" User Logged In")
            // currentuser = Auth.auth().currentUser
            //self.showGoToSchoolAt6VC()
            
            self.handleLogin()
        }
        
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        print("App is disconneted")
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func handleLogin(){
        showloginVC()
    }
    
    func showGoToSchoolAt6VC(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        window!.rootViewController = storyboard.instantiateViewController(withIdentifier: "GoToSchoolAt6VC")
    }
    
    func showloginVC(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        window!.rootViewController = storyboard.instantiateViewController(withIdentifier: "loginVC()")
    }
    
    var currentuser: User?
    
    func handleLogout(){
        
        if currentuser != nil{
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
        }
    }
    
    /*GIDSignIn.sharedInstance().signOut()
     try! Auth.auth().signOut()
     showloginVC()
     }*/
    
    /*func signOut(){
     do{
     try! Auth.auth().signOut()
     GIDSign.sharedInstance().signout()
     
     let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
     let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! signInViewController
     let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
     appDelegate.window?.rootViewController = loginVC
     }catch let signOut as NSError
     print ("Error Signing Out: \(signOutError)")
     }
     }*/



}

