//
//  AFWrapper.swift
//  OccuCare
//
//  Created by PC23 on 29/07/17.
//  Copyright © 2017 Sapphire. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AFWrapper: NSObject {

    // MARK: Post API call with cache
    /// Use for post API call with loading cache response
    /// - Parameters:
    ///   - strURL: Pass API url
    ///   - params: Pass API request body
    ///   - headers: Pass API header
    ///   - success: Return sucess if API return sucess response
    ///   - failure: Return fail if API response getting fail
    
    class func requestPOSTURLwithCache(_ strURL: String, params: [String : AnyObject]?, headers: [String : String]?, success: @escaping (JSON) -> Void, failure: @escaping (Error) -> Void) {
        
        Alamofire.request(strURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { (responseObject) -> Void in
            print(responseObject)
            
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                success(resJson)
            }
            if responseObject.result.isFailure {
                let error: Error = responseObject.result.error!
                failure(error)
            }
        }
    }
    
    // MARK: Post API call without cache
    /// Use for post API call without loading cache response
    /// - Parameters:
    ///   - strURL: Pass API url
    ///   - params: Pass API request body
    ///   - headers: Pass API header
    ///   - success: Return sucess if API return response
    ///   - failure: Return fail if API response getting fail
    
    class func requestPOSTURL(_ strURL: String, params: [String : AnyObject]?, headers: [String : String]?, success: @escaping (JSON) -> Void, failure: @escaping (Error) -> Void) {
        
        Alamofire.SessionManager.default.requestWithoutCache(strURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { (responseObject) -> Void in
            print(responseObject)
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                success(resJson)
            }
            if responseObject.result.isFailure {
                let error: Error = responseObject.result.error!
                failure(error)
            }
        }
    }
    
    // MARK: Post API call with cache
    /// Use for GET API call with loading cache response
    /// - Parameters:
    ///   - strURL: Pass API url
    ///   - success: Return sucess if API return sucess response
    ///   - failure: Return fail if API response getting fail
    
    class func requestGETURLwithCache(_ strURL: String, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        Alamofire.request(strURL).responseJSON { (responseObject) -> Void in
            
            print(responseObject)
            
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                success(resJson)
            }
            if responseObject.result.isFailure {
                let error: Error = responseObject.result.error!
                failure(error)
            }
        }
    }
    
    // MARK: Post API call without cache
    /// Use for get API call without loading cache response
    /// - Parameters:
    ///   - strURL: Pass API url
    ///   - success: Return sucess if API return sucess response
    ///   - failure: Return fail if API response getting fail
    
    class func requestGETURL(_ strURL: String, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        Alamofire.SessionManager.default.requestWithoutCache(strURL).responseJSON { (responseObject) -> Void in
            
            print(responseObject)
            
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                success(resJson)
            }
            if responseObject.result.isFailure {
                let error: Error = responseObject.result.error!
                failure(error)
            }
        }
    }    
}
