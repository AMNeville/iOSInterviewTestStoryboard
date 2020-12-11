//
//  AppDelegate.swift
//  iOSInterviewTestStoryboard
//
//  Created by Adrian on 2020-12-10.
//

import UIKit
import GoogleMobileAds
import MoPub

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // AdMob
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
        // MoPub
        let sdkConfig = MPMoPubConfiguration(adUnitIdForAppInitialization: "4f117153f5c24fa6a3a92b818a5eb630")
                sdkConfig.loggingLevel = .info
                MoPub.sharedInstance().initializeSdk(with: sdkConfig, completion: nil)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

