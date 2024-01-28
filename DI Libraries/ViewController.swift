//
//  ViewController.swift
//  DI Libraries
//
//  Created by Ayokunle Pro on 1/28/24.
//

import UIKit
import Swinject

protocol ColorProviding {
    var color: UIColor { get }
}

class ColorProvider: ColorProviding {
    var color: UIColor {
        let color: [UIColor] = [.systemRed, .systemTeal, .systemBlue]
        var randomColor = color.randomElement()!
        return randomColor
    }
}

class ViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton(frame: .init(x: .zero, y: .zero, width: 180, height: 48))
        button.backgroundColor = .red.withAlphaComponent(0.12)
        button.setTitle("Proceed", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        button.layer.borderWidth = 0.35
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(handleProceed), for: .touchUpInside)
        button.center = view.center
        view.addSubview(button)
        return button
    }()
    
    @objc private func handleProceed() {
        
        guard let vc = container.resolve(ColorViewController.self) else { return }
        present(vc, animated: true)
    }
    
    let container: Container = {
        let container = Container()
        
        
        container.register(ColorViewController.self) { resolver in
            ColorViewController(colorProvider: resolver.resolve(ColorProviding.self))
        }
        
        container.register(ColorProviding.self) { _ in
            ColorProvider()
        }
        return container
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
    }


}

class ColorViewController: UIViewController {
    
    var colorProvider: ColorProviding?
    
    init(colorProvider: ColorProviding? = nil) {
        self.colorProvider = colorProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colorProvider?.color
    }
    
}

