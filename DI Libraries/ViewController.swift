//
//  ViewController.swift
//  DI Libraries
//
//  Created by Ayokunle Pro on 1/28/24.
//

import UIKit
import Swinject

class ViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton(frame: .init(x: .zero, y: .zero, width: 180, height: 48))
        button.setTitle("Proceed", for: .normal)
        button.center = view.center
        button.addTarget(self, action: #selector(handleProceed), for: .touchUpInside)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        button.layer.borderWidth = 0.35
        button.layer.cornerRadius = 10
        button.backgroundColor = .red.withAlphaComponent(0.12)
        view.addSubview(button)
        return button
    }()
    
    @objc private func handleProceed() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
    }


}

class ColorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

