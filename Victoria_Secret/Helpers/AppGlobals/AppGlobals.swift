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
