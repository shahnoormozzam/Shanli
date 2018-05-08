//
//  MathProblemVC.swift
//  Shanli
//
//  Created by Li Zhaotian on 3/24/18.
//  Copyright © 2018 Li Zhaotian. All rights reserved.
//

import UIKit
import AVFoundation

class MathProblemVC: UIViewController {

    @IBOutlet weak var imageBkgd: UIImageView!
    var index = 1
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string:"")
    let script = [
        "How's everything going with maths homework?", //0 - 2
        "Didn't work out?", //1 - 3
        "Don't worry about it. You don't need to work that hard.", //2 - 4
        "You are a girl; in the future you just need to worry about how to find good husband.", //3 - 5
        "Maths is not for girls", //4 - 6
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
        
        if index == 8 {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let con = sb.instantiateViewController(withIdentifier: "MathProblemVC-2")
            self.present(con, animated: false, completion: nil)
            
        } else if index == 1 || index == 7 {
            
            imageBkgd.image = UIImage(named:"math-problem-\(String(index))")
            index += 1
            
        } else {
            
            imageBkgd.image = UIImage(named:"math-problem-\(String(index))")
            myUtterance = AVSpeechUtterance(string: script[index-2])
            myUtterance.rate = 0.50
            myUtterance.voice = AVSpeechSynthesisVoice(language: "en-gb")
            synth.speak(myUtterance)
            
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
