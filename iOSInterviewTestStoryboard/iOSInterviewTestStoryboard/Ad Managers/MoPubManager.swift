//
//  MoPubManager.swift
//  iOSInterviewTestStoryboard
//
//  Created by Adrian on 2020-12-11.
//

import MoPub

class MoPubManager {
    
    var interstitial: MPInterstitialAdController = MPInterstitialAdController(forAdUnitId: "4f117153f5c24fa6a3a92b818a5eb630")
    
    func initializeInterstitial(delegate: MPInterstitialAdControllerDelegate) {
        interstitial.delegate = delegate
    }
    
    func loadInterstitial() {
        interstitial.loadAd()
    }
    
    func showInterstitial(vc: ViewController) -> Bool {
        if interstitial.ready {
            self.interstitial.show(from: vc)
            return true
        } else {
            return false
        }
    }
}
