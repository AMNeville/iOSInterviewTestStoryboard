//
//  ViewController.swift
//  iOSInterviewTestStoryboard
//
//  Created by Adrian on 2020-12-10.
//

import UIKit
import GoogleMobileAds
import MoPub

class ViewController: UIViewController, MPInterstitialAdControllerDelegate {
    
    // MARK:- Managers
    let adMobManager: AdMobManager = AdMobManager()
    let moPubManager: MoPubManager = MoPubManager()
    
    // MARK:- UI Outlets
    @IBOutlet var initAdMobButton: UIButton?
    @IBOutlet var loadAdMobButton: UIButton?
    @IBOutlet var showAdMobButton: UIButton?
    @IBOutlet var hideAdMobButton: UIButton?

    @IBOutlet var initMoPubButton: UIButton?
    @IBOutlet var loadMoPubButton: UIButton?
    @IBOutlet var showMoPubButton: UIButton?

    @IBOutlet var mapleMediaButton: UIButton?
    @IBOutlet var notificationButton: UIButton?
    
    // Mark:- Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetAdMobButtons()
        resetMoPubButtons()
    }
    
    // MARK:- UI Logic
    
    func resetAdMobButtons() {
        initAdMobButton?.isEnabled = true
        loadAdMobButton?.isEnabled = false
        showAdMobButton?.isEnabled = false
        hideAdMobButton?.isEnabled = false
    }
    
    func resetMoPubButtons() {
        initMoPubButton?.isEnabled = true
        loadMoPubButton?.isEnabled = false
        showMoPubButton?.isEnabled = false
    }
    
    func showSimpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }

    // Mark:- UI Interaction
    
    // AdMob
    @IBAction func onInitAdMobButton() {
        adMobManager.initializeBanner(vc: self)
        loadAdMobButton?.isEnabled = true
        showAdMobButton?.isEnabled = false
        hideAdMobButton?.isEnabled = false
    }
    
    @IBAction func onLoadAdMobButton() {
        if adMobManager.loadBanner(vc: self) {
            showAdMobButton?.isEnabled = true
        } else {
            showSimpleAlert(title: "Error", message: "AdMob Banner Load Failed")
        }
    }
    
    @IBAction func onShowAdMobButton() {
        if adMobManager.showBanner() {
            hideAdMobButton?.isEnabled = true
        } else {
            showSimpleAlert(title: "Error", message: "AdMob Banner Show Failed")
        }
    }
    
    @IBAction func onHideAdMobButton() {
        adMobManager.hideBanner()
        showAdMobButton?.isEnabled = true
        hideAdMobButton?.isEnabled = false
    }
    
    // MoPub
    @IBAction func onInitMoPubButton() {
        moPubManager.initializeInterstitial(delegate: self)
        loadMoPubButton?.isEnabled = true
    }
    
    @IBAction func onLoadMoPubButton() {
        moPubManager.loadInterstitial()
        showMoPubButton?.isEnabled = true
    }
    
    @IBAction func onShowMoPubButton() {
        if moPubManager.showInterstitial(vc: self) {
            print ("MoPub Interstitial Shown")
        } else {
            showSimpleAlert(title: "Error", message: "MoPub Interstitial Show Failed")
        }
    }
    
    // Misc
    @IBAction func onMapleMediaButton() {
        if let url = URL(string: "http://www.maplemedia.io/") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func onNotificationButton() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            
            if let error = error {
                self.showSimpleAlert(title: "Error", message: error.localizedDescription)
            }
        }
    }
}
