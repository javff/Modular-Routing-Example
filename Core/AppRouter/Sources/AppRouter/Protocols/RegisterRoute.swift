//
//  File.swift
//  
//
//  Created by Juan Andres Vasquez on 16/5/23.
//

import Foundation

public protocol RegisterRouteModule: AnyObject {
    func register(_ container: RouteContainer)
}
