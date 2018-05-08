//
//  CousinsHomeVC.swift
//  Shanli
//
//  Created by Li Zhaotian on 4/6/18.
//  Copyright © 2018 Li Zhaotian. All rights reserved.
//

import UIKit
import AVFoundation

class CousinsHomeVC: UIViewController {
    
    
    @IBOutlet weak var imageBkgd: UIImageView!
    var index = 1;
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string:"")
    let script = [
        "Honey, we are going to do some grocery and have a talk with your uncle and aunt", //0 - 2 mom
        "Will you stay with your cousin here? He can take good care of you.", //1 - 3 m
        "Sure. She will be good. Dont' worry about us. Have fun!", //2 - 4 c
        "Your parents, aunt and uncle leave.", //3 - 5 non
        "Dear sister, you must be boring and tired. Would you come to my bedroom and take a nap?", //4 - 6 c
        "Make yourself at home. Take off your jacket. Relax", //5 - 7 c
        "And take off your pants?" //6 - 8
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.landscapeRight, andRotateTo: UIInterfaceOrientation.landscapeRight)
    }
    
    override func viewWillDisappear(_ animated : Bool) {
        super.viewWillDisappear(animated)
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func `continue`(_ sender: Any) {
        
        if index == 9 {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let con = sb.instantiateViewController(withIdentifier: "CousinsHomeVC-2")
            self.present(con, animated: false, completion: nil)
            
        } else if index == 1 || index == 5 {//no speaking
            
            imageBkgd.image = UIImage(named:"cousins-home-\(String(index))")
            index += 1
            
        } else {
            
            imageBkgd.image = UIImage(named:"cousins-home-\(String(index))")
            myUtterance = AVSpeechUtterance(string: script[index-2])
            myUtterance.rate = 0.50
            
            if index-2 == 0 || index-2 == 1 {
                synth.speak(myUtterance)
            }else {
                myUtterance.voice = AVSpeechSynthesisVoice(language: "en-gb")
                myUtterance.pitchMultiplier = 2.5
                synth.speak(myUtterance)
            }
            index += 1
        }
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
