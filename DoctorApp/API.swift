//
//  API.swift
//  DoctorApp
//
//  Created by Rujal on 6/3/18.
//  Copyright © 2018 Nikunj. All rights reserved.
//

import UIKit

class API: NSObject {
    static var appName = "Saint Louis Hospital"
    static var serverURL = "http://hstlouis.com/portal/"
    static var login = API.serverURL + "api/validate.php?"
}
