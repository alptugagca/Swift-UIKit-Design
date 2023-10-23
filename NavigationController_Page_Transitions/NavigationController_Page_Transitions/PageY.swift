//
//  PageY.swift
//  NavigationController_Page_Transitions
//
//  Created by Alptuğ Ağca on 22.10.2023.
//

import UIKit

class PageY: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func goMainPageNav(_ sender: Any)
    {
        navigationController?.popToRootViewController(animated: true)
    }
    
   
    
    }

