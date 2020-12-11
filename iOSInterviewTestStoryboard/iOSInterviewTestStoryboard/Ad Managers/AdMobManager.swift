//
//  AdMobManager.swift
//  iOSInterviewTestStoryboard
//
//  Created by Adrian on 2020-12-11.
//

import GoogleMobileAds

class AdMobManager {
    
    var bannerView: GADBannerView?
    var isBannerShown: Bool = false
    
    func initializeBanner(vc: ViewController) {
        // Add Banner to View
        let bannerViewToBuild = GADBannerView(adSize: kGADAdSizeBanner)

        bannerViewToBuild.translatesAutoresizingMaskIntoConstraints = false
        vc.view.addSubview(bannerViewToBuild)
        vc.view.addConstraints(
                [NSLayoutConstraint(item: bannerViewToBuild,
                                  attribute: .bottom,
                                  relatedBy: .equal,
                                  toItem: vc.view.safeAreaLayoutGuide,
                                  attribute: .bottom,
                                  multiplier: 1,
                                  constant: 0),
               NSLayoutConstraint(item: bannerViewToBuild,
                                  attribute: .centerX,
                                  relatedBy: .equal,
                                  toItem: vc.view,
                                  attribute: .centerX,
                                  multiplier: 1,
                                  constant: 0)
              ])
        
        bannerView = bannerViewToBuild
        
        print ("AdMob Initialized")
    }
    
    func loadBanner(vc: ViewController) -> Bool {
        if bannerView != nil {
            // Config banner properties
            bannerView!.adUnitID = "ca-app-pub-3940256099942544/2934735716"
            bannerView!.rootViewController = vc
            
            isBannerShown = false
            
            return true
        } else {
            return false
        }
    }
    
    func showBanner() -> Bool {
        if bannerView != nil
        && bannerView!.adUnitID != nil {
            if !isBannerShown {
                bannerView!.load(GADRequest())
                isBannerShown = true
            } else {
                bannerView!.isHidden = false
                isBannerShown = true
            }
            
            return true
        } else {
            return false
        }
    }
    
    func hideBanner() {
        if bannerView != nil {
            bannerView!.isHidden = true
        }
    }
}
