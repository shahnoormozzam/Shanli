//
//  MathProblemVC-result-04.swift
//  Shanli
//
//  Created by Li Zhaotian on 4/5/18.
//  Copyright © 2018 Li Zhaotian. All rights reserved.
//

import UIKit
import WebKit

class MathProblemVC_result_04: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string:"https://www.aauw.org/research/why-so-few/")
        let request = URLRequest(url:url!)

        webView.load(request)
        // Do any additional setup after loading the view.
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
