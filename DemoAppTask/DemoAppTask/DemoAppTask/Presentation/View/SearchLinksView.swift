//
//  SearchLinksView.swift
//  DemoAppTask
//
//  Created by Dharani dharan R on 16/05/24.
//

import Foundation
import UIKit


public class SearchLinksView: UIView {
    
    lazy public var topLinksButton: UIButton = {
        let view = UIButton(type: .custom)
        view.layer.cornerRadius = 18
        view.backgroundColor = .systemBlue
        view.setTitle("Top Links", for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy public var recentLinksButton: UIButton = {
        let view = UIButton(type: .custom)
        view.layer.cornerRadius = 18
        view.setTitle("Recent Links", for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        view.setTitleColor(.lightGray, for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy public var searchButton: UIButton = {
        let view = UIButton(type: .custom)
        view.layer.cornerRadius = 8
        if let image = UIImage(named: "SearchButton") {
            view.setImage(image, for: .normal)
        }
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
//        self.backgroundColor = .white
    }
    
    public func prepareSubviews() {
        self.addSubview(topLinksButton)
        NSLayoutConstraint.activate([
            topLinksButton.topAnchor.constraint(equalTo: self.topAnchor),
            topLinksButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            topLinksButton.leftAnchor.constraint(equalTo: self.leftAnchor),
            topLinksButton.widthAnchor.constraint(equalToConstant: 116)
        ])
        
        self.addSubview(recentLinksButton)
        NSLayoutConstraint.activate([
            recentLinksButton.topAnchor.constraint(equalTo: self.topAnchor),
            recentLinksButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            recentLinksButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            recentLinksButton.widthAnchor.constraint(equalToConstant: 101)
        ])
        
        self.addSubview(searchButton)
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: self.topAnchor),
            searchButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            searchButton.rightAnchor.constraint(equalTo: self.rightAnchor),
            searchButton.widthAnchor.constraint(equalToConstant: 36)
        ])
    }
    
}
//width: 69px;
//height: 24px;
//gap: 0px;
//opacity: 0px;

//font-family: Figtree;
//font-size: 16px;
//font-weight: 600;
//line-height: 24px;
//text-align: left;


//width: Hug (101px)px;
//height: Hug (36px)px;
//padding: 6px 16px 6px 16px;
//gap: 10px;
//border-radius: 18px 0px 0px 0px;
//opacity: 0px;
