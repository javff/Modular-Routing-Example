//
//  AppRouter.swift
//
//
//  Created by Juan Andres Vasquez on 16/5/23.
//

import UIKit

public final class AppRouter {

    public static let shared = AppRouter()
    private var routeFactory: ScreenAbstractFactory?

    private init() {}

    public static func initialize(routeFactory: ScreenAbstractFactory) {
        self.shared.routeFactory = routeFactory
    }

    public func getScreenFrom(_ route: String, with data: AnyObject?) -> UIViewController? {
        // split route in components
        let (scheme, host, path, queryParams) = extractURLComponents(from: route)

        // validate route
        guard let scheme, let host, let path else { return nil }

        let validRoute = "\(scheme)://\(host)\(path)"

        // get screenFactory using scheme/host/path
        guard let screenFactory = routeFactory?.getScreenFromRoute(validRoute) else { return nil }

        // make view controller using data 
        let viewController = screenFactory.makeViewController(
            path: path.components(separatedBy: "/"),
            queryParams: queryParams,
            data: data
        )

        return viewController
    }

    private func extractURLComponents(from urlString: String) -> (scheme: String?, host: String?, path: String?, queryParams: [String: String]) {
        guard let url = URL(string: urlString) else {
            return (nil, nil, nil, [:])
        }

        let scheme = url.scheme
        let host = url.host
        let path = url.path

        var queryParams: [String: String] = [:]
        if let queryItems = URLComponents(string: urlString)?.queryItems {
            queryParams = [String: String]()

            for queryItem in queryItems {
                if let value = queryItem.value {
                    queryParams[queryItem.name] = value
                }
            }
        }

        return (scheme, host, path, queryParams)
    }
}
