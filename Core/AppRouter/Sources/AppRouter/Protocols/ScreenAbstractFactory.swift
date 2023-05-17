//
//  File 2.swift
//  
//
//  Created by Juan Andres Vasquez on 16/5/23.
//

import Foundation

public protocol ScreenAbstractFactory: AnyObject {
    func getScreenFromRoute(_ route: String) -> ScreenFactory?
}
