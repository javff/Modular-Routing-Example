//
//  File.swift
//  
//
//  Created by Juan Andres Vasquez on 16/5/23.
//

import Foundation
import AppRouter
import UIKit

final class PDPViewController: UIViewController {

    let button: UIButton = {
        let button = UIButton()
        button.setTitle("A Next button", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.backgroundColor = .red
        navigationItem.title = "PDP Module"
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
    }

    @objc func buttonTapped() {
        let nextController = AppRouter.shared.getScreenFrom("myApp://checkout/cart?userId=29", with: nil)
        guard let nextController else { return }
        navigationController?.pushViewController(nextController, animated: true)
    }
}
