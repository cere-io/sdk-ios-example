//
//  ViewController.swift
//  CereSdkExampleApp
//
//  Created by Pavel_Viarkhouski on 9/11/20.
//  Copyright © 2020 CerebellumNetwork. All rights reserved.
//

import UIKit
import CereSDK

class ViewController: UIViewController {
    
    var sdk: CereSDK = CereSDK.instance
    
    @IBOutlet weak var sendEventBtn: UIButton!
    @IBOutlet weak var hasNfts: UIButton!
    @IBOutlet weak var uiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sdk.initSDK(appId: "2354", integrationPartnerUserId: "", controller: self, type:
                        CereSDK.AuthType.trusted("1234567890", "112112"), environment: "dev")
//        sdk.setDisplay(left: 5, top: 5, width: 90, height: 90)
        
        _ = sdk.onInitializationFinished {
            self.sendEventBtn.isHidden = false
            self.hasNfts.isHidden = false
        }
        
        _ = sdk.onJavascriptEventReceivedHandler({ event, payload in
            if("HEADER_CLICKED" == event) {
                self.sdk.hide()
            }
        })
        
        _ = sdk.onHasNftsEventReceivedHandler({ event, payload in
            if payload.range(of: "true") != nil {
                self.uiLabel.textColor = UIColor.green
                self.uiLabel.text = "User has NFTs"
            } else {
                self.uiLabel.textColor = UIColor.red
                self.uiLabel.text = "No user's NFTs"
            }
        })
    }
    
    @IBAction func sendEvent(_ sender: UIButton) {
        sdk.sendEvent(eventType: "LIVE_ONE_CONTEXTUAL_ENTERED")
    }
    
    @IBAction func sendHasNfts(_ sender: UIButton) {
        sdk.hasNfts()
    }
    
    @IBAction func hide(_ sender: UIButton) {
        sdk.hide()
        self.uiLabel.text = ""
    }
}
