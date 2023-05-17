//
//  File.swift
//  
//
//  Created by Juan Andres Vasquez on 16/5/23.
//

import Foundation
import AppRouter
import UIKit

final class CheckoutCartScreenFactory: ScreenFactory {
    func makeViewController(path: [String],
                            queryParams: [String : String],
                            data: AnyObject?) -> UIViewController? {
        print("==== Make a Checkout Cart Controller ====")
        print("path \(path)")
        print("queryParams \(queryParams)")
        return CheckoutCartViewController()
    }
}
