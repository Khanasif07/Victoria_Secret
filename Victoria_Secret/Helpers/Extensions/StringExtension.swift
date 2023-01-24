//
//  StringExtension.swift
//  Victoria_Secret
//
//  Created by Admin on 24/01/23.
//

import Foundation
import UIKit
extension String{
    func localizedString(lang:String) ->String {
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
    
    func checkIfValidCharaters(_ validityExression : ValidCharaters) -> Bool {
        let regEx = validityExression.rawValue
        let test = NSPredicate(format:"SELF MATCHES %@", regEx)
        return test.evaluate(with: self)
    }
    
    func checkIfValid(_ validityExression : ValidityExression) -> Bool {
        let regEx = validityExression.rawValue
        let test = NSPredicate(format:"SELF MATCHES %@", regEx)
        return test.evaluate(with: self)
    }
    
}


extension UIButton{
    open override var isEnabled: Bool{
        didSet {
            alpha = isEnabled ? 1.0 : 0.5
            backgroundColor = isEnabled ? .red : .red
            setTitleColor(isEnabled ? .white : .white, for: .normal)
        }
    }
}


