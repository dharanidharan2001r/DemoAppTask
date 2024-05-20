//
//  AnalyticsView.swift
//  DemoAppTask
//
//  Created by Dharani dharan R on 16/05/24.
//

import Foundation
import UIKit


public class ContentView: UIView {
    
    lazy public var analyticsView: AnalyticsView = {
        let view =  AnalyticsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy public var searchLinksView: SearchLinksView = {
        let view =  SearchLinksView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy public var linksTableView: LinksTableView = {
        let view = LinksTableView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        prepareSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func prepareSubviews() {
        self.addSubview(analyticsView)
        NSLayoutConstraint.activate([
            analyticsView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            analyticsView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            analyticsView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            analyticsView.heightAnchor.constraint(equalToConstant: 492)
        ])
        
        self.addSubview(searchLinksView)
        NSLayoutConstraint.activate([
            searchLinksView.topAnchor.constraint(equalTo: analyticsView.overallChart.bottomAnchor, constant: 20),
            searchLinksView.leftAnchor.constraint(equalTo: analyticsView.leftAnchor),
            searchLinksView.rightAnchor.constraint(equalTo: analyticsView.rightAnchor),
            searchLinksView.heightAnchor.constraint(equalToConstant: 36)
        ])
        
        self.addSubview(linksTableView)
        NSLayoutConstraint.activate([
            linksTableView.topAnchor.constraint(equalTo: searchLinksView.bottomAnchor, constant: 20),
            linksTableView.leftAnchor.constraint(equalTo: analyticsView.leftAnchor),
            linksTableView.rightAnchor.constraint(equalTo: analyticsView.rightAnchor),
            linksTableView.heightAnchor.constraint(equalToConstant: 592)
        ])
    }
}


//width: Hug (328px)px;
//height: Hug (592px)px;
//gap: 20px;
//opacity: 0px;
