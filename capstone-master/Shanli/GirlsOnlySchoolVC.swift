//
//  GirlsOnlySchoolVC.swift
//  Shanli
//
//  Created by Li Zhaotian on 3/23/18.
//  Copyright © 2018 Li Zhaotian. All rights reserved.
//

import UIKit
import AVFoundation

class GirlsOnlySchoolVC: UIViewController {

    
    @IBOutlet weak var imageBkgd: UIImageView!
    var index = 1
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string:"")
    let script = [
        "If it's finally the time for our girl to go to schoo, how about we choose a girls-only elementary school?", //0 - 1 mom
        "What? Why", //1 - 2 dad
        "Oh I'm just really worried about our baby get annoyed by those boys......", //2 m
        "I have experienced that when I was at her age.", //3 m
        "Boys always play tricks and laugh at girls for stupid reasons...", //4 m
        "Haha that's normal.", //5 d
        "But as you said, they are stupid. So why bother?", //6 d
        "I want to make sure that our girl lives in safe and secure environment without suffering from the unnecessary pressure", //7 m
        "I only know those little things are stupid when I grow up, but as little girl I couldn't see that clear.", //8 - 9 m
        "You are just being too sensitive and emotional...", //9 - 10 d
        "Come on, kids nowadays are better than our generation, and teachers will take it more seriously.", //10 - 11 d
        "No! You don't understand.", //11 - 12 m
        "You must be one of those boys who would play tricks on me back in elementary school...", //12 - 13 m
        "What do you think my girl? Which school do you want?" //13 - 14 d
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
        
        if index == 15 {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let con = sb.instantiateViewController(withIdentifier: "GirlsOnlySchoolVC-2")
            self.present(con, animated: false, completion: nil)
            
        } else if index == 1 {
            
            imageBkgd.image = UIImage(named:"girls-only-school-\(String(index))")
            index += 1
            
        } else {
            
            imageBkgd.image = UIImage(named:"girls-only-school-\(String(index))")
            myUtterance = AVSpeechUtterance(string: script[index-1])
            myUtterance.rate = 0.50
            
            if index-1 == 1 || index-1 == 5 || index-1 == 6 || index-1 == 9 || index-1 == 10 || index-1 == 13 {
                myUtterance.voice = AVSpeechSynthesisVoice(language: "en-gb")
                synth.speak(myUtterance)
            }else {
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
