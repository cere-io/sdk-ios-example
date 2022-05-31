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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sdk.initSDK(appId: "2354", integrationPartnerUserId: "", controller: self, type:
                        CereSDK.AuthType.trusted("1234567890", "112112"))
        sdk.setDisplay(left: 5, top: 5, width: 90, height: 90)
        
        _ = sdk.onInitializationFinished {
            self.sendEventBtn.isHidden = false
        }
    }
    
    @IBAction func sendEvent(_ sender: UIButton) {
        sdk.sendEvent(eventType: "LIVE_ONE_CONTEXTUAL_ENTERED")
    }
    
    @IBAction func hide(_ sender: UIButton) {
        sdk.hide()
    }
}
