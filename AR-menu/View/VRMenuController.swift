//
//  VRMenuController.swift
//  AR-menu
//
//  Created by Erik Hric on 28/11/2017.
//  Copyright © 2017 Erik Hric. All rights reserved.
//

import UIKit

class VRMenuController: UIViewController {

    
    @IBOutlet weak var vrContentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        self.view.backgroundColor = UIColor.clear
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func firstItemClicked(_ sender: UIButton) {
        print("first")
        sender.backgroundColor = UIColor.red
    }
    
    
    @IBAction func secondItemClicked(_ sender: UIButton) {
        print("second")
        sender.backgroundColor = UIColor.green
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
