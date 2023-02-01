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
        view.text = "CALCULATE YOUR BMI"
        view.font = .boldSystemFont(ofSize: 40)
        view.numberOfLines = 0
        return view
    }()
    // -MARK:  Height UIElements
    var heihgt: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Height"
        view.font = .boldSystemFont(ofSize: 18)
        return view
    }()
    var heightLabel: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "1.5m"
        view.font = .boldSystemFont(ofSize: 18)
        return view
    }()
    var heightSlider: UISlider = {
        var view = UISlider()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // -MARK: Width UIElements
    var width: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Width"
        view.font = .boldSystemFont(ofSize: 18)
        return view
    }()
    var widthLabel: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "100Kg"
        view.font = .boldSystemFont(ofSize: 18)
        return view
    }()
    var widthSlider: UISlider = {
        var view = UISlider()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // -MARK: Button
    var buttonONResultVC: UIButton = {
        var view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("CALCULATE", for: .normal)
        view.backgroundColor = .white
        
        return view
    }()
    
    
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

