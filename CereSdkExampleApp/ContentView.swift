//
//  ContentView.swift
//  CereSdkExampleApp
//
//  Created by Pavel_Viarkhouski on 9/10/20.
//  Copyright © 2020 CerebellumNetwork. All rights reserved.
//

import SwiftUI
import CereSDK

func useSdk() -> String {
    let sdk = CereSDK()
    return sdk.initSDK()
}

struct ContentView: View {
    var body: some View {
        Text(useSdk())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
