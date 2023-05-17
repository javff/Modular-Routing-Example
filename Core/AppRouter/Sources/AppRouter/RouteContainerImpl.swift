//
//  File.swift
//  
//
//  Created by Juan Andres Vasquez on 16/5/23.
//

import Foundation

public final class RouterContainerImpl: RouteContainer, ScreenAbstractFactory {

    private var storageScreenFactory: [String: ScreenFactory] = [:]
    private let scheme: String

    public init(scheme: String) {
        self.scheme = scheme
    }

    public func getScreenFromRoute(_ route: String) -> ScreenFactory? {
        let formattedKey = route.replacingOccurrences(of: scheme, with: "")

        let matchingKey = storageScreenFactory.keys.first { formatKey in
            // matching without params
            if formatKey == route { return true }

            // matching with partams
            let format = formatKey
                .replacingOccurrences(of: scheme, with: "")
                .replacingOccurrences(of: "%d", with: "*")
                .replacingOccurrences(of: "%@", with: "*")

            let formattedConcreteKey = formattedKey.replacingOccurrences(of: "/", with: "*")
            let isMatchedWithParams = formattedConcreteKey.range(of: format, options: .regularExpression) != nil
            return isMatchedWithParams
        }

        return storageScreenFactory[matchingKey ?? ""]
    }

    public func registerRoute(_ route: String, with factory: ScreenFactory) {
        storageScreenFactory[route] = factory
    }
}
