//
//  ViewController.swift
//  Shanli
//
//  Created by Li Zhaotian on 3/22/18.
//  Copyright © 2018 Li Zhaotian. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var imageBkgd: UIImageView!
    var index = 1;
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string:"")
    let script = [
    "Honey, you are going to be 6 this year! You are a grown up girl! It's time to go to elementary school", //0 - 2 dad
    "Why so early? Our baby is so young. She might get hurt at school!", //1 - 3 m
    "Let her stay at home for one year more, enjoy her childhood!", //2 m
    "All kids go to school at 6. and I don't see why it would be different for our girl.", //3 d
    "Did you hear the story from our neighbor?", //4 m
    "Their daughter went to school very early but it turned out that she couldn't blend in her classmates...", //5 m
    "other naughty boys might even laugh at ther for being so yound and so clumsy in class...", //6 m
    "It's not because of her age! And everyone went throught that; it's normal.", //7 d
    "Let's ask our baby girl: do you want to go to school at 6?" //8 - 10 m
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func `continue`(_ sender: Any) {
        
        if index == 11 {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let con = sb.instantiateViewController(withIdentifier: "GoToSchoolAt6VC")
            self.present(con, animated: false, completion: nil)
            
            
        } else if index == 1 {
            
            imageBkgd.image = UIImage(named:"go-to-school-at-6-\(String(index))")
            index += 1
            
        } else {
            
            imageBkgd.image = UIImage(named:"go-to-school-at-6-\(String(index))")
            myUtterance = AVSpeechUtterance(string: script[index-2])
            myUtterance.rate = 0.50
            
            if index-2 == 0 || index-2 == 3 || index-2 == 7 {
                myUtterance.voice = AVSpeechSynthesisVoice(language: "en-gb")
                synth.speak(myUtterance)
            }else {
                synth.speak(myUtterance)
            }
            index += 1
        }
    }
    
}

