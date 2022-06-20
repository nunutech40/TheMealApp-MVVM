//
//  AppDelegate.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 5/4/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configureRootViewController()
        
        return true
    }
    
    private func configureRootViewController() {
        window = UIWindow(frame: screenFrame)
        window?.rootViewController = UINavigationController(rootViewController: SplashViewController())
        window?.makeKeyAndVisible()
    }


}

