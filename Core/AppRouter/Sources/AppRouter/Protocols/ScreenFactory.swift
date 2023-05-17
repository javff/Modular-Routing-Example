//
//  File.swift
//  
//
//  Created by Juan Andres Vasquez on 16/5/23.
//

import Foundation
import UIKit

public protocol ScreenFactory: AnyObject {
    func makeViewController(
        path: [String],
        queryParams: [String: String],
        data: AnyObject?) -> UIViewController?
}
