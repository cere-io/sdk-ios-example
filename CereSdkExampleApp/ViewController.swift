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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let sdk = CereSDK()
        sdk.initSDK(appId: "243", integrationPartnerUserId: "userID", controller: self)
        
        _ = sdk.onInitializationFinished {
            sdk.sendEvent(eventType: "APP_LAUNCHED_TEST")
        }
    }


}
