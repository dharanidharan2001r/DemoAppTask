//
//  AnalyticsView.swift
//  DemoAppTask
//
//  Created by Dharani dharan R on 16/05/24.
//

import Foundation
import UIKit


public class AnalyticsView: UIView {
    
    lazy public var greetingsView: UIView = {
        let view =  UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy public var greeting: UITextField = {
        let view = UITextField()
        view.font = UIFont.systemFont(ofSize: 16)
        view.textColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy public var greetingButton: UIButton = {
        let view = UIButton(type: .custom)
        view.layer.cornerRadius = 8
        if let image = UIImage(named: "GreetingButton") {
            view.setImage(image, for: .normal)
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy public var userName: UITextField = {
        let view = UITextField()
        view.font = UIFont.systemFont(ofSize: 25)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy public var overallChart: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "OverallChartImage")
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true;
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
//        self.backgroundColor = .lightGray
    }
    
    public func prepareSubviews() {
        greetingsView.addSubview(greeting)
        NSLayoutConstraint.activate([
            greeting.topAnchor.constraint(equalTo: greetingsView.topAnchor),
            greeting.leftAnchor.constraint(equalTo: greetingsView.leftAnchor),
            greeting.heightAnchor.constraint(equalToConstant: 24),
            greeting.widthAnchor.constraint(equalToConstant: 105)
        ])
        
        greetingsView.addSubview(userName)
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: greeting.bottomAnchor),
            userName.leftAnchor.constraint(equalTo: greetingsView.leftAnchor),
            userName.heightAnchor.constraint(equalToConstant: 32),
            userName.widthAnchor.constraint(equalToConstant: 127)
        ])
        
        greetingsView.addSubview(greetingButton)
        NSLayoutConstraint.activate([
            greetingButton.rightAnchor.constraint(equalTo: greetingsView.rightAnchor),
            greetingButton.centerYAnchor.constraint(equalTo: userName.centerYAnchor),
            greetingButton.heightAnchor.constraint(equalToConstant: 28),
            greetingButton.widthAnchor.constraint(equalToConstant: 28),
        ])
        
        self.addSubview(greetingsView)
        NSLayoutConstraint.activate([
            greetingsView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            greetingsView.topAnchor.constraint(equalTo: self.topAnchor),
            greetingsView.widthAnchor.constraint(equalToConstant: 163),
            greetingsView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        self.addSubview(overallChart)
        NSLayoutConstraint.activate([
            overallChart.topAnchor.constraint(equalTo: greetingsView.bottomAnchor, constant: 10),
            overallChart.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            overallChart.widthAnchor.constraint(equalToConstant: 360),
            overallChart.heightAnchor.constraint(equalToConstant: 232)
        ])
    }
}

//width: Hug (163px)px;
//height: Hug (60px)px;
//gap: 4px;
//opacity: 0px;
//---

//width: 105px;
//height: 24px;
//gap: 0px;
//opacity: 0px;

//font-family: Figtree;
//font-size: 16px;
//font-weight: 400;
//line-height: 24px;
//text-align: left;
//---

//width: 127px;
//height: 32px;
//gap: 0px;
//opacity: 0px;

//font-family: Figtree;
//font-size: 24px;
//font-weight: 600;
//line-height: 32px;
//text-align: left;
//---

//width: 28px;
//height: 28px;
//left: 28px;
//gap: 0px;
//opacity: 0px;
//angle: -180 deg;
//---

//width: 328px;
//height: 200px;
//gap: 12px;
//border-radius: 8px 0px 0px 0px;
//opacity: 0px;

