//
//  HooplaInterviewApp.swift
//  HooplaInterview
//
//  Created by Andrew McLean on 1/7/25.
//

import SwiftUI

@main
struct HooplaInterviewApp: App {
	@UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
	
    var body: some Scene {
        WindowGroup {
			AppView()
        }
    }
	
}
