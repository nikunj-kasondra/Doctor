//
//  AboutUsVC.swift
//  DoctorApp
//
//  Created by Rujal on 6/3/18.
//  Copyright © 2018 Nikunj. All rights reserved.
//

import UIKit

class AboutUsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnCompuClicked(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "http://www.compu-vision.me")!)
    }
    
}
