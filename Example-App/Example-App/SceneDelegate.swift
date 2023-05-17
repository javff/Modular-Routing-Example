//
//  SceneDelegate.swift
//  Example-App
//
//  Created by Juan Andres Vasquez on 16/5/23.
//

import UIKit
import AppRouter
import Checkout_Flow_Feature
import PDP_Feature

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appRouterContainer = RouterContainerImpl(scheme: "myApp://")

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        inizializeAppRouter()
        registerModules()

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = getRootViewController()
        window?.makeKeyAndVisible()
    }

    private func getRootViewController() -> UIViewController {
        let rootViewController = AppRouter.shared.getScreenFrom("myApp://pdp/1", with: nil)!
        let navigationController = UINavigationController(rootViewController: rootViewController)
        return navigationController
    }

    private func inizializeAppRouter() {
        AppRouter.initialize(routeFactory: appRouterContainer)
    }

    private func registerModules() {
        let routeModules: [RegisterRouteModule] = [
            PDPRegisterRoute(),
            CheckoutRegisterRoute()
        ]

        routeModules.forEach {
            $0.register(appRouterContainer)
        }
    }
}

