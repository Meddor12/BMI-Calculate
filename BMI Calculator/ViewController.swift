//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Meddor on 28.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var mainLabel: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "УЗНАЙТЕ ВАШ ИМТ"
        view.font = .boldSystemFont(ofSize: 40)
        view.numberOfLines = 0
        return view
    }()
    
    // -MARK:  Height UIElements
    var heihgt: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Рост"
        view.font = .boldSystemFont(ofSize: 18)
        return view
    }()
    var heightLabel: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "1.5м"
        view.font = .boldSystemFont(ofSize: 18)
        return view
    }()
    lazy var heightSlider: UISlider = {
        var view = UISlider()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.minimumValue = 0.1
        view.maximumValue = 3
        view.value = 1.5
        view.addTarget(self, action: #selector(heightSliderValue), for: .allTouchEvents)
        
        return view
    }()
    
    // -MARK: Width UIElements
    var width: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Вес"
        view.font = .boldSystemFont(ofSize: 18)
        return view
    }()
    var widthLabel: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "100Кг"
        view.font = .boldSystemFont(ofSize: 18)
        return view
    }()
    lazy var widthSlider: UISlider = {
        var view = UISlider()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.minimumValue = 1
        view.maximumValue = 200
        view.value = 100
        view.addTarget(self, action: #selector(widthSliderValue), for: .allTouchEvents)
        
        return view
    }()
    
    // -MARK: Button
    lazy var buttonONResultVC: UIButton = {
        var view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.setTitle("Посчиать", for: .normal)
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        view.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return view
    }()
    
    @objc func heightSliderValue(sender: UISlider) {
        let value = String(format: "%.2f", sender.value)
        heightLabel.text = " \(value)М "

    }
    @objc func widthSliderValue(sender: UISlider) {
        let value = String(format: "%.0f", sender.value)
        widthLabel.text = " \(value)Кг "
    }
    
    @objc func buttonPressed() {
        let height = heightSlider.value
        let width = widthSlider.value
        let IMB = Float(width) / (Float(height) * Float(height))
        if IMB < 18.5 {
            let realIMB = "ИМТ составило \(String(format: "%.0f", IMB))!     Ешьте больше пирогов!"
            mainLabel.text = realIMB
        } else if IMB < 24.9 {
            let realIMB = "ИМТ составило \(String(format: "%.0f", IMB))!      У вас нормальный вес!"
            mainLabel.text = realIMB
        } else {
            let realIMB = "ИМТ составило \(String(format: "%.0f", IMB))!     Ешьте меньше пирогов!"
            mainLabel.text = realIMB
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        stackConfigs()
        
    }
    // -MARK: UIElements Constraits
    func stackConfigs() {
        
        let heightStack = UIStackView(arrangedSubviews: [heihgt, heightLabel])
        heightStack.axis = .horizontal
        heightStack.alignment = .fill
        heightStack.distribution = .equalSpacing
        heightStack.translatesAutoresizingMaskIntoConstraints = false
        heightStack.heightAnchor.constraint(equalToConstant: 21.0).isActive = true
        
        let wodthStack = UIStackView(arrangedSubviews: [width, widthLabel])
        wodthStack.axis = .horizontal
        wodthStack.alignment = .fill
        wodthStack.distribution = .equalSpacing
        wodthStack.translatesAutoresizingMaskIntoConstraints = false
        wodthStack.heightAnchor.constraint(equalToConstant: 21.0).isActive = true
        
        let rootStack = UIStackView(arrangedSubviews: [mainLabel,heightStack,heightSlider,wodthStack,widthSlider,buttonONResultVC])
        rootStack.axis = .vertical
        rootStack.alignment = .fill
        rootStack.distribution = .fillProportionally
        rootStack.spacing = 20
        rootStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rootStack)
        
        let margin = view.layoutMarginsGuide
        
        
        NSLayoutConstraint.activate([
            mainLabel.widthAnchor.constraint(equalToConstant: 374),
            mainLabel.heightAnchor.constraint(equalToConstant: 520),
            
            buttonONResultVC.widthAnchor.constraint(equalToConstant: 374),
            buttonONResultVC.heightAnchor.constraint(equalToConstant: 51),
            
            rootStack.topAnchor.constraint(equalTo: margin.topAnchor),
            rootStack.bottomAnchor.constraint(equalTo: margin.bottomAnchor,constant: -8),
            rootStack.leadingAnchor.constraint(equalTo: margin.leadingAnchor),
            rootStack.trailingAnchor.constraint(equalTo: margin.trailingAnchor)
        ])

      
    }
}

