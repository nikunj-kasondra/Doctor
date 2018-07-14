//
//  ViewController.swift
//  DoctorApp
//
//  Created by Rujal on 4/4/18.
//  Copyright © 2018 Nikunj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblDoctor: UILabel!
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var aboutViewWidth: NSLayoutConstraint!
    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var tapView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutView.isHidden = true
        tapView.isHidden = true
        Common.storyboard = self.storyboard!
        Common.navigationController = self.navigationController!
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(ViewController.tapClicked(gesture:)))
        tapView.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        SideMenuView.btnIndex = 0
        SideMenuView.add(toVC: self, toView: self.view)
        if let type = UserDefaults.standard.value(forKey: "type") as? Int {
            if type == 1 {
                lblDoctor.text = UserDefaults.standard.value(forKey: "name") as? String
                lblUser.text = "USER LOGIN"
            } else if type == 2 {
                lblUser.text = UserDefaults.standard.value(forKey: "name") as? String
                lblDoctor.text = "DOCTOR LOGIN"
            } else {
                lblDoctor.text = "DOCTOR LOGIN"
                lblUser.text = "USER LOGIN"
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func tapClicked(gesture:UITapGestureRecognizer) {
        aboutView.isHidden = true
        tapView.isHidden = true
        self.aboutViewWidth.constant = 0
    }
    @IBAction func btnMenuClicked(_ sender: Any) {
        if !SideMenuView.isOpen {
            
            SideMenuView.open(toView: self.view)
            
        } else {
            
            SideMenuView.close(toView: self.view)
            
        }
    }
    @IBAction func btnAboutUsClicked(_ sender: Any) {
        aboutView.isHidden = true
        tapView.isHidden = true
        self.aboutViewWidth.constant = 0
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "AboutUsVC")
        Navigation.push_POP_to_ViewController(destinationVC: VC!, navigationsController: self.navigationController!, isAnimated: true)
    }
    
    @IBAction func btnDotMenuClicked(_ sender: Any) {
        aboutView.isHidden = false
        tapView.isHidden = false
        UIView.animate(withDuration: 0.5) {
            self.aboutViewWidth.constant = 150
        }
    }
    
    @IBAction func btnNotificationClicked(_ sender: Any) {
    }
    
    @IBAction func btnDoctorClicked(_ sender: Any) {
        LoginVC.loginType = 1
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        Navigation.push_POP_to_ViewController(destinationVC: VC!, navigationsController: self.navigationController!, isAnimated: true)
    }
    @IBAction func btnUserClicked(_ sender: Any) {
        LoginVC.loginType = 2
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        Navigation.push_POP_to_ViewController(destinationVC: VC!, navigationsController: self.navigationController!, isAnimated: true)
    }
}

