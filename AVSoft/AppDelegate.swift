//
//  AppDelegate.swift
//  AVSoft
//
//  Created by Роман Ковайкин on 16.06.2020.
//  Copyright © 2020 Роман Ковайкин. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        reloadApp()
        return true
    }

    func isUserLoggedIn() ->UIViewController {
        if !UserDefaults.standard.bool(forKey: "isUserLoggedIn"){
            return loginViewController()
        }else{
            return EditingViewController()
        }
    }
    
    func reloadApp(){
        let VC = isUserLoggedIn()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = VC
        window?.makeKeyAndVisible()
        
    }

}

