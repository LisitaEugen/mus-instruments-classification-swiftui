//
//  InstrumentsMLApp.swift
//  InstrumentsML
//
//  Created by Lisita Evgheni on 19.05.21.
//

import SwiftUI

@main
struct InstrumentsMLApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(InstrumentsViewModel())
        }
    }
}
