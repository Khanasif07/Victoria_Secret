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
       // setupTabBarBackGroundView(itemIndex: 0)
//        self.bottomSafeArea = UIDevice.current.hasNotch ? 34.0 : 0.0
        self.navigationController?.navigationBar.isHidden = true
        UITabBar.appearance().tintColor = .blue
        UITabBar.appearance().unselectedItemTintColor = .red
        self.tabBar.backgroundColor = UIColor.white
        self.selectedIndex = 0
        self.delegate = self
        setupTabBar()
        firstTabBarSelected()
    }
    
    private func setupTabBarBackGroundView(itemIndex: Int) {
        self.tabBar.barTintColor = UIColor.blue
        guard let itemView = self.tabBar.items?[itemIndex].value(forKey: "view") as? UIView else {return}
//        printDebug(itemView.frame)
//        let viewOverTabBar = UIView()
        //viewOverTabBar.frame = itemView.frame
//        viewOverTabBar.centerX = itemView.origin.x
//        viewOverTabBar.frame.size = CGSize(width: 48.0, height: 48.0)
//        viewOverTabBar.backgroundColor = .red
//        viewOverTabBar.roundCorner([.bottomLeft,.bottomRight], radius: 10.0)
//        itemView.addSubview(viewOverTabBar)
        self.view.layoutIfNeeded()
    }
    
    private func createTabVC(vc: UIViewController.Type, storyBoard: AppStoryboard) -> UIViewController {
        let scene = UINavigationController(rootViewController: vc.instantiate(fromAppStoryboard: storyBoard))
        scene.navigationBar.isHidden = true
        scene.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        return scene
    }
    
    private func firstTabBarSelected(){
        let numberOfItems = CGFloat(self.tabBar.items!.count)
        let tabBarItemSize = CGSize(width: self.tabBar.frame.width / numberOfItems, height: self.tabBar.frame.height)
//        self.tabBar.selectedImageTintColor = .white
//        setupTabBarBackGroundView(itemIndex: 0)
//        self.tabBar.selectionIndicatorImage = UIImage.imageWithColor(color: .red, size: tabBarItemSize).resizableImage(withCapInsets: UIEdgeInsets.init(top: 0, left: 0, bottom: bottomSafeArea, right: 0))
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
//                    item.image = #imageLiteral(resourceName: "home")
//                    item.selectedImage = #imageLiteral(resourceName: "homeSelected")
                }
            case 1:
                if let item = self.tabBar.items?[index] {
//                    item.image = #imageLiteral(resourceName: "secondTab")
//                    item.selectedImage = #imageLiteral(resourceName: "secondTab")
                }
            default:
                if let item = self.tabBar.items?[index] {
//                    item.image = #imageLiteral(resourceName: "profile")
//                    item.selectedImage = #imageLiteral(resourceName: "profile")
                }
            }
        }
    }
}
extension TabBarController: UITabBarControllerDelegate{
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController){
        let numberOfItems = CGFloat(tabBar.items!.count)
        let tabBarItemSize = CGSize(width: tabBar.frame.width / numberOfItems, height: tabBar.frame.height)
//        tabBar.selectedImageTintColor = .white
        //setupTabBarBackGroundView(itemIndex: tabBarController.selectedIndex)
//       tabBar.selectionIndicatorImage = UIImage.imageWithColor(color: AppColors.appRedColor, size: tabBarItemSize).resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: bottomSafeArea, right: 10))
    
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}

