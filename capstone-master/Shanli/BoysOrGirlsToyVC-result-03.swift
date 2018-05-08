//
//  BoysOrGirlsToyVC-result-03.swift
//  Shanli
//
//  Created by Li Zhaotian on 3/24/18.
//  Copyright © 2018 Li Zhaotian. All rights reserved.
//

import UIKit

class BoysOrGirlsToyVC_result_03: UIViewController {

    @IBOutlet weak var imageBkgd: UIImageView!
    var index = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func `continue`(_ sender: Any) {
        
        if index == 3 {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let con = sb.instantiateViewController(withIdentifier: "GirlsOnlySchoolVC")
            self.present(con, animated: false, completion: nil)
            
        } else {
            
            imageBkgd.image = UIImage(named:"boys-or-girls-toy-result-no-\(String(index))")
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
