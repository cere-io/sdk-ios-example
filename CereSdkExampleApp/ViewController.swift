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
        // Do any additional setup after loading the view.
        
        sdk.initSDK(appId: "242", integrationPartnerUserId: "userID", controller: self)
        sdk.setDisplay(left: 5, top: 5, width: 90, height: 90)
        
        _ = sdk.onInitializationFinished {
            self.sendEventBtn.isHidden = false
        }
    }
    
    @IBAction func sendEvent(_ sender: UIButton) {
        sdk.sendEvent(eventType: "APP_LAUNCHED_TEST")
    }
    
    @IBAction func hide(_ sender: UIButton) {
        sdk.hide()
    }
}
