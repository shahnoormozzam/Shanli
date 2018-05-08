//
//  CousinsHomeVC-result-01.swift
//  Shanli
//
//  Created by Li Zhaotian on 4/14/18.
//  Copyright © 2018 Li Zhaotian. All rights reserved.
//

import UIKit
import WebKit

class CousinsHomeVC_result_01: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string:"https://www.washingtonpost.com/news/parenting/wp/2017/10/16/sexual-harassment-among-teens-is-pervasive-heres-how-parents-can-help-change-it/?utm_term=.c462ec3b9b74")
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
