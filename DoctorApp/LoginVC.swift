//
//  LoginVC.swift
//  DoctorApp
//
//  Created by Rujal on 6/3/18.
//  Copyright © 2018 Nikunj. All rights reserved.
//

import UIKit
import Alamofire

class LoginVC: UIViewController {

    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    static var loginType = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        if LoginVC.loginType == 1 {
            lblHeader.text = "Doctor Login"
        } else {
            lblHeader.text = "User Login"
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnLoginClicked(_ sender: Any) {
        if txtUsername.text! == "" {
            Alert.show(API.appName, message: "Please enter username", onVC: self)
        } else if txtPassword.text! == "" {
            Alert.show(API.appName, message: "Please enter password", onVC: self)
        } else {
            if Reachability.isConnectedToNetwork() {
                callLoginAPI()
            } else {
                Alert.internetConnectionError()
            }
        }
    }
    func callLoginAPI() {
        Progress.show(toView: self.view)
        var type = ""
        if LoginVC.loginType == 1 {
            type = "doctor"
        } else {
            type = "user"
        }
        let param = ["type":type,"username":txtUsername.text!,"password":txtPassword.text!]
        Alamofire.request(API.login, method: .post, parameters: param, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    do {
                        let dict = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! NSDictionary
                        if dict.value(forKey: "statuscode") as! String == "200" {
                            if LoginVC.loginType == 1 {
                                UserDefaults.standard.set(1, forKey: "type")
                               let name = (dict.value(forKey: "data") as! NSDictionary).value(forKey: "name") as! String
                               let id = (dict.value(forKey: "data") as! NSDictionary).value(forKey: "id") as! String
                                UserDefaults.standard.set(name, forKey: "name")
                                UserDefaults.standard.set(id, forKey: "id")
                                self.navigationController?.popViewController(animated: true)
                            } else {
                                UserDefaults.standard.set(2, forKey: "type")
                                let name = (dict.value(forKey: "data") as! NSDictionary).value(forKey: "name") as! String
                                let id = (dict.value(forKey: "data") as! NSDictionary).value(forKey: "id") as! String
                                UserDefaults.standard.set(name, forKey: "name")
                                UserDefaults.standard.set(id, forKey: "id")
                                self.navigationController?.popViewController(animated: true)

                            }
                        } else {
                            Alert.show(API.appName, message: dict.value(forKey: "message") as! String, onVC: self)
                        }
                    } catch _ {
                        
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
extension LoginVC:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtUsername {
            txtPassword.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
