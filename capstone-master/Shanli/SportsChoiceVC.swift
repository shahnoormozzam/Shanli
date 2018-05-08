//
//  SportsChoiceVC.swift
//  Shanli
//
//  Created by Li Zhaotian on 4/5/18.
//  Copyright © 2018 Li Zhaotian. All rights reserved.
//

import UIKit
import AVFoundation

class SportsChoiceVC: UIViewController {

    @IBOutlet weak var imageBkgd: UIImageView!
    var index = 1
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string:"")
    let script = [
        "Welcome to gym class! You can choose your favorite sports this semester.", //0 - 2
        "Girls can choose from swimming, aerobics, tennis, ping pong, softball......", //1 - 3
        "And of course if you just want running, the playground and track is always open.", //2 - 4
        "Excuse me, madame. Can we play soccer or basketball? Even football?", //3 - 5 girl
        "I'm a huge fan of NBA and NFL", //4 - 6 girl
        "I would not recommend that... girls will easily get hurt in such violent and intensive sports.", //5 - 7
        "By the way I thought you prefer to be quiet, stay indoor to avoid summer sunshine......", //6 - 8
        "Well don't get me wrong, I just want to do your girls a favor, and try to protect you." //7 - 9
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func `continue`(_ sender: Any) {
        
        if index == 10 {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let con = sb.instantiateViewController(withIdentifier: "SportsChoiceVC-2")
            self.present(con, animated: false, completion: nil)
            
        } else if index == 1 {
            
            imageBkgd.image = UIImage(named:"sports-choice-\(String(index))")
            index += 1
            
        } else {
            
            imageBkgd.image = UIImage(named:"sports-choice-\(String(index))")
            myUtterance = AVSpeechUtterance(string: script[index-2])
            myUtterance.rate = 0.50
            
            if index-2 == 3 || index-2 == 4 {
                myUtterance.pitchMultiplier = 2.5
                synth.speak(myUtterance)
            }else {
                myUtterance.voice = AVSpeechSynthesisVoice(language: "en-ie")
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
