//
//  AppRouter.swift
//  Victoria_Secret
//
//  Created by Admin on 25/01/23.
//

import Foundation
import UIKit

enum AppRouter {
    static func checkAppInitializationFlow() {
        if isUserLoggedin {
            self.goToDashboard()
        } else {
            self.goToLogin()
        }
    }
    static func goToDashboard() {
        let homeScene = TabBarController.instantiate(fromAppStoryboard: .Dashboard)
        setAsWindowRoot(homeScene)
    }
    
    static func goToLogin(){
        let scene = LoginVC.instantiate(fromAppStoryboard: .Main)
        setAsWindowRoot(scene)
    }
    
    // MARK: - General Method to set Root VC
    //=========================================
    static func setAsWindowRoot(_ viewController: UIViewController) {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.setNavigationBarHidden(true, animated: true)
        UIView.transition(with: AppDelegate.shared.window!, duration: 0.33, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
            AppDelegate.shared.window?.rootViewController = navigationController
        }, completion: nil)
        AppDelegate.shared.window?.becomeKey()
        AppDelegate.shared.window?.makeKeyAndVisible()
    }
}

extension UIViewController{
    func showAlert( title : String = "", msg : String,_ completion : (()->())? = nil) {
        let titleFont = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]
        let messageFont = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]
        
        _ = NSMutableAttributedString(string: title, attributes: titleFont)
        _ = NSMutableAttributedString(string: msg, attributes: messageFont)
        DispatchQueue.main.async {
            let alertViewController = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { (action : UIAlertAction) -> Void in
                alertViewController.dismiss(animated: true, completion: nil)
                completion?()
            }
            alertViewController.addAction(okAction)
            self.present(alertViewController, animated: true, completion: nil)
        }
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(self)
    }
    
    class var storyboardID : String {
        return "\(self)"
    }
}

enum AppStoryboard : String {
    case Main,Dashboard
}
extension AppStoryboard {
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    func viewController<T : UIViewController>(_ viewControllerClass : T.Type,
                        function : String = #function, // debugging purposes
                        line : Int = #line,
                        file : String = #file) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        return scene
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
