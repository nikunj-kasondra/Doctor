//
//  ViewController.swift
//  DoctorApp
//
//  Created by Rujal on 4/4/18.
//  Copyright © 2018 Nikunj. All rights reserved.
//

import UIKit

class DashController: UIViewController {

    @IBOutlet weak var aboutViewWidth: NSLayoutConstraint!
    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var tapView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutView.isHidden = true
        tapView.isHidden = true
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(DashController.tapClicked(gesture:)))
        tapView.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view, typically from a nib.
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
    }
    @IBAction func btnAboutUsClicked(_ sender: Any) {
        aboutView.isHidden = true
        tapView.isHidden = true
        self.aboutViewWidth.constant = 0
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
    }
    @IBAction func btnUserClicked(_ sender: Any) {
    }
}

