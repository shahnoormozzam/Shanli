//
//  BoysOrGirlsToyVC.swift
//  Shanli
//
//  Created by Li Zhaotian on 3/23/18.
//  Copyright © 2018 Li Zhaotian. All rights reserved.
//

import UIKit
import AVFoundation

class BoysOrGirlsToyVC: UIViewController {

    @IBOutlet weak var imageBkgd: UIImageView!
    var index = 1
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func `continue`(_ sender: Any) {
        
        if index == 10 {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let con = sb.instantiateViewController(withIdentifier: "BoysOrGirlsToyVC-2")
            self.present(con, animated: false, completion: nil)
            
        } else {
            
            imageBkgd.image = UIImage(named:"boys-or-girls-toy-\(String(index))")
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
