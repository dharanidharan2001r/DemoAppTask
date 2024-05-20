//
//  HomeView.swift
//  DemoAppTask
//
//  Created by Dharani dharan R on 16/05/24.
//

import Foundation
import UIKit


public class HomeView: UIView {
    
    lazy public var navBarView: NavBarView = {
        let view =  NavBarView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy public var contentView: ContentView = {
        let view =  ContentView()
        view.layer.cornerRadius = 18;
        view.layer.masksToBounds = true;
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
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
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func prepareSubviews() {
        self.addSubview(navBarView)
        NSLayoutConstraint.activate([
            navBarView.topAnchor.constraint(equalTo: self.topAnchor),
            navBarView.leftAnchor.constraint(equalTo: self.leftAnchor),
            navBarView.rightAnchor.constraint(equalTo: self.rightAnchor),
            navBarView.heightAnchor.constraint(equalToConstant: 124)
        ])
        
        self.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            contentView.leftAnchor.constraint(equalTo: self.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: self.rightAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 1918)
        ])
    }
}
