//
//  File.swift
//  
//
//  Created by Juan Andres Vasquez on 16/5/23.
//

import Foundation
import AppRouter

public final class CheckoutRegisterRoute: RegisterRouteModule {

    public init() {}

    public func register(_ container: RouteContainer) {
        container.registerRoute(
            "myApp://checkout/cart",
            with: CheckoutCartScreenFactory()
        )
    }
}
