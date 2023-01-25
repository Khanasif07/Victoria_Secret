//
//  AppGlobals.swift
//  Victoria_Secret
//
//  Created by Admin on 25/01/23.
//

import Foundation
import UIKit
var isUserLoggedin: Bool {
    let token = UserDefaults.standard.object(forKey: "isLogin") as? Bool ?? false
    return token
}

extension UIApplication {
    var currentWindow: UIWindow? {
        if #available(iOS 13.0, *) {
           return connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        }
    }
}
