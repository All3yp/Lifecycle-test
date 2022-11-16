//
//  MyCustomAppDelegate.swift
//  Lifecycle
//
//  Created by Alley Pereira on 16/11/22.
//

import UIKit

class MyCustomAppDelegate: NSObject, UIApplicationDelegate {

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
		// Init some Manager, Service...
		print("🔴 MyCustomAppDelegate \(#function)")

		return true
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		print("🔴 MyCustomAppDelegate \(#function)")
	}
}
