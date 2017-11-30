//
//  MainController.swift
//  AR-menu
//
//  Created by Erik Hric on 28/11/2017.
//  Copyright © 2017 Erik Hric. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    
    var arController:ViewController? {
        didSet {
            if (vrMenu != nil) {
                arController?.contentController = vrMenu
            }
        }
    }
    
    
    var vrMenu: VRMenuController? {
        didSet {
            if arController != nil {
                arController?.contentController = vrMenu
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let ar = segue.destination as? ViewController {
            self.arController = ar
        } else if let menu = segue.destination as? VRMenuController {
            self.vrMenu = menu
        }
    }
 

}
