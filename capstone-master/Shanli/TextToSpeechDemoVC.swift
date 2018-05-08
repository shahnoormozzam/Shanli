//
//  TextToSpeechDemoVC.swift
//  Shanli
//
//  Created by Li Zhaotian on 4/7/18.
//  Copyright © 2018 Li Zhaotian. All rights reserved.
//

import UIKit
import AVFoundation

class TextToSpeechDemoVC: UIViewController {

    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string:"")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func read(_ sender: Any) {
        
        myUtterance = AVSpeechUtterance(string:"Thank you for watching our demo. Have a nice weekend.")
        myUtterance.rate = 0.50
        myUtterance.voice = AVSpeechSynthesisVoice(language: "en-gb")
        
        synth.speak(myUtterance)

        
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
