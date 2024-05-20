//
//  File.swift
//  DemoAppTask
//
//  Created by Dharani dharan R on 16/05/24.
//

import Foundation
import UIKit

public class NavBarView: UIView {
    
    lazy public var title: UITextField = {
        let view = UITextField()
        view.font = UIFont.systemFont(ofSize: 24)
        view.textColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy public var settingsButton: UIButton = {
        let view = UIButton(type: .custom)
        view.layer.cornerRadius = 8
        if let image = UIImage(named: "SettingsButton") {
            view.setImage(image, for: .normal)
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy public var titleView: UIView = {
        let view =  UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        prepareSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setUpView() {
        self.backgroundColor = .systemBlue
    }
    
    public func prepareSubviews() {
        titleView.addSubview(title)
        NSLayoutConstraint.activate([
            title.leftAnchor.constraint(equalTo: titleView.leftAnchor),
            title.centerYAnchor.constraint(equalTo: titleView.centerYAnchor, constant: 3),
            title.heightAnchor.constraint(equalToConstant: 24),
            title.widthAnchor.constraint(equalToConstant: 118)
        ])
        
        titleView.addSubview(settingsButton)
        NSLayoutConstraint.activate([
            settingsButton.heightAnchor.constraint(equalToConstant: 40),
            settingsButton.widthAnchor.constraint(equalToConstant: 40),
            settingsButton.rightAnchor.constraint(equalTo: titleView.rightAnchor)
        ])
        
        self.addSubview(titleView)
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            titleView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            titleView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            titleView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
