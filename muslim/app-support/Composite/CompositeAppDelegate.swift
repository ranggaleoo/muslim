//
//  CompositeAppDelegate.swift
//  muslim
//
//  Created by Rangga Leo on 13/12/20.
//

import UIKit

typealias AppDelegateType = UIResponder & UIApplicationDelegate

class CompositeAppDelegate: AppDelegateType {
    private let appDelegates: [AppDelegateType]
    
    init(appDelegates: [AppDelegateType]) {
        self.appDelegates = appDelegates
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        appDelegates.forEach({ _ = $0.application?(application, didFinishLaunchingWithOptions: launchOptions) })
        return true
    }
}
