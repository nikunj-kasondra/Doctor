//
//  SideMenuView.swift
//  OccuCare
//
//  Created by PC23 on 03/08/17.
//  Copyright © 2017 Sapphire. All rights reserved.
//

import UIKit

class SideMenuView: UIView {
    
    //@IBOutlet weak var myAcView: UIView!
    @IBOutlet weak var anciensView: UIView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var cantineView: UIView!
    @IBOutlet weak var transportView: UIView!
    @IBOutlet weak var actiView: UIView!
    @IBOutlet weak var annocesView: UIView!
    //@IBOutlet weak var settView: UIView!
    
    @IBOutlet weak var homeView: UIView!
    
    @IBOutlet weak var lblAnnoces: UILabel!
    
    @IBOutlet weak var lblHome: UILabel!
    @IBOutlet weak var lblanciens: UILabel!
    @IBOutlet weak var lblinfo: UILabel!
    @IBOutlet weak var lblcantine: UILabel!
    @IBOutlet weak var lbltransport: UILabel!
    @IBOutlet weak var lblacti: UILabel!
    
    //@IBOutlet weak var lblsett: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    static var sideMenu: UIView = UIView()
    static var isOpen = Bool()
    static var menuSize: CGFloat = 60
    static var trasparentView = UIView()
    static var toView = UIView()
    static var btnIndex: Int = 0
    
    
    override func draw(_ rect: CGRect) {
        setUI()
        NotificationCenter.default.addObserver(self, selector: #selector(SideMenuView.setLabelMethod), name: NSNotification.Name(rawValue: "setLabel"), object: nil)
    }
    
    // MARK: Set UI
    @objc func setLabelMethod() {
        lblUserName.text = "HI, GUEST"
    }
    
    func setUI() {
        
        self.frame = CGRect(x: -(UIScreen.main.bounds.size.width - SideMenuView.menuSize), y: 0, width: UIScreen.main.bounds.size.width - SideMenuView.menuSize, height: UIScreen.main.bounds.size.height)
        SideMenuView.sideMenu = self
        
        SideMenuView.trasparentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        SideMenuView.trasparentView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3)
        //tblSideMenu.register(UINib(nibName: "SideMenuCell", bundle: nil), forCellReuseIdentifier: "newCell")
        addTapGesture()
        addSwipeGesture()
        if let login = UserDefaults.standard.value(forKey: "name") as? String{
            print(login)
            lblUserName.text = "Hi \(login)"
            
        } else {
            lblUserName.text = "HI, GUEST"
            //settView.isHidden = true
        }
        
        switch SideMenuView.btnIndex {
        case 0:
            DispatchQueue.main.async {
                
                self.homeView.backgroundColor = UIColor.init(red: 10.0/255, green: 79.0/255, blue: 145.0/255, alpha: 1.0)
            }
        case 1:
            DispatchQueue.main.async {
               
               self.anciensView.backgroundColor = UIColor.init(red: 10.0/255, green: 79.0/255, blue: 145.0/255, alpha: 1.0)
            }
        case 2:
            DispatchQueue.main.async {
                
                self.infoView.backgroundColor = UIColor.init(red: 10.0/255, green: 79.0/255, blue: 145.0/255, alpha: 1.0)
            }
        case 4:
            DispatchQueue.main.async {
                
                self.cantineView.backgroundColor = UIColor.init(red: 10.0/255, green: 79.0/255, blue: 145.0/255, alpha: 1.0)
            }
        case 3:
            DispatchQueue.main.async {
                
                self.transportView.backgroundColor = UIColor.init(red: 10.0/255, green: 79.0/255, blue: 145.0/255, alpha: 1.0)
            }
        case 5:
            DispatchQueue.main.async {
                
                self.annocesView.backgroundColor = UIColor.init(red: 10.0/255, green: 79.0/255, blue: 145.0/255, alpha: 1.0)
            }
        case 6:
            DispatchQueue.main.async {
                
                self.actiView.backgroundColor = UIColor.init(red: 10.0/255, green: 79.0/255, blue: 145.0/255, alpha: 1.0)
            }
        
        
        default:
            break
        }
        
    }
    
    // MARK: Add Tap gesture
    
    func addTapGesture() {
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(onTap))
        SideMenuView.trasparentView.addGestureRecognizer(tapGesture)
    }
    
    // MARK: Add Swipe gesture
    
    func addSwipeGesture() {
        
        let swipeRight = UISwipeGestureRecognizer.init(target: self, action: #selector(swipeRightSide))
        swipeRight.direction = .right
        SideMenuView.toView.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer.init(target: self, action: #selector(onTap))
        swipeLeft.direction = .left
        SideMenuView.toView.addGestureRecognizer(swipeLeft)
        
    }
    
    // MARK: Right swipe on menu call
    
    @objc func swipeRightSide() {
        SideMenuView.open(toView: SideMenuView.toView)
    }
    
    // MARK: Tap on menu call
    
    @objc func onTap() {
        SideMenuView.close(toView: SideMenuView.toView)
    }
    
    // MARK: Add sidemenu
    
    static func add(toVC: UIViewController, toView: UIView) {
        
        let sideMenuView = Bundle.main.loadNibNamed("SideMenu", owner: self, options: nil)?[0] as! SideMenuView
        UIApplication.shared.keyWindow!.addSubview(sideMenuView)
        SideMenuView.toView = toView
        
    }
   
    
    // MARK: Open sidemenu
    
    static func open(toView: UIView) {
        
        SideMenuView.isOpen = true
        toView.addSubview(SideMenuView.trasparentView)
        UIView.animate(withDuration: 0.3) {
            SideMenuView.sideMenu.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - menuSize, height: UIScreen.main.bounds.size.height)
//            toView.frame = CGRect(x: SideMenuView.sideMenu.frame.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }
        
    }
    
    // MARK: Close sidemenu
    
    static func close(toView: UIView) {
        
        SideMenuView.isOpen = false
        SideMenuView.trasparentView.removeFromSuperview()
        
        UIView.animate(withDuration: 0.3) {
            SideMenuView.sideMenu.frame = CGRect(x: -(UIScreen.main.bounds.size.width - SideMenuView.menuSize), y: 0, width: UIScreen.main.bounds.size.width - SideMenuView.menuSize, height: UIScreen.main.bounds.size.height)
//            toView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }
        
    }
    
    
    @IBAction func btnHomeClicked(_ sender: Any) {
        SideMenuView.close(toView: SideMenuView.toView)
        let VC = Common.storyboard.instantiateViewController(withIdentifier: "DashVC")
        self.push_POP_to_ViewController(destinationVC: VC, navigationsController: Common.navigationController, isAnimated: true)
    }
    
    


    @IBAction func btnActivityClicked(_ sender: Any) {
        SideMenuView.close(toView: SideMenuView.toView)
//        let VC = Common.storyboard.instantiateViewController(withIdentifier: "ActivityController")
//        self.push_POP_to_ViewController(destinationVC: VC, navigationsController: Common.navigationController, isAnimated: true)
    }
    @IBAction func btnTransportClicke(_ sender: Any) {
        SideMenuView.close(toView: SideMenuView.toView)
//        let VC = Common.storyboard.instantiateViewController(withIdentifier: "TransportController")
//        self.push_POP_to_ViewController(destinationVC: VC, navigationsController: Common.navigationController, isAnimated: true)
    }
    @IBAction func btnCantineClicked(_ sender: Any) {
        SideMenuView.close(toView: SideMenuView.toView)
//        let VC = Common.storyboard.instantiateViewController(withIdentifier: "CantineController")
//        self.push_POP_to_ViewController(destinationVC: VC, navigationsController: Common.navigationController, isAnimated: true)
    }
    
    @IBAction func btnAnnocesClicked(_ sender: Any) {
        SideMenuView.close(toView: SideMenuView.toView)
//        let VC = Common.storyboard.instantiateViewController(withIdentifier: "AnnonceVC")
//        self.push_POP_to_ViewController(destinationVC: VC, navigationsController: Common.navigationController, isAnimated: true)
    }
    
    @IBAction func btnInfoClicked(_ sender: Any) {
        SideMenuView.close(toView: SideMenuView.toView)
//        let VC = Common.storyboard.instantiateViewController(withIdentifier: "LeCollegeController")
//        self.push_POP_to_ViewController(destinationVC: VC, navigationsController: Common.navigationController, isAnimated: true)
    }
    @IBAction func btnAniciensClicked(_ sender: Any) {
        SideMenuView.close(toView: SideMenuView.toView)
//        let VC = Common.storyboard.instantiateViewController(withIdentifier: "AnciensController")
//        self.push_POP_to_ViewController(destinationVC: VC, navigationsController: Common.navigationController, isAnimated: true)
    }
    
    @IBAction func btnMyAccountClicked(_ sender: Any) {
        SideMenuView.close(toView: SideMenuView.toView)
    }
    
    func push_POP_to_ViewController(destinationVC: UIViewController, navigationsController: UINavigationController, isAnimated: Bool) {
        var vcFound: Bool = false
        let viewControllers: NSArray = (navigationsController.viewControllers as NSArray)
        var indexofVC: NSInteger = 0
        for  vc  in viewControllers {
            if (vc as AnyObject).nibName == (destinationVC.nibName) {
                vcFound = true
                break
            } else {
                indexofVC += 1
            }
        }
        if vcFound == true {
            DispatchQueue.main.async {
                navigationsController .popToViewController(viewControllers.object(at: indexofVC) as! UIViewController, animated: false)
            }
        } else {
            DispatchQueue.main.async {
                navigationsController .pushViewController(destinationVC, animated: true)
            }
        }
    }
    

}

