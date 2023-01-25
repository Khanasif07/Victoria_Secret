//
//  TabBarController.swift
//  Victoria_Secret
//
//  Created by Admin on 25/01/23.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - IBOutlets
    //===========================
    
    // MARK: - Variables
    //===========================
    var bottomSafeArea: CGFloat = 0.0
    
    // MARK: - Lifecycle
    //===========================
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if #available(iOS 11.0, *) {
            self.bottomSafeArea = view.safeAreaInsets.bottom
        } else {
            self.bottomSafeArea = bottomLayoutGuide.length
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if #available(iOS 11.0, *) {
            self.bottomSafeArea = view.safeAreaInsets.bottom
        } else {
            self.bottomSafeArea = bottomLayoutGuide.length
        }
    }
    // MARK: - IBActions
    //===========================
    
}

// MARK: - Extension for functions
//====================================
extension TabBarController {
    
    private func initialSetup() {
        self.navigationController?.navigationBar.isHidden = true
        self.selectedIndex = 0
        self.delegate = self
        if #available(iOS 15, *) {
            let BarButtonItemAppearance = UIBarButtonItem.appearance()
            BarButtonItemAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.backgroundColor = .white
            tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.red, .font: UIFont.boldSystemFont(ofSize: 15.0)]
            tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.red, .font: UIFont.boldSystemFont(ofSize: 15.0)]
            tabBar.standardAppearance = tabBarAppearance
            tabBar.scrollEdgeAppearance = tabBarAppearance
        }
        setupTabBar()
    }
    
    private func createTabVC(vc: UIViewController.Type, storyBoard: AppStoryboard) -> UIViewController {
        let scene = UINavigationController(rootViewController: vc.instantiate(fromAppStoryboard: storyBoard))
        scene.navigationBar.isHidden = false
        scene.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        return scene
    }
    
    func setupTabBar() {
        let firstScene = createTabVC(vc: ProductsVC.self, storyBoard: .Dashboard)
        let secondScene = createTabVC(vc: ProfileVC.self, storyBoard: .Dashboard)
        self.viewControllers = [firstScene, secondScene]
        guard let tabBarItems = self.tabBar.items else {return}
        for index in 0...tabBarItems.endIndex - 1 {
            switch index {
            case 0:
                if let item = self.tabBar.items?[index] {
                    item.title = "Products"
                }
            case 1:
                if let item = self.tabBar.items?[index] {
                    item.title = "Profile"
                }
            default:
                break
            }
        }
    }
}
extension TabBarController: UITabBarControllerDelegate{
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController){
    
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}

