//
//  gif-test.swift
//  Shanli
//
//  Created by Li Zhaotian on 4/7/18.
//  Copyright © 2018 Li Zhaotian. All rights reserved.
//

import UIKit

class gif_test: UIViewController {

    @IBOutlet weak var gif: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        gif.loadGif(name:"simpsons-playground")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
