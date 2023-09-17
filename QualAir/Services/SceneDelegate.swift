//
//  SceneDelegate.swift
//  QualAir
//
//  Created by Milan Dutta on 9/17/23.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)

        let contentView = ContentView()
        window?.rootViewController = UIHostingController(rootView: contentView)

        window?.makeKeyAndVisible()
    }
}

