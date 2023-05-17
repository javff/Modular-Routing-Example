//
//  File.swift
//  
//
//  Created by Juan Andres Vasquez on 16/5/23.
//

import Foundation
import AppRouter
import UIKit

final class PDPScreenFactory: ScreenFactory {

    func makeViewController(path: [String], queryParams: [String : String], data: AnyObject?) -> UIViewController? {
        print("==== Make a PDP ViewControler ===")
        print("path \(path)")
        print("queryParams \(queryParams)")
        return PDPViewController()
    }
}
