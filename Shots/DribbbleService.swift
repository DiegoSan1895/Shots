//
//  DribbbleService.swift
//  Shots
//
//  Created by DiegoSan on 3/20/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import Foundation
import SVProgressHUD
import Alamofire
import SwiftyUserDefaults

let DribbbleOauthURL = "https://dribbble.com/oauth/authorize"
let DribbbleOAuthToken = "https://dribbble.com/oauth/token"
let DribbbleClientID = "6e28e4d650a89c26c99b8059853017baf9936ba61774064580b4c422b0e84e90"
let DribbbleClientSecret = "f1e5849d30a3ee3d10647c0219f9ed1eae26d2b1ec529cb09ad18a631b5e41a2"
let dribbbleBaseURL = "https://api.dribbble.com/v1"
let callbackURL = "shots://oauth"

extension DefaultsKeys{
    static let dribbbleToken = DefaultsKey<String?>("dribbbleToken")
    static let dribbbleLike = DefaultsKey<[String: AnyObject]>("dribbbeLike")
}

extension NSURL{
    func queryDictionary() -> [String: String] {
        let components = self.query?.componentsSeparatedByString("&")
        var dictionary = [String: String]()
        
        for pairs in components ?? []{
            let pair = pairs.componentsSeparatedByString("=")
            if pair.count == 2{
                dictionary[pair[0]] = pair[1]
            }
        }
        return dictionary
    }
}

func dribbbleTokenWithCode(code: String, complete: (finish: Bool) -> Void){
    dispatch_async(dispatch_get_main_queue()) { () -> Void in
        SVProgressHUD.showWithStatus("正在连接...")
    }
    
    let parameters = [
        "client_id": DribbbleClientID,
        "client_secret": DribbbleClientSecret,
        "code": code,
        "redirect_url": callbackURL
    ]
    
    Alamofire.request(.POST, DribbbleOAuthToken, parameters: parameters).responseJSON { (response) -> Void in
        
        print("Success: \(response.result.isSuccess)")
        
        if let json = response.result.value as? [String: AnyObject], access_token = json["access_token"] as? String{
            
            print("User OAuth finisher")
            
            Defaults[.dribbbleToken] = access_token
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                SVProgressHUD.dismiss()
            })
            
            complete(finish: true)
        }else{
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                SVProgressHUD.showErrorWithStatus("Please tyr again")
            })
            
            complete(finish: false)
        }
    }
}