//
//  File.swift
//  
//
//  Created by Juan Andres Vasquez on 16/5/23.
//

import Foundation

public protocol RouteContainer: AnyObject {
    func registerRoute(_ route: String, with factory: ScreenFactory)
}
